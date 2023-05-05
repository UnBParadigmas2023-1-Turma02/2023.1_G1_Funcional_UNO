module Deck where

import Types

-- Cria as cartas de Number com todas as cores possíveis 2x
listNumberColor :: [Card]
listNumberColor = concatMap (\color -> concatMap (\value -> replicate 2 $ Card Number color value) [One, Two, Three, Four, Five, Six, Seven, Eight, Nine]) [Red, Blue, Green, Yellow]

-- Cria as cartas de Reverse e Block com todas as cores possíveis 2x
listSpecialsColor :: [Card]
listSpecialsColor = concatMap (\color -> concatMap (\typecard -> replicate 2 $ Card typecard color NoValue) [Reverse, Block]) [Red, Blue, Green, Yellow]

-- Cria as cartas de 4+, 2+ e mudar cor
listTwoPlus :: [Card]
listTwoPlus = concatMap (\color -> replicate 2 $ Card Buy color Two) [Red, Blue, Green, Yellow]

listFourPlus :: [Card]
listFourPlus = replicate 4 (Card Buy NoColor Four)

listOnlyColor :: [Card]
listOnlyColor = replicate 6 (Card Only_Color NoColor NoValue)

-- Soma as listas de cartas acima para o deck
deck :: [Card]
deck = listNumberColor ++ listSpecialsColor ++ listTwoPlus ++ listFourPlus ++ listOnlyColor