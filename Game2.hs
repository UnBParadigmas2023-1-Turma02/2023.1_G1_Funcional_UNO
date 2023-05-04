import Types

import Deck

import GameLogic

import Data.List
import System.IO
import System.Random
import System.Random.Shuffle


readPlayers :: IO [Player]
readPlayers = do
  putStr "Enter number of players: "
  numPlayersStr <- getLine
  let numPlayers = read numPlayersStr :: Int
  players <- mapM (\n -> do
                    let i = 1
                    putStr ("Enter name for player: ")
                    playerName <- getLine
                    return (playerName, [])) [1..numPlayers]
  return players

main :: IO ()
main = do
  -- Imprimir Deck
  --mapM_ (putStrLn . cardToString) deck 

  -- Deck embaralhado -> https://hackage.haskell.org/package/random-shuffle-0.0.4/docs/System-Random-Shuffle.html
  deckShuffled <- shuffleM deck

  -- Lê os players do jogo
  newPlayers <- readPlayers

  -- Distribuindo 7 cartas para N jogadores
  let (players, remainingDeck) = dealCards deckShuffled newPlayers

  -- Imprime mão embaralhada dos jogadores
  -- mapM_ (\(name, hand) -> putStrLn (name ++ "'s hand: " ++ show hand)) players

  playGame (remainingDeck, players, head remainingDeck, 0, 1)