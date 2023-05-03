module GameLogic where

import Deck

import Types

-- Imprime Card
cardToString :: Card -> String
cardToString (Card typeCard color value) = show typeCard ++ " " ++ show color ++ " " ++ show value
  -- Print Deck
  --mapM_ (putStrLn . cardToString) deckShuffled 

-- Distribui 7 cartas cada jogador
dealCards :: Deck -> [Player] -> ([Player], Deck)
dealCards d [] = ([], d)
dealCards d ((name, hand):players) = 
    let (newHand, newDeck) = splitAt 7 d
        newPlayer = (name, hand ++ newHand)
        (updatedPlayers, finalDeck) = dealCards newDeck players
    in (newPlayer : updatedPlayers, finalDeck)

-- Retorna a primeira carta do baralho e o resto do deck (listas são imutáveis, então tem que criar uma nova variável sempre)
drawCard :: Deck -> (Card, Deck)
drawCard deck = (head deck, tail deck)

-- Imprime Player
playerToString :: Player -> String
playerToString (name, hand) =
  name ++ "'s hand: " ++ showHand hand
  where
    showHand :: Hand -> String
    showHand [] = ""
    showHand (c:cs) = cardToString c ++ ", " ++ showHand cs

-- Comprar carta do Monte
buyCardFromDeck :: Deck -> Player -> (Deck, Player)
buyCardFromDeck (c:cs) (name, hand) = (cs, (name, hand ++ [c]))

-- Atualiza a lista de jogadores
updatePlayerList :: Int -> a -> [a] -> [a]
updatePlayerList idx newPlayer players = take idx players ++ [newPlayer] ++ drop (idx+1) players

-- Retira uma carta da lista
dropCardAtIndex :: Int -> Player -> Player
dropCardAtIndex index (name, hand) = (name, take (index - 1) hand ++ drop 1 (drop (index - 1) hand))

-- Jogar uma rodada
playTurn :: GameState -> Player -> IO GameState
playTurn gameState@(deck, players, topCard, idxPlayer, direction) player = do

  -- Imprime o Jogador + Mão
  putStrLn (playerToString player) 

  -- Compra carta do monte
  putStrLn "Quer comprar uma carta do monte? (s/n)"
  choice <- getLine
  let (newDeck, playerAfterBuying) = if choice == "s" then buyCardFromDeck deck player else (deck, player)  

  -- Imprime o Jogador + Mão
  putStrLn (playerToString playerAfterBuying) 

  -- Pergunta o INDEX da carta que o jogador deseja jogar (MELHORAR ESSA FUNÇÃO)
  putStrLn "Qual carta deseja jogar? "
  playerNumStr <- getLine
  let playerNum = read playerNumStr :: Int

  -- Imprime a carta que o jogador selecionou (NOVA TOPO CARD, CASO VÁLIDA)
  let (_, hand) = player
  let cartaJogada = (hand !! playerNum)
  putStrLn (cardToString cartaJogada)

  -- VALIDA cartaJogada

  -- PULAR A JOGADA (se comprou carta e não deu pra jogar)

  -- Retira a cartaJogada da mão do Jogador
  let newPlayer = dropCardAtIndex playerNum playerAfterBuying
  
  return (newDeck, updatePlayerList idxPlayer newPlayer players, cartaJogada, (idxPlayer + 1) `mod` length players, direction)

-- Jogar o jogo
playGame :: GameState -> IO ()
playGame (deck, players, topCard, idxPlayer, direction) = do
  -- Seleciona o jogador que vai jogar no momento
  let curPlayer = players !! idxPlayer

  -- Faz a nova jogada e salva no novo GameState
  newGameState <- playTurn (deck, players, topCard, idxPlayer, direction) curPlayer
  let (newDeck, newPlayers, newTopCard, newIdxPlayer, newDirection) = newGameState

  -- LEO: VERIFICAR UNO
  --      TERMINAR JOGO

  playGame (newDeck, newPlayers, newTopCard, newIdxPlayer, newDirection)