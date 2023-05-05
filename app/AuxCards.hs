module AuxCards
(redCards
,yellowCards
,blueCards
,greenCards
,arrayColorCard
,getIndexCard
) where 

import Types


redCards = [ "🔴0️⃣"
                   , "🔴1️⃣"
                   , "🔴2️⃣"
                   , "🔴3️⃣"
                   , "🔴4️⃣"
                   , "🔴5️⃣"
                   , "🔴6️⃣"
                   , "🔴7️⃣"
                   , "🔴8️⃣"
                   , "🔴9️⃣"
                   , "🔴+2️⃣"
                   , "🔴🔃"
                   , "🔴🚫"
                   ,"🌈"
                   , "+4️⃣🌈"
                   ]

yellowCards = [ "⚡0️⃣"
                 , "⚡1️⃣"
                 , "⚡2️⃣"
                 , "⚡3️⃣"
                 , "⚡4️⃣"
                 , "⚡5️⃣"
                 , "⚡6️⃣"
                 , "⚡7️⃣"
                 , "⚡8️⃣"
                 , "⚡9️⃣"
                 , "⚡+2️⃣"
                 , "⚡🔃"
                 , "⚡🚫"
                 ]

blueCards = [ "🔵0️⃣"
              , "🔵1️⃣"
              , "🔵2️⃣"
              , "🔵3️⃣"
              , "🔵4️⃣"
              , "🔵5️⃣"
              , "🔵6️⃣"
              , "🔵7️⃣"
              , "🔵8️⃣"
              , "🔵9️⃣"
              , "🔵+2️⃣"
              , "🔵🔃"
              , "🔵🚫"
              ]

greenCards = [ "🐸0️⃣"
               , "🐸1️⃣"
               , "🐸2️⃣"
               , "🐸3️⃣"
               , "🐸4️⃣"
               , "🐸5️⃣"
               , "🐸6️⃣"
               , "🐸7️⃣"
               , "🐸8️⃣"
               , "🐸9️⃣"
               , "🐸+2️⃣"
               , "🐸🔃"
               , "🐸🚫"
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
