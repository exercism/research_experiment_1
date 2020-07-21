## Instructions

In this exercise, you're going to implement a program that determines the state of a [tic-tac-toe](https://en.wikipedia.org/wiki/Tic-tac-toe) game.
(_You may also know the game as "noughts and crosses" or "Xs and Os"._)

The games is played on a 3x3 grid.
Players take turns to place `X`s and `O`s on the grid.
The game ends when one player has won by placing three of marks in a row, column, or along a diagonal of the grid, or when the entire grid is filled up.

Without loss of generality we will assume that `X` starts.

Create a function `gamestate` that takes the game board represented a string as its sole argument and returns a Symbol describing the state of the game.
The board will be given as a 3-line string containing `X`s, `O`s and ` `s:

```julia
board = "X  \n XO\nOX "
```

represents the following board:

```
   |   |   
 X |   |   
___|___|___
   |   |   
   | X | O 
___|___|___
   |   |
 O | X |  
   |   |
```

There are 3 potential game states:

- The game is **ongoing**.
- The game ended in a **draw**.
- The game ended in a **win**.

If the given board is invalid, throw an appropriate error.

### Examples

#### Ongoing game

```
   |   |   
 X |   |   
___|___|___
   |   |   
   | X | O 
___|___|___
   |   |
 O | X |  
   |   |
```

```julia
julia> gamestate("X  \n XO\nOX ")
:ongoing
```

#### Draw

```
   |   |   
 X | O | X 
___|___|___
   |   |   
 X | X | O 
___|___|___
   |   |
 O | X | O
   |   |
```

```julia
julia> gamestate("XOX\nXXO\nOXO")
:draw
```

#### Win

```
   |   |   
 X | X | X 
___|___|___
   |   |   
   | O | O 
___|___|___
   |   |
   |   |  
   |   |
```

```julia
julia> gamestate("XXX\n OO\n   ")
:win
```
