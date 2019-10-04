{
    "nbformat_minor": 1, 
    "cells": [
        {
            "source": "#import required library \nlibrary('MASS')\n\n##Function makeCacheMatrix creates a special \"matrix\" object that can cache its inverse.\nmakeCacheMatrix <- function(x = matrix()) {\n        m <- NULL\n        set <- function(y) {\n                x <<- y \n                m <<- NULL\n        }\n        get <- function() x \n        setinv <- function(inv) m<<-inv \n        getinv <- function() m\n        \n        list(set = set, get = get,\n             setinv = setinv,\n             getinv = getinv)\n\n}\n\n\n#Function cacheSolve computes the inverse of the special \"matrix\" returned by \n#makeCacheMatrix above. If the inverse has already been calculated \n#(and the matrix has not changed), then the cachesolve should retrieve the \n#inverse from the cache.\n\ncacheSolve <- function(x, ...) {\n        ## Return a matrix that is the inverse of 'x'\n        m <- x$getinv()\n        print(class(m))\n        print(is.null(m))\n        if(!is.null(m)) {\n                message (\"getting cached data\")\n                return(m)\n        }\n        data <-x$get()\n        print(data)\n        #m <-ginv(data)\n        m <- solve(data)\n        x$setinv(m)\n        m\n}\n", 
            "cell_type": "code", 
            "execution_count": 1, 
            "outputs": [], 
            "metadata": {}
        }, 
        {
            "source": "\n#test functions\nmy_matrix <- matrix(rnorm(16,1),4,4)", 
            "cell_type": "code", 
            "execution_count": 2, 
            "outputs": [], 
            "metadata": {}
        }, 
        {
            "source": "my_matrix", 
            "cell_type": "code", 
            "execution_count": 3, 
            "outputs": [
                {
                    "output_type": "display_data", 
                    "data": {
                        "text/plain": "     [,1]       [,2]       [,3]      [,4]     \n[1,]  0.8193909  0.2517473 -0.509884 1.8943160\n[2,]  0.7139540  0.2591458  1.981161 0.1567755\n[3,] -0.2774949 -0.7694408  2.126529 0.3873316\n[4,]  1.2673081  1.8598123  1.791439 0.4871860", 
                        "text/latex": "\\begin{tabular}{llll}\n\t  0.8193909 &  0.2517473 & -0.509884  & 1.8943160 \\\\\n\t  0.7139540 &  0.2591458 &  1.981161  & 0.1567755 \\\\\n\t -0.2774949 & -0.7694408 &  2.126529  & 0.3873316 \\\\\n\t  1.2673081 &  1.8598123 &  1.791439  & 0.4871860 \\\\\n\\end{tabular}\n", 
                        "text/html": "<table>\n<tbody>\n\t<tr><td> 0.8193909</td><td> 0.2517473</td><td>-0.509884 </td><td>1.8943160 </td></tr>\n\t<tr><td> 0.7139540</td><td> 0.2591458</td><td> 1.981161 </td><td>0.1567755 </td></tr>\n\t<tr><td>-0.2774949</td><td>-0.7694408</td><td> 2.126529 </td><td>0.3873316 </td></tr>\n\t<tr><td> 1.2673081</td><td> 1.8598123</td><td> 1.791439 </td><td>0.4871860 </td></tr>\n</tbody>\n</table>\n", 
                        "text/markdown": "\n|  0.8193909 |  0.2517473 | -0.509884  | 1.8943160  |\n|  0.7139540 |  0.2591458 |  1.981161  | 0.1567755  |\n| -0.2774949 | -0.7694408 |  2.126529  | 0.3873316  |\n|  1.2673081 |  1.8598123 |  1.791439  | 0.4871860  |\n\n"
                    }, 
                    "metadata": {}
                }
            ], 
            "metadata": {}
        }, 
        {
            "source": "cmc1 <- makeCacheMatrix(my_matrix)", 
            "cell_type": "code", 
            "execution_count": 4, 
            "outputs": [], 
            "metadata": {}
        }, 
        {
            "source": "cmc1", 
            "cell_type": "code", 
            "execution_count": 5, 
            "outputs": [
                {
                    "output_type": "display_data", 
                    "data": {
                        "text/plain": "$set\nfunction(y) {\n                x <<- y \n                m <<- NULL\n        }\n<environment: 0x55d8bbb22780>\n\n$get\nfunction() x\n<environment: 0x55d8bbb22780>\n\n$setinv\nfunction(inv) m<<-inv\n<environment: 0x55d8bbb22780>\n\n$getinv\nfunction() m\n<environment: 0x55d8bbb22780>\n", 
                        "text/latex": "\\begin{description}\n\\item[\\$set] \\begin{minted}{r}\nfunction (y) \n\\{\n    x <<- y\n    m <<- NULL\n\\}\n\\end{minted}\n\\item[\\$get] \\begin{minted}{r}\nfunction () \nx\n\\end{minted}\n\\item[\\$setinv] \\begin{minted}{r}\nfunction (inv) \nm <<- inv\n\\end{minted}\n\\item[\\$getinv] \\begin{minted}{r}\nfunction () \nm\n\\end{minted}\n\\end{description}\n", 
                        "text/html": "<dl>\n\t<dt>$set</dt>\n\t\t<dd><pre class=language-r><code>function (y) \n{\n<span style=white-space:pre-wrap>    x &lt;&lt;- y</span>\n<span style=white-space:pre-wrap>    m &lt;&lt;- NULL</span>\n}</code></pre></dd>\n\t<dt>$get</dt>\n\t\t<dd><pre class=language-r><code>function () \nx</code></pre></dd>\n\t<dt>$setinv</dt>\n\t\t<dd><pre class=language-r><code>function (inv) \nm &lt;&lt;- inv</code></pre></dd>\n\t<dt>$getinv</dt>\n\t\t<dd><pre class=language-r><code>function () \nm</code></pre></dd>\n</dl>\n", 
                        "text/markdown": "$set\n:   ```r\nfunction (y) \n{\n    x <<- y\n    m <<- NULL\n}\n```\n$get\n:   ```r\nfunction () \nx\n```\n$setinv\n:   ```r\nfunction (inv) \nm <<- inv\n```\n$getinv\n:   ```r\nfunction () \nm\n```\n\n\n"
                    }, 
                    "metadata": {}
                }
            ], 
            "metadata": {}
        }, 
        {
            "source": "cacheSolve(cmc1)", 
            "cell_type": "code", 
            "execution_count": 6, 
            "outputs": [
                {
                    "output_type": "stream", 
                    "name": "stdout", 
                    "text": "[1] \"NULL\"\n[1] TRUE\n           [,1]       [,2]      [,3]      [,4]\n[1,]  0.8193909  0.2517473 -0.509884 1.8943160\n[2,]  0.7139540  0.2591458  1.981161 0.1567755\n[3,] -0.2774949 -0.7694408  2.126529 0.3873316\n[4,]  1.2673081  1.8598123  1.791439 0.4871860\n"
                }, 
                {
                    "output_type": "display_data", 
                    "data": {
                        "text/plain": "     [,1]       [,2]       [,3]       [,4]      \n[1,]  0.2777809  2.0653509 -1.1742049 -0.8111780\n[2,] -0.1922037 -1.1885256  0.3313256  0.8663905\n[3,] -0.1069717 -0.0253380  0.3359475  0.1569985\n[4,]  0.4044903 -0.7422421  0.5542986  0.2779956", 
                        "text/latex": "\\begin{tabular}{llll}\n\t  0.2777809 &  2.0653509 & -1.1742049 & -0.8111780\\\\\n\t -0.1922037 & -1.1885256 &  0.3313256 &  0.8663905\\\\\n\t -0.1069717 & -0.0253380 &  0.3359475 &  0.1569985\\\\\n\t  0.4044903 & -0.7422421 &  0.5542986 &  0.2779956\\\\\n\\end{tabular}\n", 
                        "text/html": "<table>\n<tbody>\n\t<tr><td> 0.2777809</td><td> 2.0653509</td><td>-1.1742049</td><td>-0.8111780</td></tr>\n\t<tr><td>-0.1922037</td><td>-1.1885256</td><td> 0.3313256</td><td> 0.8663905</td></tr>\n\t<tr><td>-0.1069717</td><td>-0.0253380</td><td> 0.3359475</td><td> 0.1569985</td></tr>\n\t<tr><td> 0.4044903</td><td>-0.7422421</td><td> 0.5542986</td><td> 0.2779956</td></tr>\n</tbody>\n</table>\n", 
                        "text/markdown": "\n|  0.2777809 |  2.0653509 | -1.1742049 | -0.8111780 |\n| -0.1922037 | -1.1885256 |  0.3313256 |  0.8663905 |\n| -0.1069717 | -0.0253380 |  0.3359475 |  0.1569985 |\n|  0.4044903 | -0.7422421 |  0.5542986 |  0.2779956 |\n\n"
                    }, 
                    "metadata": {}
                }
            ], 
            "metadata": {}
        }, 
        {
            "source": "# Test cache\ncacheSolve(cmc1)", 
            "cell_type": "code", 
            "execution_count": 7, 
            "outputs": [
                {
                    "output_type": "stream", 
                    "name": "stdout", 
                    "text": "[1] \"matrix\"\n[1] FALSE\n"
                }, 
                {
                    "output_type": "stream", 
                    "name": "stderr", 
                    "text": "getting cached data\n"
                }, 
                {
                    "output_type": "display_data", 
                    "data": {
                        "text/plain": "     [,1]       [,2]       [,3]       [,4]      \n[1,]  0.2777809  2.0653509 -1.1742049 -0.8111780\n[2,] -0.1922037 -1.1885256  0.3313256  0.8663905\n[3,] -0.1069717 -0.0253380  0.3359475  0.1569985\n[4,]  0.4044903 -0.7422421  0.5542986  0.2779956", 
                        "text/latex": "\\begin{tabular}{llll}\n\t  0.2777809 &  2.0653509 & -1.1742049 & -0.8111780\\\\\n\t -0.1922037 & -1.1885256 &  0.3313256 &  0.8663905\\\\\n\t -0.1069717 & -0.0253380 &  0.3359475 &  0.1569985\\\\\n\t  0.4044903 & -0.7422421 &  0.5542986 &  0.2779956\\\\\n\\end{tabular}\n", 
                        "text/html": "<table>\n<tbody>\n\t<tr><td> 0.2777809</td><td> 2.0653509</td><td>-1.1742049</td><td>-0.8111780</td></tr>\n\t<tr><td>-0.1922037</td><td>-1.1885256</td><td> 0.3313256</td><td> 0.8663905</td></tr>\n\t<tr><td>-0.1069717</td><td>-0.0253380</td><td> 0.3359475</td><td> 0.1569985</td></tr>\n\t<tr><td> 0.4044903</td><td>-0.7422421</td><td> 0.5542986</td><td> 0.2779956</td></tr>\n</tbody>\n</table>\n", 
                        "text/markdown": "\n|  0.2777809 |  2.0653509 | -1.1742049 | -0.8111780 |\n| -0.1922037 | -1.1885256 |  0.3313256 |  0.8663905 |\n| -0.1069717 | -0.0253380 |  0.3359475 |  0.1569985 |\n|  0.4044903 | -0.7422421 |  0.5542986 |  0.2779956 |\n\n"
                    }, 
                    "metadata": {}
                }
            ], 
            "metadata": {}
        }, 
        {
            "source": "", 
            "cell_type": "code", 
            "execution_count": null, 
            "outputs": [], 
            "metadata": {}
        }
    ], 
    "nbformat": 4, 
    "metadata": {
        "kernelspec": {
            "display_name": "R 3.6", 
            "name": "r-3.6", 
            "language": "R"
        }, 
        "language_info": {
            "mimetype": "text/x-r-source", 
            "version": "3.6.0", 
            "name": "R", 
            "pygments_lexer": "r", 
            "file_extension": ".r", 
            "codemirror_mode": "r"
        }
    }
}