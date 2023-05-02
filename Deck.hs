module Deck where

import Types

import System.Random
import System.Random.Shuffle

-- Cria as cartas de Number com todas as cores possíveis 4x
listNumberColor :: [Card]
listNumberColor = concatMap (\color -> concatMap (\value -> replicate 4 $ Card Number color value) [One, Two, Three, Four, Five, Six, Seven, Eight, Nine]) [Red, Blue, Green, Yellow]

-- Cria as cartas de Reverse e Block com todas as cores possíveis 4x
listSpecialsColor :: [Card]
listSpecialsColor = concatMap (\color -> concatMap (\typecard -> replicate 4 $ Card typecard color NoValue) [Reverse, Block]) [Red, Blue, Green, Yellow]

deck :: [Card]
deck = listNumberColor ++ listSpecialsColor

cardToString :: Card -> String
cardToString (Card typeCard color value) = show typeCard ++ " " ++ show color ++ " " ++ show value

main :: IO ()
main = do
  --mapM_ (putStrLn . cardToString) deck -- Deck normal
  shuffled <- shuffleM deck
  mapM_ (putStrLn . cardToString) shuffled -- Deck embaralhado