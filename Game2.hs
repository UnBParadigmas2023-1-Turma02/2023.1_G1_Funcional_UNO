import Types

import Deck

import GameLogic

import Data.List
import System.IO
import System.Random
import System.Random.Shuffle

main :: IO ()
main = do
  -- Imprimir Deck
  --mapM_ (putStrLn . cardToString) deck 

  -- Deck embaralhado -> https://hackage.haskell.org/package/random-shuffle-0.0.4/docs/System-Random-Shuffle.html
  deckShuffled <- shuffleM deck

  -- Distribuindo 7 cartas para N jogadores
  --let (players, remainingDeck) = dealCards deckShuffled [("Player1", []), ("Player2", [])]
  let (players, remainingDeck) = dealCards deckShuffled [("Player1", []), ("Player2", []), ("Player3", [])]
  -- let (players, remainingDeck) = dealCards deckShuffled [("Player1", []), ("Player2", []), ("Player3", []), ("Player4", [])]
  
  -- Imprime mão embaralhada dos jogadores
  -- mapM_ (\(name, hand) -> putStrLn (name ++ "'s hand: " ++ show hand)) players

  playGame (remainingDeck, players, head remainingDeck, 0, 1)