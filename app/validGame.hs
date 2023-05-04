{-
	Paradigma Funcional
	Jogo Uno
	Júlia e Cibele
-}

import Control.Exception
import System.IO
import System.IO.Error
import System.Process
import Data.List
import Data.Function

-- definição dos tipos dos dados
type Deck = [Card]
type Color1 = String
type Color2 = String
type Type1 = String
type Type2 = String
type CardNumber = Int
data CardType = CardType Color1 Type1 Color2 Type2
data Card = Card CardType CardNumber

-- função que recebe uma String e retorna uma IO String
getString :: String -> IO String
getString str = do
			putStr str
			res <- getLine
			return res


-- função que valida um jogo
validGame :: Card->Card->CardColor->Bool
validGame (Card Color1 Type1) (Card Color2 Type2) currentColor
 |Color1 == Color2 = True --mesma cor
 |Type1 == Type2 = True --mesmo tipo
 |Color2 == currentColor = True -- cor atual
 |othewise = False