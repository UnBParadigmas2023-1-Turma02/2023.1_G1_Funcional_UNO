{-# LANGUAGE CPP #-}
{-# LANGUAGE OverloadedStrings #-}

module UI.SelectColor where

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
import Types
import UI.Utils

data Name
  = RedButton
  | BlueButton
  | GreenButton
  | YellowButton
  deriving (Show, Eq, Ord)

-- the body is show card
selectCardColorUI :: Card ->D.Dialog Color Name -> [Widget Name]
selectCardColorUI card d = [ui]
  where
    ui = D.renderDialog d $ C.hCenter $ padAll 1 $ str (cardToString card)

selectCardColorAppEvent :: BrickEvent Name e -> T.EventM Name (D.Dialog Color Name) ()
selectCardColorAppEvent (VtyEvent ev) =
  case ev of
    -- V.EvKey V.KEsc [] -> M.halt
    V.EvKey V.KEnter [] -> M.halt
    _ -> D.handleDialogEvent ev
selectCardColorAppEvent _ = return ()

selectCardColorInitialState :: D.Dialog Color Name
selectCardColorInitialState = D.dialog (Just $ str "Seleciona a cor da carta") (Just (RedButton, choices)) 50
  where
    choices =
      [ ("Vermelho", RedButton, Red),
        ("Azul", BlueButton, Blue),
        ("Verde", GreenButton, Green),
          ("Amarelo", YellowButton, Yellow)
      ]

selectCardColorMap :: A.AttrMap
selectCardColorMap =
  A.attrMap
    V.defAttr
    [ (D.dialogAttr, V.white `on` V.blue),
      (D.buttonAttr, V.black `on` V.white),
      (D.buttonSelectedAttr, bg V.yellow)
    ]

selectCardColorApp :: Card -> M.App (D.Dialog Color Name) e Name
selectCardColorApp card =
  M.App
    { M.appDraw = selectCardColorUI card,
      M.appChooseCursor = M.showFirstCursor,
      M.appHandleEvent = selectCardColorAppEvent,
      M.appStartEvent = return (),
      M.appAttrMap = const selectCardColorMap
    }

renderSelectCardColor :: Card -> IO (Maybe Color)
renderSelectCardColor card = do
  d <- M.defaultMain (selectCardColorApp card) selectCardColorInitialState
  case D.dialogSelection d of
    Just (_, color) -> return (Just color)
    Nothing -> renderSelectCardColor card

getCardColor :: Card -> IO Color
getCardColor card = do
  selectedColor <- renderSelectCardColor card
  case selectedColor of
    Just color -> return color
    Nothing -> error "No color was selected"
