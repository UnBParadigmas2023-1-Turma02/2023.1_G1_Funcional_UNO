import Types
import Deck
import Data.List
import System.IO
import System.Random
import System.Random.Shuffle


-- definição dos tipos de dados
-- Player = (String name, Hand)
-- data PlayersQueue queue = [Player]


-- Identifica o próximo jogador e a nova Fila de Jogadores
-- nextToPlay :: [Player] -> (Player, [Player])
-- nextToPlay (head:tail) = 
--     let (nextPlayer) = head
--    in (nextPlayer, tail:nextPlayer)


-- Distribui 7 cartas cada jogador
dealCards :: Deck -> [Player] -> ([Player], Deck)
dealCards d [] = ([], d)
dealCards d ((name, hand):players) = 
    let (newHand, newDeck) = splitAt 7 d
        newPlayer = (name, hand ++ newHand)
        (updatedPlayers, finalDeck) = dealCards newDeck players
    in (newPlayer : updatedPlayers, finalDeck)


playerToString :: Player -> String
playerToString (name, hand) =
  name ++ "'s hand: " ++ showHand hand
  where
    showHand :: Hand -> String
    showHand [] = "empty"
    showHand (c:cs) = cardToString c ++ ", " ++ showHand cs

test :: IO ()
test = do
  shuffled <- shuffleM deck
  let (players, remainingDeck) = dealCards shuffled [("Player1", []), ("Player2", []), ("Player3", []), ("Player4", [])]
  mapM_ (\(name, hand) -> putStrLn (name ++ "'s hand: " ++ show hand)) players
  putStrLn ("Remaining deck: " ++ show remainingDeck)
  -- let (nextPlayer, queueToPlay) = nextToPlay players
  -- mapM_ (putStrLn . playerToString nextPlayer) 
  -- putStrLn (show queueToPlay)
