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

<<<<<<< HEAD
data TypeCard = Number | Buy | Reverse | Block | Only_Color deriving (Show, Eq)
data Color = Red | Blue | Green | Yellow | NoColor deriving (Show, Eq)
data Value = One | Two | Three | Four | Five | Six | Seven | Eight | Nine | NoValue deriving (Show, Eq)
data Card = Card TypeCard Color Value deriving (Show, Eq)
=======
data TypeCard = Number | Buy | Reverse | Block | Only_Color deriving (Show, Eq, Ord)
data Color = Red | Blue | Green | Yellow | NoColor deriving (Show, Eq, Ord)
data Value = Zero | One | Two | Three | Four | Five | Six | Seven | Eight | Nine | NoValue deriving (Show, Eq, Ord)
data Card = Card TypeCard Color Value deriving (Show, Eq, Ord)
>>>>>>> 876ee91cc3209f1117bb58e60528539ba2f1a402
type Deck = [Card]
type Hand = [Card]
type Player = (String, Hand)
type GameState = (Deck, [Player], Card, Int, Int) -- Monte, Lista de Jogadores, Carta do Topo, Posição do Jogador Atual, direção do jogo (1 para horário e -1 para anti-horário)
