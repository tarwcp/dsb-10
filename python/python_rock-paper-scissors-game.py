from random import choice
from math import e
# Main function
def game():

  # Geeting to user
  print("Welcome to the game!")
  print("Please select your move")
  print("Rock, Paper, or Scissors")
  print("Yf you want to quit, please type \"exit\"")

  # First, define possible moves for bot and inout move from user
  moves = ["rock", "paper","scissors"]
  user_input = 0

  # Initailize scores for both side
  user_score = 0
  bot_score = 0

  # Game loop
  while (user_score < 3) and (bot_score < 3):

    # User's move with receive input from user
    user_move = (input("Your move are: ")).lower()

    # Bot's move
    bot_move = choice(moves)

    # Condition clause for determine the winner per round and exit way for user
    if user_move == bot_move:
      print("User move: " + user_move + " | Bot move: " + bot_move)
      print("--------------------")
      print("Tie!")
      print("       Score        ")
      print("User score: " + str(user_score) + " | Bot move: " + str(bot_score))
      print("--------------------")
    elif (user_move == "rock" and bot_move == "scissors") or (user_move == "paper" and bot_move == "rock") or (user_move == "scissors" and bot_move == "paper"):
      user_score += 1
      print("User move: " + user_move + " | Bot move: " + bot_move)
      print("--------------------")
      print("User win this round!")
      print("       Score        ")
      print("User score: " + str(user_score) + " | Bot move: " + str(bot_score))
      print("--------------------")
    elif (user_move == "rock" and bot_move == "paper") or (user_move == "paper" and bot_move == "scissors") or (user_move == "scissors" and bot_move == "rock"):
      bot_score += 1
      print("User move: " + user_move + " | Bot move: " + bot_move)
      print("--------------------")
      print("Bot win this round!")
      print("       Score        ")
      print("User score: " + str(user_score) + " | Bot move: " + str(bot_score))
      print("--------------------")
    elif user_move == "exit":
      break
    else:
      print("Please try again!")

  # Determine the final winner
  if user_score == 3:
    print("====================")
    print("The winner is User")
    print("       Score        ")
    print("User score: " + str(user_score) + " | Bot move: " + str(bot_score))
    print("====================")
  elif bot_score == 3:
    print("====================")
    print("The winner is Bot")
    print("       Score        ")
    print("User score: " + str(user_score) + " | Bot move: " + str(bot_score))
    print("====================")
