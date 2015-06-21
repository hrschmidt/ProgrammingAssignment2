## The following functions are designed to leverage the multiple environments
## that can be used in R by storing a value in a variable in one environment and 
## then calling that variable in another using the cached value.

## Creates a vector that resolves to the mean of the matrix.
makeCacheMatrix <- function(x = matrix()) {
##Creates an empty matrix.
m <- NULL
##Sets the value of the vector.
set <- function(y)
{
x <<- y
m <<- NULL
}
get <- function() x
setinverse <- function(inverse) m <<- inverse
getinverse <- function() m
list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}



## Calculates the inverse of the special “matrix” created in makeCacheMatrix
## If inverse has been calculated, gets the inverse from the cache. If not in cache,
## calculates the inverse of the data.

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
m <- x$getinverse()
if(!is.null(m)) {
message("getting cached data")
return(m)
}
data <- x$get()
m <- solve(data, ...)
x$setinverse(m)
m
}
