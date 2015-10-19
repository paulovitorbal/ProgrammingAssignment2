## This file has two objects, one for manipulate cache, and other to calculate inverse matrix
## and manipulate the cache interface (makeCacheMatrix)

# This object(list of four functions) will have the operations to 
# get the matrix, and the inverted matrix from cache.
# WARNING: the getInverseMatrix can return NULL values, if called before setInverseMatrix.
makeCacheMatrix <- function(localMatrix = matrix()) {
    inverseMatrix<<- NULL
    set <- function(newMatrix) {
        localMatrix <<- newMatrix
        inverseMatrix <<- NULL
    }
    get <- function() localMatrix
    setInverseMatrix <- function(inversedMatrix){
        inverseMatrix <<- inversedMatrix
    }
    getInverseMatrix <- function(){
        inverseMatrix
    }
    list(
        set = set, 
        get = get,
        setInverseMatrix = setInverseMatrix,
        getInverseMatrix = getInverseMatrix
    )
}


# This function will try to get the inverted matrix (if already cached)
# if there is nothing cached, 
#   then we will calculate the inverted matrix 
#        and use the functions to use the cache memory
cacheSolve <- function(x, ...) {
    result <- x$getInverseMatrix()
    if (!is.null(result)){
        message("getting cached data")
        return(result)
    }
    message("will calculate the inverse matrix then save to cache")
    m <- x$get()
    
    x$setInverseMatrix(solve(m))
    
    x$getInverseMatrix()
    
}
