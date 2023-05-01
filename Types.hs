module Types (
  TypeCard(..),
  Color(..),
  Value(..),
  Card(..),
  Deck,
  Hand,
  Player,
  GameState
) where

data TypeCard = Number | Buy | Reverse | Block | Only_Color deriving (Show, Eq)
data Color = Red | Blue | Green | Yellow | NoColor deriving (Show, Eq)
data Value = Zero | One | Two | Three | Four | Five | Six | Seven | Eight | Nine | NoValue deriving (Show, Eq)
data Card = Card TypeCard Color Value deriving (Show, Eq)
type Deck = [Card]
type Hand = [Card]
type Player = (String, Hand)
type GameState = (Deck, [Player], Card)