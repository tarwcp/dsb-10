## Project: Rock, Paper, and Scissors game
## This project is created for playing game between user and bot. Whoever has 3 points first is the winner.

# Main function
game <- function(){
  # Greeting to user
  print("Welcome to the game!")
  print("Please select your move")
  print("Rock, Paper, or Scissors")
  print("If you want to quit, please type 'Exit'")
  
  # First, define possible moves for bot
  moves <- c("rock","paper","scissors")
  
  # Initialize scores for both side
  user_score <- 0
  bot_score <- 0
  
  # Game loop
  while (user_score <3 && bot_score < 3){
    
    # User's move with receive input from user
    user_move <- tolower(readline("Your move are: "))
    
    # Bot's move
    bot_move <- sample(moves,1)
    
    # Condition clause for determine the winner per round and exit way for user
    if (user_move == bot_move){
      print("--------------------")
      print("Tie!")
      print("       Score        ")
      print(paste("User:",as.character(user_score)," | ","Bot:",as.character(bot_score)))
      print("--------------------")
    }
    else if (user_move == "rock" && bot_move == "scissors" ||
             user_move == "scissors" && bot_move == "paper" ||
             user_move == "paper" && bot_move == "rock"){
      user_score <- user_score + 1
      print("--------------------")
      print("User wins this round")
      print("       Score        ")
      print(paste("User:",as.character(user_score)," | ","Bot:",as.character(bot_score)))
      print("--------------------")
    }
    else if (user_move == "rock" && bot_move == "paper" ||
             user_move == "scissors" && bot_move == "rock" ||
             user_move == "paper" && bot_move == "scissors"){
      bot_score <- bot_score + 1
      print("--------------------")
      print("       Score        ")
      print("Bot wins this round")
      print(paste("User:",as.character(user_score)," | ","Bot:",as.character(bot_score)))
      print("--------------------")
    }
    else if (user_move == "exit") {
      break
    }
    else if (!user_move %in% moves) {
      print("Please try again!")
    }
  }
  # Determine the final winner
  if (user_score == 3){
    print("====================")
    print("User wins the game!")
    print("       Score        ")
    print(paste("User:",as.character(user_score)," | ","Bot:",as.character(bot_score)))
    print("====================")
  } 
  else if (bot_score == 3){
    print("====================")
    print("Bot wins the game!")
    print("       Score        ")
    print(paste("User:",as.character(user_score)," | ","Bot:",as.character(bot_score)))
    print("====================")
  }
}

