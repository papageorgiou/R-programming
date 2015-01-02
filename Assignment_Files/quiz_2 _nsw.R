#1 .... 27
cube <- function(x, n) {
  x^3
}
cube(3)

#2...'x' is a vector of length 10 and 'if' can only test a single logical statement.

#3..10
f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}
z <- 10
f(3)

#4...10

x <- 5
y <- if(x < 3) {
  NA
} else {
  10
}
y

#5...f ? 
h <- function(x, y = NULL, d = 3L) {
  z <- cbind(x, d)
  if(!is.null(y))
    z <- z + y
  else
    z <- z + f
  g <- x + y / z
  if(d == 3L)
    return(g)
  g <- g + 10
  g
}


#6...a collection of symbol/value pairs


#7....lexical scopingç

#8...The values of free variables are searched for in the environment in which the function was defined

#9...All objects must be stored in memory

#10...It is the environment in which a function was called



