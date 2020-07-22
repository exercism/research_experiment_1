## Instructions

In this exercise, you're going to implement a program that determines the state of a [tic-tac-toe](https://en.wikipedia.org/wiki/Tic-tac-toe) game.
(_You may also know the game as "noughts and crosses" or "Xs and Os"._)

The games is played on a 3x3 grid.
Players take turns to place `X`s and `O`s on the grid.
The game ends when one player has won by placing three of marks in a row, column, or along a diagonal of the grid, or when the entire grid is filled up.

In this exercise, we will assume that `X` starts.

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

If a board meets the following conditions, it is invalid:

- The players took turns out of order (remember that `X` starts).
- The game was played after it already ended, i.e. more than one row/column/diagonal contains the same symbol thrice.

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

## Debugging

When a test fails, a message is displayed describing what went wrong and for which input.
You can also use the fact that [everything sent to `stdout`](https://docs.julialang.org/en/v1/base/io-network/#Text-I/O-1) will be shown too.
For example, you can write to `stdout` using `println` or `@show`:

```julia
julia> println("Debug message")
Debug message

julia> x = 20; @show x
x = 20
```

[Logging commands](https://docs.julialang.org/en/v1/stdlib/Logging/) with a `LogLevel` higher than `Debug` will also be shown:

```julia
julia> x = 20; @info "I wonder what x is:" x
┌ Info: I wonder what x is:
└   x = 20
```

_The return value in these examples is what would be displayed to you._
