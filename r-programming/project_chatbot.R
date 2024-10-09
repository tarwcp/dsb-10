### Project: Ordering pizza with chatbot

# Main fucntion
pizza_order <- function(){
  # Greeting
  print("Welcome to our place! What would you like to order?")
  
  orders <- list()
  order_count <- 1
  
  # Define the menu
  menu <- list(margherita = 300, pepperoni = 320, classico = 415, marinara = 300, cheese = 399)
  print("This is our menu.")
  print("Margherita, Pepperoni, Classico, Marinara, and Cheese")
  
  while (TRUE){
    # Get order
    user_order <- tolower(readline("Choose your pizza: "))
    while (!(user_order %in% names(menu))){
      print("Unfortunately, we don't have that on our menu")
      user_order <- tolower(readline("Choose your pizza: "))
    }
    
    # Calculate price
    price <- menu[[user_order]]
    
    orders[[order_count]] <- list(order = user_order, price = price)
    order_count <- order_count + 1
    
    another_pizza <- tolower(readline("Would you like to order another pizza? (yes/no): "))
    if (another_pizza != "yes"){
      break
    }
  }
  # Summary the order
  print("Your order summary:")
  print(orders)
  
  # Calculate total order price
  total_order_price <- sum(sapply(orders, function(order) order$price))
  print(paste("Total order price:",total_order_price,"THB"))
  
  # Confirmation
  while (TRUE){
    print("DO you confirm this order? (yes/no)")
    user_con <- tolower(readline())
    if (user_con == "yes"){
      break
    } else if (user_con == "no"){
      print("Order canceled")
      return() #Exit function
    } else {
      print("Invalid input. Please enter 'yes' or 'no'.")
    }
  }
  
 # Choose payment method
  while (TRUE) {
  payment_method <- c("cash","credit card","debit card","promptpay")
  print("Choose your payment method:")
  print("Cash, Credit Card, Debit Card, or PromptPay")
  user_pay <- tolower(readline())
  if (user_pay %in% payment_method){
    break
   } else {
    print("Invalid input. Please try again.")
   }
  }
  
 print("Thank you for your order!")
 print("Have a great day :)")
}
