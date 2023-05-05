{-# LANGUAGE CPP #-}
{-# LANGUAGE OverloadedStrings #-}

module UI.PlayCard where

#if !(MIN_VERSION_base(4,11,0))
import Data.Monoid
#endif
import qualified Brick.AttrMap as A
import qualified Brick.Main as M
import Brick.Types
  ( BrickEvent (..),
    Widget,
  )
import qualified Brick.Types as T
import Brick.Util (bg, on)
import qualified Brick.Widgets.Center as C
import Brick.Widgets.Core
  ( padAll,
    str,
  )
import qualified Brick.Widgets.Dialog as D
import qualified Graphics.Vty as V
import UI.SelectColor

import Types
import UI.Utils

drawUi :: Card -> D.Dialog Card Card -> [Widget Card]
drawUi card d = [ui]
  where
    ui = D.renderDialog d $ C.hCenter $ padAll 1 $ str $ cardToString card

appEvent :: BrickEvent Card e -> T.EventM Card (D.Dialog Card Card) ()
appEvent (VtyEvent ev) =
  case ev of
    V.EvKey V.KEsc [] -> M.halt
    V.EvKey V.KEnter [] -> M.halt
    _ -> D.handleDialogEvent ev
appEvent _ = return ()

initialState :: Player -> D.Dialog Card Card
initialState (name, hand) = D.dialog (Just $ str $ "Sua vez, " <> name <> "!") (Just (head hand, choices)) 1000
  where
    choices = map (\card -> (cardToString card, card, card)) hand

theMap :: A.AttrMap
theMap =
  A.attrMap
    V.defAttr
    [
      (D.buttonSelectedAttr, bg V.black)
    ]

theApp :: Card -> M.App (D.Dialog Card Card) e Card
theApp card =
  M.App
    { M.appDraw = drawUi card,
      M.appChooseCursor = M.showFirstCursor,
      M.appHandleEvent = appEvent,
      M.appStartEvent = return (),
      M.appAttrMap = const theMap
    }

shouldChoseCardColor :: Card -> Bool
shouldChoseCardColor (Card Only_Color NoColor _) = True
shouldChoseCardColor (Card Buy NoColor Four) = True
shouldChoseCardColor _ = False

getSelectedCard :: D.Dialog a Card -> Maybe Card
getSelectedCard d =
  case D.dialogSelection d of
    Just (card1, _) -> Just card1
    Nothing -> Nothing

setCardColor :: Card -> Color -> Card
setCardColor (Card typeCard _ value) color = Card typeCard color value


renderPlayCard :: GameState -> IO (Maybe Card)
renderPlayCard gameState = do
  let (_, players, topCard, turn, _) = gameState
  let currentPlayer = players !! turn

  d <- M.defaultMain (theApp topCard) (initialState currentPlayer)
  let selectedCard = getSelectedCard d
  case selectedCard of
    Just card | shouldChoseCardColor card -> do
      color <- getCardColor card
      return (Just (setCardColor card color))
    _ -> return selectedCard
