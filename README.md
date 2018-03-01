# My Approach

I have been given the challenge to create the business logic for a tic-tac-toe game as below. I have chosen to complete the challenge in Ruby, and use Rspec testing framework. I have chosen Ruby as I have the most experience with it.

Prior to starting the challenge I have designed a DOM that I think is required:

**3 classes **
* *Move* - position attribute, X,O attribute
* *Grid* - size attributes - return the grid, confirm if position taken, confirm moves in a row
* *Game* - create new grid - build moves - Game over?  

## Feedback points
* I have worked to try ensure I test behaviour and not state
* I have also tried to have a focus on ensuring classes meet open/closed principle


## The challenge
Try our Tic Tac Toe Tech Test!
This is a very common tech test as it demonstrates a candidate's knowledge of basic data structures.

The brief
The rules of tic-tac-toe are as follows:

There are two players in the game (X and O)
Players take turns until the game is over
A player can claim a field if it is not already taken
A turn ends when a player claims a field
A player wins if they claim all the fields in a row, column or diagonal
A game is over if a player wins
A game is over when all fields are taken
Build the business logic for a game of tic tac toe. It should be easy to implement a working game of tic tac toe by combining your code with any user interface, whether web or command line.
