module GameLogic where

import Deck
import SpecialCards
import Types
import UI.PlayCard
import ValidGame


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

-- Retira uma carta da lista
dropCardAtIndex :: Int -> Player -> Player
dropCardAtIndex index (name, hand) = (name, take (index - 1) hand ++ drop 1 (drop (index - 1) hand))

-- Verifica se algum jogardor possui apenas 1 carta e imprime que ele está de UNO
checkUno :: Player -> IO ()
checkUno (name, [card]) = putStrLn (name ++ " has only one card! UNO!")
checkUno _ = return ()

-- Identifica vencedor
checkWinner :: [Player] -> String
checkWinner players =
  case filter (\(_, hand) -> length hand == 0) players of
    [(winnerName, _)] -> winnerName
    _        -> ""


-- Jogar uma rodada
playTurn :: GameState -> Player -> IO GameState
playTurn gameState@(deck, players, topCard, idxPlayer, direction) player = do

  -- Imprime o Jogador + Mão
  putStrLn (playerToString player)

  -- Não faz nada ainda
  renderPlayCard gameState

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
    if validCard topCard cartaJogada 
          then do 
          let newTopCard = Card cartaJogada
          cartaJogada value

  -- PULAR A JOGADA (se comprou carta e não deu pra jogar)

  -- Retira a cartaJogada da mão do Jogador
  let newPlayer = dropCardAtIndex playerNum playerAfterBuying

  -- Realiza Funções de Cartas Especiais
  let (deckAfterSpecialCards, playersAfterSpecialCards, topCard, newIdxPlayerAfterSpecialCards, newDirectionAfterSpecialCards) = dealSpecialCards (newDeck, updatePlayerList idxPlayer newPlayer players, cartaJogada, idxPlayer, direction)

  -- Verifica se o Jogador está de Uno
  checkUno newPlayer
  -- putStrLn newIdxPlayerAfterSpecialCards
  -- putStrLn newDirectionAfterSpecialCards
  return (deckAfterSpecialCards, playersAfterSpecialCards, topCard, (newIdxPlayerAfterSpecialCards + (1 * newDirectionAfterSpecialCards)) `modAcceptingNegative` length players, newDirectionAfterSpecialCards)

-- Jogar o jogo
playGame :: GameState -> IO ()
playGame (_, players, _, _, _) -- Condição de Parada caso exista um Vencedor
  | (length nameWinner > 1) = putStrLn (nameWinner ++ " is the Winner!")
  where nameWinner = checkWinner players
playGame (deck, players, topCard, idxPlayer, direction) = do
  -- Seleciona o jogador que vai jogar no momento
  let curPlayer = players !! idxPlayer

  -- Faz a nova jogada e salva no novo GameState
  newGameState <- playTurn (deck, players, topCard, idxPlayer, direction) curPlayer
  let (newDeck, newPlayers, newTopCard, newIdxPlayer, newDirection) = newGameState

  -- LEO: VERIFICAR UNO
  --      TERMINAR JOGO

  playGame (newDeck, newPlayers, newTopCard, newIdxPlayer, newDirection)
