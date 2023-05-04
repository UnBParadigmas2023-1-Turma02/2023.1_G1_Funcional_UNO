-- module Msg 
-- (msgWelcome
-- ,msgNumPlayers
-- ,displayCard
-- ) where

module Main where

import AuxCards
import Types


msgWelcome :: IO()
msgWelcome = do
    putStrLn "" 
    putStrLn " _________________________________________________________________________________________________ "
    putStrLn "|_________________________________________________________________________________________________|"
    putStrLn "|_________________________________________________________________________________________________|"
    putStrLn "|                                                                                                 |"
    putStrLn "|                                                                                                 |"
    putStrLn "|                                                                                                 |"
    putStrLn "|                                   ██╗░░░██╗███╗░░██╗░█████╗                                     |"
    putStrLn "|                                   ██║░░░██║████╗░██║██╔══██╗                                    |"
    putStrLn "|                                   ██║░░░██║██╔██╗██║██║░░██║                                    |"
    putStrLn "|                                   ██║░░░██║██║╚████║██║░░██║                                    |"
    putStrLn "|                                   ╚██████╔╝██║░╚███║╚█████╔╝                                    |"
    putStrLn "|                                    ╚═════╝ ╚═╝  ╚══╝ ╚════╝                                     |"
    putStrLn "|                                                                                                 |"
    putStrLn "|                                                                                                 |"
    putStrLn "|_________________________________________________________________________________________________|"
    putStrLn "|                                                                                                 |"
    putStrLn "|                                              HOME                                               |"
    putStrLn "|_________________________________________________________________________________________________|" 
    putStrLn "|                                                                                                 |"
    putStrLn "|                                          |1| START                                              |" 
    putStrLn "|                                          |2| TUTORIAL                                           |" 
    putStrLn "|                                          |0| SAIR DO JOGO                                       |" 
    putStrLn "|_________________________________________________________________________________________________|"


msgNumPlayers :: IO()
msgNumPlayers = do
    putStrLn ""
    putStrLn " _________________________________________________________________________________________________"
    putStrLn "|                                                                                                 |"
    putStrLn "|                                  DIGITE O NÚMERO DE JOGADORES                                   |"
    putStrLn "|_________________________________________________________________________________________________|" 
    putStrLn "|                                                                                                 |"
    putStrLn "|                                        |1| UM JOGADOR                                           |" 
    putStrLn "|                                        |2| DOIS JOGADORES                                       |" 
    putStrLn "|                                        |3| TRÊS JOGADORES                                       |" 
    putStrLn "|                                        |4| QUADRO JOGADORES                                     |" 
    putStrLn "|                                        |0| SAIR DO JOGO                                         |" 
    putStrLn "|_________________________________________________________________________________________________|"


namePlayer :: String -> IO()
namePlayer numberPlayer = do
    putStrLn ""
    putStrLn " _________________________________________________________________________________________________"
    putStrLn "|                                                                                                 |"
    putStrLn ("|                                  DIGITE O NOME DO JOGADOR "++ numberPlayer ++":                                    |")
    putStrLn "|_________________________________________________________________________________________________|" 


msgWin :: String -> IO()
msgWin nomeJogador = do
    let tamRowTotal = 97
    let tamCaracteresFixed = 63 + length nomeJogador
    let tamNecessarySpaces = tamRowTotal - tamCaracteresFixed
    let spaces = concat (replicate tamNecessarySpaces  " ")

    putStrLn ""

    putStrLn " _________________________________________________________________________________________________"
    putStrLn "|                                                                                                 |"
    putStrLn ("|                                  PARABÉNS "++ nomeJogador ++ " você ganhou! 🎉🎉🎉" ++ spaces ++ "|")
    putStrLn "|_________________________________________________________________________________________________|" 
    putStrLn "|                                                                                                 |"
    putStrLn "|                                        |0| SAIR DO JOGO                                         |" 
    putStrLn "|                                        |1| JOGAR NOVAMENTE                                      |" 
    putStrLn "|_________________________________________________________________________________________________|"


contentCard :: Int -> [String] -> String
contentCard i array
    | i == 10 = "| "++(array !! 10)++"  |" 
    | i == 11 = "|"++(array !! 11)++"|" 
    | i == 12 = "|"++(array !! 12)++"|"
    | otherwise = "|  "++(array !! i)++"  |"


displayCard :: Card -> IO()
displayCard (Card cardType color value) = do
    putStrLn ".—————."
    putStrLn "|     |"
    putStrLn content
    putStrLn "|     |"
    putStrLn "·—————·"
    where 
        index = getIndexCard (Card cardType color value)
        arrayColor = arrayColorCard color
        content = contentCard index arrayColor


main :: IO ()
main = do
    let card = Card Number Red Zero
    let card2 = Card Number Yellow Seven
    let card3 = Card Number Green Nine
    let card4 = Card Reverse Blue NoValue
    let card5 = Card Block Red NoValue
    displayCard card
    displayCard card2
    displayCard card3
    displayCard card4
    displayCard card5

    msgWin "Fulano"

