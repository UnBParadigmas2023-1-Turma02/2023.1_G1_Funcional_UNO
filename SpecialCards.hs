module SpecialCards where

import Types

extractFirst :: (Deck,[Player],Card) -> Deck
extractFirst (a,_,_) = a

extractSecond :: (Deck,[Player],Card) -> [Player]
extractSecond (_,b,_) = b

extractThird :: (Deck,[Player],Card) -> Card
extractThird (_,_,c) = c

getCardType :: Card -> TypeCard
getCardType (Card Reverse _ _) = Reverse
getCardType (Card Block _ _) = Block

dealReverseCard :: GameState -> GameState
dealReverseCard g = (extractFirst g, reverse (extractSecond g), extractThird g)

dealBlockCard :: GameState -> GameState
dealBlockCard g = g -- @TODO: Função de Block
 
dealSpecialCards :: GameState -> GameState
dealSpecialCards g 
            | topCard == Reverse = dealReverseCard g
            | topCard == Block = dealBlockCard g
    where topCard = getCardType (extractThird g)


-- dealSpecialCards :: GameState -> GameState
-- dealAllCards g 
--             | topCard == Number = dealNumberCards g
--             | otherwise = dealSpecialCards g
--     where topCard = getCardType (extractThird g)
