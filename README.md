# Tic-tac-toe

## My Approach

I have been given the challenge to create the business logic for a tic-tac-toe game as below. I have chosen to complete the challenge in Ruby, and use Rspec testing framework. I have chosen Ruby as I have the most experience with it.

Prior to starting the challenge I have designed a DOM that I think is required:

**3 classes **
* *Move* - position attribute, X,O attribute
* *Grid* - size attributes - return the grid, confirm if position taken, confirm if row is made up of same entry
* *Game* - create new grid - build moves - Game over?  

I have attempted to design the game to be extendable with as little modification as possible. With this in mind I have not set grid size, or set pattern number, for example not three in a row, but whole row. This has potentially led me to a more complex codebase, but given more time I would work on making the code more efficient.

I have considered that the pattern could be a further class, as it could be argued that grid would not be responsible for knowing what pattern to search for. However, given the scope of the specification at the moment I think it is reasonable to have this as a responsibility of grid class. Given more time, I would potentially take this role out of the grid class.

I have included both unit tests and feature tests. Unit tests have focused on individual classes and use doubles / mocks to stub out any dependencies.

To ensure the classes work together with the desired behaviour I have also included feature tests. The tests have provided 100% coverage, and I have aimed to cover all possible outcomes and edge cases with the test framework.

## Usage

### Getting started
* Clone the repo
* cd tic-tac-toe
* run bundle
* To run tests run rspec

### To play the game
* Open IRB
* load './lib/game'
* To create a new game - game = Game.new
* To create a new grid = game.new_game
* Then add each move in sequence, the game will automatically change turns as required
* To add move - game.add_move(0,0) - The first argument will be the x position, the second the y position within the grid
* The command to show the grid - game.grid.show
* Once a move is made which ends a game - error "Game over" will be displayed
* Once game over is displayed - no more moves can be added
* To play again, game.new_game will reset the grid

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
