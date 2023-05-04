-- module Msg 
-- (msgWelcome
-- ,msgNumPlayers
-- ,displayCard
-- ) where

module Main where

import CardColors
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
    putStrLn "|                                              MENU                                               |"
    putStrLn "|_________________________________________________________________________________________________|" 
    putStrLn "|                                                                                                 |"
    putStrLn "|                                          |1| START                                              |" 
    putStrLn "|                                          |2| TUTORIAL                                           |" 
    putStrLn "|                                          |0| SAIR DO JOGO                                       |" 
    putStrLn "|_________________________________________________________________________________________________|"

msgNumPlayers :: IO()
msgNumPlayers = do
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
    putStrLn "|                                  DIGITE O NÚMERO DE JOGADORES                                   |"
    putStrLn "|_________________________________________________________________________________________________|" 
    putStrLn "|                                                                                                 |"
    putStrLn "|                                        |1| UM JOGADOR                                           |" 
    putStrLn "|                                        |2| DOIS JOGADORES                                       |" 
    putStrLn "|                                        |3| TRÊS JOGADORES                                       |" 
    putStrLn "|                                        |4| QUADRO JOGADORES                                     |" 
    putStrLn "|                                        |0| SAIR DO JOGO                                         |" 
    putStrLn "|_________________________________________________________________________________________________|"

-- msgNamePlayers :: String -> IO()
-- msgNamePlayers numero = do
--     putStrLn ("numero = " ++ numero)

displayCard :: Card -> IO()
displayCard (Card _ color value) = do
    let index = cardValueNumber value
    let arrayColor = arrayColorCard color

    putStrLn ".—————."
    putStrLn "|     |"
    putStrLn ("|  " ++ (arrayColor !! index) ++ "  |")
    putStrLn "|     |"
    putStrLn "·—————·"


main :: IO ()
main = do
    let card = Card Number Red Zero
    let card2 = Card Number Yellow Seven
    let card3 = Card Number Green Nine
    let card4 = Card Number Blue One
    displayCard card
    displayCard card2
    displayCard card3
    displayCard card4

