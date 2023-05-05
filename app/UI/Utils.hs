module UI.Utils where

import AuxCards
import Types


contentCard :: Int -> [String] -> String
contentCard i array
    | i == 10 = "| "++(array !! 10)++"  |"
    | i == 11 = "| "++(array !! 11)++"  |" 
    | i == 12 = "| "++(array !! 12)++" |"
    | i == 13 = "|  "++(array !! 13)++" |"
    | i == 14 = "|"++(array !! 14)++" |"
    | otherwise = "|  "++(array !! i)++"  |"

cardToString :: Card -> String
cardToString (Card cardType color value) =
    let index = getIndexCard (Card cardType color value)
        -- arrayColor = arrayColorCard color
        content = contentCard index allCards
    in concat [
        ".—————.\n",
        "|     |\n",
        (content ++ "\n"),
        "|     |\n",
        "·—————·\n"
    ]

getCardName :: Card -> String
getCardName (Card t c v) = showType t ++ showValue v  ++ showColor c
  where
    showType Number = ""
    showType Buy = "+"
    showType Reverse = "Inverter"
    showType Block = "Bloquear"
    showType Only_Color = "Todas as cores"

    showValue Zero = "0"
    showValue One = "1"
    showValue Two = "2"
    showValue Three = "3"
    showValue Four = "4"
    showValue Five = "5"
    showValue Six = "6"
    showValue Seven = "7"
    showValue Eight = "8"
    showValue Nine = "9"
    showValue NoValue = ""

    showColor Red = " (Vermelho)"
    showColor Blue = " (Azul)"
    showColor Green = " (Verde)"
    showColor Yellow = " (Amarelo)"
    showColor NoColor = ""
