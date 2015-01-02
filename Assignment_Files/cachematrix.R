


## This function takes as input a matrix and generates and stores a special matrix object and provides a list of four functions that can be called on it: set to change its value, get to return the original matrix, and correspondingly setinverse and getinverse for the inverse of the matrix if it exists 

makeCacheMatrix <- function(x = matrix()) {
        inv=NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) inv <<- inverse
        getinverse <- function() inv
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}



## Calclulates the inverse of the special matrix, but before doing so checks if this value is already available from the cache. If not calculates it and stores it in cache 

cacheSolve <- function(x, ...) {
        inv <- x$getinverse()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinverse(inv)
        inv        
}






