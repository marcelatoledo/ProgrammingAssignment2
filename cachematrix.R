## Put comments here that give an overall description of what your
## functions do
## setmatrix Receives matrix values from user and saves value in the function memory
## getmatrix Gets matrix values 
## setsolve Calculates inverse matrix
## getsolve Attempts to get inverse matrix results from function memory
## Write a short comment describing this function
## Receives matrix values and sets up functions setmatrix, getmatrix, setsolve and getsolve
makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  setmatrix <- function(y) {
    x <<- y
    s <<- NULL
  }
  getmatrix <- function() x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(setmatrix = setmatrix, getmatrix = getmatrix,
       setsolve = setsolve,
       getsolve = getsolve)
}


## Write a short comment describing this function
## Receives matrix object and functions getmatrix,setsolve and getsolve. Determines if inverse matrix (s) has been
## calculated and either returns the inverse matrix (s) from memory or calculates it (s)and saves in function memory 
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  s <- x$getsolve()
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  data <- x$getmatrix()
  s <- solve(data, ...)
  x$setsolve(s)
  s
}
  

