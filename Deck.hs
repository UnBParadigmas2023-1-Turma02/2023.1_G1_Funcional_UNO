import Types

listNumberColor :: [Card]
listNumberColor = concatMap (\color -> map (\value -> Card Number color value) [One, Two, Three, Four, Five, Six, Seven, Eight, Nine]) [Red, Blue, Green, Yellow]

cardToString :: Card -> String
cardToString (Card typeCard color value) = show typeCard ++ " " ++ show color ++ " " ++ show value

main :: IO ()
main = do
  mapM_ (putStrLn . cardToString) listNumberColor