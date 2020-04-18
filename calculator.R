##add two numbers
add <- function(x, y) {
  return(x + y)
}

##substract two numbers
subtract <- function(x, y) {
  return(x - y)
}

##multiply two numbers
multiply <- function(x, y) {
  return(x * y)
}

##divide two numbers
divide <- function(x, y) {
  return(x / y)
}

##factors of a number
factors <- function(x) {
  print(paste("The factors of",x,"are:"))
  ##looping from 1 to user input number to get the mod 
  for(i in 1:x) {
    if((x %% i) == 0) {
      print(i)
    }
  }
}

##check for prime number
prime <- function(x) {
  
  ##flag to check if the number is prime
  isprime <- 1
  
  ##work on numbers which are greater than 1
  if(x > 1) {
    if(x == 2){
      isprime <- 1
    }else{
      ##looping from 2 to user input number - 1 (as the number is also divisible by itself)
      for(i in 2:(x-1)) {
        if ((x %% i) == 0) {
          isprime <- 0
          break                    
        }
      }
    }
  }
  
  if(isprime == 1) {
    print(paste(x,"is a prime number"))
  } else {
    print(paste(x,"is not a prime number"))
  }
}
##printing options
print("******Simple R Calculator - Select operation: ******")
print("1.Add")
print("2.Subtract")
print("3.Multiply")
print("4.Divide")
print("5.Factors")
print("6.Prime")

## converting to integer to resolve eval(ei, envir) error 
userchoice <- as.integer(readline(prompt="Enter choice [1/2/3/4/5/6]: "))


## checking number of inputs required for each operations
if(userchoice >= 1 && userchoice < 5){
  x = as.integer(readline(prompt="Enter first number: "))
  y = as.integer(readline(prompt="Enter second number: "))
}else if(userchoice >= 5 && userchoice < 7) {
  x = as.integer(readline(prompt="Enter the number: "))
}else{
  print("Invalid Input")
}

## switch statement to select the right function in order
output <- switch(userchoice, add(x, y), subtract(x, y), multiply(x, y), divide(x, y), factors(x), prime(x))

## printing result for add, substract, multiply, divide
if(userchoice >= 1 && userchoice < 5) {
  operation <- switch(userchoice, "+", "-", "*", "/")
  print(paste(x, operation, y, "=", output))
}

