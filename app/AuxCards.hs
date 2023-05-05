module AuxCards
(allCards
,getIndexCard
) where 

import Types


allCards = [ "0"
            , "1"
            , "2"
            , "3"
            , "4"
            , "5"
            , "6"
            , "7"
            , "8"
            , "9"
            , "+2"
            , "🔃"
            , "🚫"
            ,"🌈"
            , "+4🌈"
            ]

getIndexCard :: Card -> Int
getIndexCard (Card Number _ Zero)     = 0
getIndexCard (Card Number _ One)      = 1
getIndexCard (Card Number _ Two)      = 2
getIndexCard (Card Number _ Three)    = 3
getIndexCard (Card Number _ Four)     = 4
getIndexCard (Card Number _ Five)     = 5
getIndexCard (Card Number _ Six)      = 6
getIndexCard (Card Number _ Seven)    = 7
getIndexCard (Card Number _ Eight)    = 8
getIndexCard (Card Number _ Nine)     = 9
getIndexCard (Card Buy _ Two)         = 10
getIndexCard (Card Reverse _ NoValue) = 11
getIndexCard (Card Block _ NoValue)   = 12
getIndexCard (Card Only_Color _ _)    = 13
getIndexCard (Card Buy _ Four)        = 14
getIndexCard _                        = -1
