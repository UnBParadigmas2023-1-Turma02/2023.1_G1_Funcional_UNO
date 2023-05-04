module SpecialCards where

import Types

-- Comprar carta do Monte
buyCardFromDeck :: Deck -> Player -> (Deck, Player)
buyCardFromDeck (c:cs) (name, hand) = (cs, (name, hand ++ [c]))

getCardType :: Card -> TypeCard
getCardType (Card Reverse _ _) = Reverse
getCardType (Card Block _ _) = Block
getCardType (Card Buy _ _) = Buy
getCardType (Card Number _ _) = Number

chooseNewColor :: Color
chooseNewColor = Red

dealReverseCard :: GameState -> GameState
dealReverseCard g@(deck, players, topCard, idxPlayer, direction) = (deck, players, topCard, idxPlayer, direction*(-1)) 

dealBlockCard :: GameState -> GameState
dealBlockCard g@(deck, players, topCard, idxPlayer, direction) = (deck, players, topCard, idxPlayer+(1 * direction), direction) 

getValueBuyCard :: Card -> Int
getValueBuyCard (Card _ _ Two) = 2
getValueBuyCard (Card _ _ Four) = 4

-- Atualiza a lista de jogadores
updatePlayerList :: Int -> a -> [a] -> [a]
updatePlayerList idx newPlayer players = take idx players ++ [newPlayer] ++ drop (idx+1) players

buyCardFromDeckNTimes :: Deck -> Player -> Int -> (Deck, Player)
buyCardFromDeckNTimes deck player n 
            | n == 0 = (deck, player)
            | otherwise = let (newDeck, newPlayer) = buyCardFromDeck deck player 
                            in buyCardFromDeckNTimes newDeck newPlayer (n-1)

newColor :: IO Color
newColor = do
    putStrLn "Qual cor você deseja escolher? 1 - Vermelho, 2 - Azul, 3 - Amarelo, 4 - Verde"
    color <- readLn
    case color of
        1 -> return Red
        2 -> return Blue
        3 -> return Yellow
        4 -> return Green
        _ -> do
            putStrLn "Opção inválida. Escolha novamente."
            newColor

dealBuyCard :: GameState -> GameState
dealBuyCard g@(deck, players, topCard, idxPlayer, direction) =
    let numberOfBuy = getValueBuyCard topCard
    in if numberOfBuy == 4
          then do
            let (Card typeCard _ value) = topCard
            let corEscolhida = chooseNewColor
            let newTopCard = Card typeCard corEscolhida value
            let (newDeck, playerAfterBuying) = buyCardFromDeckNTimes deck (players !! (idxPlayer+1)) numberOfBuy 
            (newDeck, updatePlayerList idxPlayer playerAfterBuying players, newTopCard, idxPlayer+1, direction)
          else
            let (newDeck, playerAfterBuying) = buyCardFromDeckNTimes deck (players !! (idxPlayer+1)) numberOfBuy
            in (newDeck, updatePlayerList idxPlayer playerAfterBuying players, topCard, idxPlayer+1, direction)

 
dealSpecialCards :: GameState -> GameState
dealSpecialCards g@(deck, players, topCard, idxPlayer, direction)
            | topCardType == Reverse = dealReverseCard g
            | topCardType == Block = dealBlockCard g
            | topCardType == Buy = dealBuyCard g
            | otherwise = g
        where topCardType = getCardType topCard