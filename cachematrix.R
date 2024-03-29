## Assignment2
##Function makeCacheMatrix creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y 
                m <<- NULL
        }
        get <- function() x 
        setinv <- function(inv) m<<-inv 
        getinv <- function() m
        
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)

}


#Function cacheSolve computes the inverse of the special "matrix" returned by 
#makeCacheMatrix above. If the inverse has already been calculated 
#(and the matrix has not changed), then the cachesolve should retrieve the 
#inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinv()
        print(class(m))
        print(is.null(m))
        if(!is.null(m)) {
                message ("getting cached data")
                return(m)
        }
        data <-x$get()
        print(data)
        #m <-ginv(data)
        m <-solve(data)
        x$setinv(m)
        m
}
