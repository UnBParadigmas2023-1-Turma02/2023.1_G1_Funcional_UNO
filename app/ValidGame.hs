module ValidGame where

import Types

-- função que valida um jogo
validCard :: Card->Card->Bool
validCard (Card typeCard1 color1 value1) (Card typeCard2 color2 value2) -- 
 |color1 == color2 = True --mesma cor
 |value1 == value2 = True --mesmo valor
 |(typeCard1 /= Number &&  typeCard2 /= Number) && typeCard1 == typeCard2 = True --mesmo tipo
 |(color2 == NoColor &&  typeCard2 == Buy) || (typeCard2 == Only_Color) = True -- buy four
 |otherwise = False