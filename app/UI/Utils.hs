module UI.Utils where

import AuxCards
import Types


contentCard :: Int -> [String] -> String
contentCard i array
    | i == 10 = "| "++(array !! 10)++" |" 
    | i == 11 = "| "++(array !! 11)++" |" 
    | i == 12 = "| "++(array !! 12)++" |"
    | i == 13 = "|  "++(array !! 13)++"  |"
    | i == 14 = "| "++(array !! 14)++" |"
    | otherwise = "| "++(array !! i)++"  |"

cardToString :: Card -> String
cardToString (Card cardType color value) =
    let index = getIndexCard (Card cardType color value)
        arrayColor = arrayColorCard color
        content = contentCard index arrayColor
    in concat [
        ".—————.\n",
        "|     |\n",
        (content ++ "\n"),
        "|     |\n",
        "·—————·\n"
    ]
