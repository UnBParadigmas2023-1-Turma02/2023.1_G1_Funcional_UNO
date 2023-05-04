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

data TypeCard = Number | Buy | Reverse | Block | Only_Color deriving (Show, Eq, Ord)
data Color = Red | Blue | Green | Yellow | NoColor deriving (Show, Eq, Ord)
data Value = Zero | One | Two | Three | Four | Five | Six | Seven | Eight | Nine | NoValue deriving (Show, Eq, Ord)
data Card = Card TypeCard Color Value deriving (Show, Eq, Ord)
type Deck = [Card]
type Hand = [Card]
type Player = (String, Hand)
type GameState = (Deck, [Player], Card, Int, Int) -- Monte, Lista de Jogadores, Carta do Topo, Posição do Jogador Atual, direção do jogo (1 para horário e -1 para anti-horário)
