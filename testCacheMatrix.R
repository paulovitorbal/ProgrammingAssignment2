source("cachematrix.R")
library(svUnit)


test(makeCacheMatrix) <- function () {
    matrix1 <- matrix(c(2,2,3,5),2,2);
    inverMatrix1 <-matrix(c(1.25,-0.5,-0.75,0.5),2,2)
    goodMatrix <- makeCacheMatrix(matrix1)
    nullMatrix <- makeCacheMatrix()
    checkIdentical(
        nullMatrix$get(), 
        matrix(NA), 
        msg = "Verify if is a null value Matrix (1,1)"
    )
    checkIdentical(
        goodMatrix$get(), 
        matrix1, 
        msg = "Verify if the get function is working"
    )
    checkTrue(
        is.null(goodMatrix$getInverseMatrix()), 
        msg = "Verify if the inverse matrix is null until we set it up"
    )
    
}

mcmRunTests <- function(){
    clearLog()
    runTest(makeCacheMatrix)
    Log()
}