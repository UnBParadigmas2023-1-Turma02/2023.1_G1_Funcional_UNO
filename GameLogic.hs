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
    showHand [] = "empty"
    showHand (c:cs) = cardToString c ++ ", " ++ showHand cs

playTurn :: GameState -> Player -> IO GameState
playTurn gameState@(deck, players, topCard, idxPlayer, direction) player = do

  -- Imprime o Jogador + Mão
  putStrLn (playerToString player) 

  -- SISTEMA DE COMPRA
  -- ATUALIZA DECK

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

  -- RETIRAR A CARTAJOGADA DA MÃO DO JOGADOR
  
  return (deck, players, cartaJogada, (idxPlayer + 1) `mod` length players, direction)

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