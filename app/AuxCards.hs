module AuxCards
(redCards
,yellowCards
,blueCards
,greenCards
,arrayColorCard
,getIndexCard
) where 

import Types


redCards = [ "\x1b[31m0\x1b[0m"
                   , "\x1b[31m1\x1b[0m"
                   , "\x1b[31m2\x1b[0m"
                   , "\x1b[31m3\x1b[0m"
                   , "\x1b[31m4\x1b[0m"
                   , "\x1b[31m5\x1b[0m"
                   , "\x1b[31m6\x1b[0m"
                   , "\x1b[31m7\x1b[0m"
                   , "\x1b[31m8\x1b[0m"
                   , "\x1b[31m9\x1b[0m"
                   , "\x1b[31m+2\x1b[0m"
                   , "\x1b[31m<--->\x1b[0m"
                   , "\x1b[31mBLOCK\x1b[0m"
                   ,"🌈"
                   , "+4🌈"
                   ]

yellowCards = [ "\x1b[33m0\x1b[0m"
                 , "\x1b[33m1\x1b[0m"
                 , "\x1b[33m2\x1b[0m"
                 , "\x1b[33m3\x1b[0m"
                 , "\x1b[33m4\x1b[0m"
                 , "\x1b[33m5\x1b[0m"
                 , "\x1b[33m6\x1b[0m"
                 , "\x1b[33m7\x1b[0m"
                 , "\x1b[33m8\x1b[0m"
                 , "\x1b[33m9\x1b[0m"
                 , "\x1b[33m+2\x1b[0m"
                 , "\x1b[33m<--->\x1b[0m"
                 , "\x1b[33mBLOCK\x1b[0m"
                 ]

blueCards = [ "\x1b[34m0\x1b[0m"
              , "\x1b[34m1\x1b[0m"
              , "\x1b[34m2\x1b[0m"
              , "\x1b[34m3\x1b[0m"
              , "\x1b[34m4\x1b[0m"
              , "\x1b[34m5\x1b[0m"
              , "\x1b[34m6\x1b[0m"
              , "\x1b[34m7\x1b[0m"
              , "\x1b[34m8\x1b[0m"
              , "\x1b[34m9\x1b[0m"
              , "\x1b[34m+2\x1b[0m"
              , "\x1b[34m<--->\x1b[0m"
              , "\x1b[34mBLOCK\x1b[0m"
              ]

greenCards = [ "\x1b[32m0\x1b[0m"
               , "\x1b[32m1\x1b[0m"
               , "\x1b[32m2\x1b[0m"
               , "\x1b[32m3\x1b[0m"
               , "\x1b[32m4\x1b[0m"
               , "\x1b[32m5\x1b[0m"
               , "\x1b[32m6\x1b[0m"
               , "\x1b[32m7\x1b[0m"
               , "\x1b[32m8\x1b[0m"
               , "\x1b[32m9\x1b[0m"
               , "\x1b[32m+2\x1b[0m"
               , "\x1b[32m<--->\x1b[0m"
               , "\x1b[32mBLOCK\x1b[0m"
               ]


arrayColorCard :: Color -> [String]
arrayColorCard (Red)     = redCards
arrayColorCard (Blue)    = blueCards
arrayColorCard (Green)   = greenCards
arrayColorCard (Yellow)  = yellowCards
arrayColorCard (NoColor) = redCards


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
