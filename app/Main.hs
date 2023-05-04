{-# LANGUAGE CPP #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

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

data TypeCard = Number | Buy | Reverse | Block | OnlyColor deriving (Show, Eq, Ord)

data Color = Red | Blue | Green | Yellow | NoColor deriving (Show, Eq, Ord)

data Value = Zero | One | Two | Three | Four | Five | Six | Seven | Eight | Nine | NoValue deriving (Show, Eq, Ord)

data Card = Card TypeCard Color Value deriving (Show, Eq, Ord)

type Deck = [Card]

type Hand = [Card]

type Player = (String, Hand)

type GameState = (Deck, [Player], Card, Int, Int) -- Monte, Lista de Jogadores, Carta do Topo, Posição do Jogador Atual, direção do jogo (1 para horário e -1 para anti-horário)

cardName :: Card -> String
cardName (Card _ color value) = show color <> " " <> show value

drawUi :: Card -> D.Dialog Card Card -> [Widget Card]
drawUi card d = [ui]
  where
    ui = D.renderDialog d $ C.hCenter $ padAll 1 $ str $ cardName card

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
    choices = map (\card -> (cardName card, card, card)) hand

theMap :: A.AttrMap
theMap =
  A.attrMap
    V.defAttr
    [ (D.buttonAttr, V.black `on` V.white),
      (D.buttonSelectedAttr, bg V.yellow)
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

exampleGameState :: GameState
exampleGameState = (deck, players, card, turn, direction)
  where
    deck = [Card Number Red Zero, Card Number Red One]
    players =
      [ ("Fulaninho", [Card Number Red Zero, Card Number Red One]),
        ("Bebelzinha", [Card Number Blue Zero, Card Number Blue One, Card Number Blue Two])
      ]
    card = Card Number Red Zero
    turn = 0
    direction = 1

main :: IO ()
main = do
  (_, players, topCard, turn, _) <- return exampleGameState
  let currentPlayer = players !! turn

  d <- M.defaultMain (theApp topCard) (initialState currentPlayer)
  putStrLn $ "You chose: " <> show (D.dialogSelection d)
