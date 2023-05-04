module UI.Utils where

import Types

cardToString :: Card -> String
cardToString (Card _ color value) = show color <> " " <> show value
