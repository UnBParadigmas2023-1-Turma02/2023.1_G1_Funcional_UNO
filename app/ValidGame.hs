module ValidGame where

import Types

-- função que valida um jogo
validCard :: Card->Card->Color->Bool
validCard (Card typeCard1 color1 value1) (Card typeCard2 color2 value2)
 |color1 == color2 = True -- mesma cor
 |typeCard1 == typeCard2 = True -- mesmo tipo
 |value1 == value2 = True -- mesmo valor
 |otherwise = False