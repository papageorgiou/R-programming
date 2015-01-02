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

amatrix = makeCacheMatrix(matrix(c(1,2,3,4), nrow=2, ncol=2))
amatrix$get()  # Returns original matrix
cacheSolve(amatrix) # Computes, caches, and returns    matrix inverse
amatrix$getinverse() # Returns matrix inverse
cacheSolve(amatrix)
amatrix$set(matrix(c(0,5,99,66), nrow=2, ncol=2)) # Modify existing matrix

cacheSolve(amatrix)   # Computes, caches, and returns new matrix inverse getting cached data
amatrix$get()         # Returns matrix
amatrix$getinverse()  # Returns matrix inverse

theData=c(1,2,3,4,1,6,7,8,1)
C=matrix(theData, 3,3)
amatrix$getinverse() 
CM=makeCacheMatrix(C)

cacheSolve(CM)





