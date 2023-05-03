import Types
import Deck
import Data.List
import System.IO
import System.Random
import System.Random.Shuffle


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
  -- Deck embaralhado -> https://hackage.haskell.org/package/random-shuffle-0.0.4/docs/System-Random-Shuffle.html
  shuffled <- shuffleM deck

  -- Distribuindo 7 cartas para N jogadores
  -- let (players, remainingDeck) = dealCards shuffled [("Player1", []), ("Player2", [])]
  -- let (players, remainingDeck) = dealCards shuffled [("Player1", []), ("Player2", []), ("Player3", [])]
  let (players, remainingDeck) = dealCards shuffled [("Player1", []), ("Player2", []), ("Player3", []), ("Player4", [])]
  
  -- Imprime mão embaralhada dos jogadores
  mapM_ (\(name, hand) -> putStrLn (name ++ "'s hand: " ++ show hand)) players
  
  -- Imprime Deck Restante
  putStrLn ("Remaining deck: " ++ show remainingDeck)
  
  -- let (nextPlayer, queueToPlay) = nextToPlay players
  -- mapM_ (putStrLn . playerToString nextPlayer) 
  -- putStrLn (show queueToPlay)
