{
    "nbformat_minor": 1, 
    "cells": [
        {
            "execution_count": 18, 
            "cell_type": "code", 
            "metadata": {}, 
            "outputs": [], 
            "source": "#import required library \nlibrary('MASS')\n\n##Function makeCacheMatrix creates a special \"matrix\" object that can cache its inverse.\nmakeCacheMatrix <- function(x = matrix()) {\n        m <- NULL\n        set <- function(y) {\n                x <<- y \n                m <<- NULL\n        }\n        get <- function() x \n        setinv <- function(inv) m<<-inv \n        getinv <- function() m\n        \n        list(set = set, get = get,\n             setinv = setinv,\n             getinv = getinv)\n\n}\n\n\n#Function cacheSolve computes the inverse of the special \"matrix\" returned by \n#makeCacheMatrix above. If the inverse has already been calculated \n#(and the matrix has not changed), then the cachesolve should retrieve the \n#inverse from the cache.\n\ncacheSolve <- function(x, ...) {\n        ## Return a matrix that is the inverse of 'x'\n        m <- x$getinv()\n        print(class(m))\n        print(is.null(m))\n        if(!is.null(m)) {\n                message (\"getting cached data\")\n                return(m)\n        }\n        data <-x$get()\n        print(data)\n        #m <-ginv(data)\n        m <-\n        x$setinv(m)\n        m\n}\n"
        }, 
        {
            "execution_count": 19, 
            "cell_type": "code", 
            "metadata": {}, 
            "outputs": [], 
            "source": "\n#test functions\nmy_matrix <- matrix(rnorm(16,1),4,4)"
        }, 
        {
            "execution_count": 20, 
            "cell_type": "code", 
            "metadata": {}, 
            "outputs": [
                {
                    "output_type": "display_data", 
                    "data": {
                        "text/html": "<table>\n<tbody>\n\t<tr><td>1.5237240  </td><td> 0.27674433</td><td> 1.3726763 </td><td> 2.67345755</td></tr>\n\t<tr><td>3.1265913  </td><td> 2.12987312</td><td>-0.5075561 </td><td> 3.19781059</td></tr>\n\t<tr><td>1.9558503  </td><td> 2.48462886</td><td> 2.7392370 </td><td>-0.01145616</td></tr>\n\t<tr><td>0.9184496  </td><td>-0.02165846</td><td> 0.9425958 </td><td> 2.42587191</td></tr>\n</tbody>\n</table>\n", 
                        "text/latex": "\\begin{tabular}{llll}\n\t 1.5237240   &  0.27674433 &  1.3726763  &  2.67345755\\\\\n\t 3.1265913   &  2.12987312 & -0.5075561  &  3.19781059\\\\\n\t 1.9558503   &  2.48462886 &  2.7392370  & -0.01145616\\\\\n\t 0.9184496   & -0.02165846 &  0.9425958  &  2.42587191\\\\\n\\end{tabular}\n", 
                        "text/markdown": "\n| 1.5237240   |  0.27674433 |  1.3726763  |  2.67345755 |\n| 3.1265913   |  2.12987312 | -0.5075561  |  3.19781059 |\n| 1.9558503   |  2.48462886 |  2.7392370  | -0.01145616 |\n| 0.9184496   | -0.02165846 |  0.9425958  |  2.42587191 |\n\n", 
                        "text/plain": "     [,1]      [,2]        [,3]       [,4]       \n[1,] 1.5237240  0.27674433  1.3726763  2.67345755\n[2,] 3.1265913  2.12987312 -0.5075561  3.19781059\n[3,] 1.9558503  2.48462886  2.7392370 -0.01145616\n[4,] 0.9184496 -0.02165846  0.9425958  2.42587191"
                    }, 
                    "metadata": {}
                }
            ], 
            "source": "my_matrix"
        }, 
        {
            "execution_count": 21, 
            "cell_type": "code", 
            "metadata": {}, 
            "outputs": [], 
            "source": "cmc <- makeCacheMatrix(my_matrix)"
        }, 
        {
            "execution_count": 22, 
            "cell_type": "code", 
            "metadata": {}, 
            "outputs": [
                {
                    "output_type": "display_data", 
                    "data": {
                        "text/html": "<dl>\n\t<dt>$set</dt>\n\t\t<dd><pre class=language-r><code>function (y) \n{\n<span style=white-space:pre-wrap>    x &lt;&lt;- y</span>\n<span style=white-space:pre-wrap>    m &lt;&lt;- NULL</span>\n}</code></pre></dd>\n\t<dt>$get</dt>\n\t\t<dd><pre class=language-r><code>function () \nx</code></pre></dd>\n\t<dt>$setinv</dt>\n\t\t<dd><pre class=language-r><code>function (inv) \nm &lt;&lt;- inv</code></pre></dd>\n\t<dt>$getinv</dt>\n\t\t<dd><pre class=language-r><code>function () \nm</code></pre></dd>\n</dl>\n", 
                        "text/latex": "\\begin{description}\n\\item[\\$set] \\begin{minted}{r}\nfunction (y) \n\\{\n    x <<- y\n    m <<- NULL\n\\}\n\\end{minted}\n\\item[\\$get] \\begin{minted}{r}\nfunction () \nx\n\\end{minted}\n\\item[\\$setinv] \\begin{minted}{r}\nfunction (inv) \nm <<- inv\n\\end{minted}\n\\item[\\$getinv] \\begin{minted}{r}\nfunction () \nm\n\\end{minted}\n\\end{description}\n", 
                        "text/markdown": "$set\n:   ```r\nfunction (y) \n{\n    x <<- y\n    m <<- NULL\n}\n```\n$get\n:   ```r\nfunction () \nx\n```\n$setinv\n:   ```r\nfunction (inv) \nm <<- inv\n```\n$getinv\n:   ```r\nfunction () \nm\n```\n\n\n", 
                        "text/plain": "$set\nfunction(y) {\n                x <<- y \n                m <<- NULL\n        }\n<environment: 0x55b793f2f9d0>\n\n$get\nfunction() x\n<environment: 0x55b793f2f9d0>\n\n$setinv\nfunction(inv) m<<-inv\n<environment: 0x55b793f2f9d0>\n\n$getinv\nfunction() m\n<environment: 0x55b793f2f9d0>\n"
                    }, 
                    "metadata": {}
                }
            ], 
            "source": "cmc"
        }, 
        {
            "execution_count": 23, 
            "cell_type": "code", 
            "metadata": {}, 
            "outputs": [
                {
                    "output_type": "stream", 
                    "name": "stdout", 
                    "text": "[1] \"NULL\"\n[1] TRUE\n          [,1]        [,2]       [,3]        [,4]\n[1,] 1.5237240  0.27674433  1.3726763  2.67345755\n[2,] 3.1265913  2.12987312 -0.5075561  3.19781059\n[3,] 1.9558503  2.48462886  2.7392370 -0.01145616\n[4,] 0.9184496 -0.02165846  0.9425958  2.42587191\n"
                }, 
                {
                    "output_type": "display_data", 
                    "data": {
                        "text/html": "<table>\n<tbody>\n\t<tr><td> 3.6434655  </td><td> 0.001682062</td><td>-0.44229941 </td><td>-4.0196254  </td></tr>\n\t<tr><td>-3.0818420  </td><td> 0.265727608</td><td> 0.54452622 </td><td> 3.0486628  </td></tr>\n\t<tr><td> 0.1877189  </td><td>-0.241829381</td><td> 0.18737551 </td><td> 0.1127894  </td></tr>\n\t<tr><td>-1.4798929  </td><td> 0.095700733</td><td> 0.09951224 </td><td> 1.9174706  </td></tr>\n</tbody>\n</table>\n", 
                        "text/latex": "\\begin{tabular}{llll}\n\t  3.6434655   &  0.001682062 & -0.44229941  & -4.0196254  \\\\\n\t -3.0818420   &  0.265727608 &  0.54452622  &  3.0486628  \\\\\n\t  0.1877189   & -0.241829381 &  0.18737551  &  0.1127894  \\\\\n\t -1.4798929   &  0.095700733 &  0.09951224  &  1.9174706  \\\\\n\\end{tabular}\n", 
                        "text/markdown": "\n|  3.6434655   |  0.001682062 | -0.44229941  | -4.0196254   |\n| -3.0818420   |  0.265727608 |  0.54452622  |  3.0486628   |\n|  0.1877189   | -0.241829381 |  0.18737551  |  0.1127894   |\n| -1.4798929   |  0.095700733 |  0.09951224  |  1.9174706   |\n\n", 
                        "text/plain": "     [,1]       [,2]         [,3]        [,4]      \n[1,]  3.6434655  0.001682062 -0.44229941 -4.0196254\n[2,] -3.0818420  0.265727608  0.54452622  3.0486628\n[3,]  0.1877189 -0.241829381  0.18737551  0.1127894\n[4,] -1.4798929  0.095700733  0.09951224  1.9174706"
                    }, 
                    "metadata": {}
                }
            ], 
            "source": "cacheSolve(cmc)"
        }, 
        {
            "execution_count": 24, 
            "cell_type": "code", 
            "metadata": {}, 
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
                        "text/html": "<table>\n<tbody>\n\t<tr><td> 3.6434655  </td><td> 0.001682062</td><td>-0.44229941 </td><td>-4.0196254  </td></tr>\n\t<tr><td>-3.0818420  </td><td> 0.265727608</td><td> 0.54452622 </td><td> 3.0486628  </td></tr>\n\t<tr><td> 0.1877189  </td><td>-0.241829381</td><td> 0.18737551 </td><td> 0.1127894  </td></tr>\n\t<tr><td>-1.4798929  </td><td> 0.095700733</td><td> 0.09951224 </td><td> 1.9174706  </td></tr>\n</tbody>\n</table>\n", 
                        "text/latex": "\\begin{tabular}{llll}\n\t  3.6434655   &  0.001682062 & -0.44229941  & -4.0196254  \\\\\n\t -3.0818420   &  0.265727608 &  0.54452622  &  3.0486628  \\\\\n\t  0.1877189   & -0.241829381 &  0.18737551  &  0.1127894  \\\\\n\t -1.4798929   &  0.095700733 &  0.09951224  &  1.9174706  \\\\\n\\end{tabular}\n", 
                        "text/markdown": "\n|  3.6434655   |  0.001682062 | -0.44229941  | -4.0196254   |\n| -3.0818420   |  0.265727608 |  0.54452622  |  3.0486628   |\n|  0.1877189   | -0.241829381 |  0.18737551  |  0.1127894   |\n| -1.4798929   |  0.095700733 |  0.09951224  |  1.9174706   |\n\n", 
                        "text/plain": "     [,1]       [,2]         [,3]        [,4]      \n[1,]  3.6434655  0.001682062 -0.44229941 -4.0196254\n[2,] -3.0818420  0.265727608  0.54452622  3.0486628\n[3,]  0.1877189 -0.241829381  0.18737551  0.1127894\n[4,] -1.4798929  0.095700733  0.09951224  1.9174706"
                    }, 
                    "metadata": {}
                }
            ], 
            "source": "# Test cache\ncacheSolve(cmc)"
        }, 
        {
            "execution_count": null, 
            "cell_type": "code", 
            "metadata": {}, 
            "outputs": [], 
            "source": ""
        }
    ], 
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
    }, 
    "nbformat": 4
}