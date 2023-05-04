module CardColors
(redCards
,yellowCards
,blueCards
,greenCards
,cardValueNumber
,arrayColorCard
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
               ]


-- Retorna o valor numérico do cartão
cardValueNumber :: Value -> Int
cardValueNumber (Zero)    = 0
cardValueNumber (One)     = 1
cardValueNumber (Two)     = 2
cardValueNumber (Three)   = 3
cardValueNumber (Four)    = 4
cardValueNumber (Five)    = 5
cardValueNumber (Six)     = 6
cardValueNumber (Seven)   = 7
cardValueNumber (Eight)   = 8
cardValueNumber (Nine)    = 9
cardValueNumber _ = -1

arrayColorCard :: Color -> [String]
arrayColorCard (Red) = redCards
arrayColorCard (Blue) = blueCards
arrayColorCard (Green) = greenCards
arrayColorCard (Yellow) = yellowCards
arrayColorCard _ = [""]
