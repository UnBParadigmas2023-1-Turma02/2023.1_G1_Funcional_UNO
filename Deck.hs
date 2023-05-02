module Deck where

import Types

import System.Random
import System.Random.Shuffle

-- Cria as cartas de Number com todas as cores possíveis 4x
listNumberColor :: [Card]
listNumberColor = concatMap (\color -> concatMap (\value -> replicate 4 $ Card Number color value) [Zero, One, Two, Three, Four, Five, Six, Seven, Eight, Nine]) [Red, Blue, Green, Yellow]

-- Cria as cartas de Reverse e Block com todas as cores possíveis 4x
listSpecialsColor :: [Card]
listSpecialsColor = concatMap (\color -> concatMap (\typecard -> replicate 4 $ Card typecard color NoValue) [Reverse, Block]) [Red, Blue, Green, Yellow]

-- Soma as listas de cartas acima para o deck
deck :: [Card]
deck = listNumberColor ++ listSpecialsColor

-- Imprime Card
cardToString :: Card -> String
cardToString (Card typeCard color value) = show typeCard ++ " " ++ show color ++ " " ++ show value

-- Retorna a primeira carta do baralho e o resto do deck (listas são imutáveis, então tem que criar uma nova variável sempre)
drawCard :: Deck -> (Card, Deck)
drawCard deck = (head deck, tail deck)

main :: IO ()
main = do
  -- Deck embaralhado -> https://hackage.haskell.org/package/random-shuffle-0.0.4/docs/System-Random-Shuffle.html
  deckShuffled <- shuffleM deck
  mapM_ (putStrLn . cardToString) deckShuffled 
  putStrLn ("Comprimento do Deck: " ++ show (length deckShuffled))

  -- Teste de Carta do Topo e novo deck (comentado o print, mas funcionanado)
  let (cartaTopo, newDeck) = drawCard deckShuffled
  -- putStrLn (cardToString cartaTopo)
  -- mapM_ (putStrLn . cardToString) newDeck

  -- Como atualizar a cartaTopo
  let cartaTopo = Card Number Yellow One
  putStrLn (cardToString cartaTopo)