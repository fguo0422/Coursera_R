{
    "nbformat_minor": 1, 
    "cells": [
        {
            "source": "#import required library \nlibrary('MASS')\n\n##Function makeCacheMatrix creates a special \"matrix\" object that can cache its inverse.\nmakeCacheMatrix <- function(x = matrix()) {\n        m <- NULL\n        set <- function(y) {\n                x <<- y \n                m <<- NULL\n        }\n        get <- function() x \n        setinv <- function(inv) m<<-inv \n        getinv <- function() m\n        \n        list(set = set, get = get,\n             setinv = setinv,\n             getinv = getinv)\n\n}\n\n\n#Function cacheSolve computes the inverse of the special \"matrix\" returned by \n#makeCacheMatrix above. If the inverse has already been calculated \n#(and the matrix has not changed), then the cachesolve should retrieve the \n#inverse from the cache.\n\ncacheSolve <- function(x, ...) {\n        ## Return a matrix that is the inverse of 'x'\n        m <- x$getinv()\n        print(class(m))\n        print(is.null(m))\n        if(!is.null(m)) {\n                message (\"getting cached data\")\n                return(m)\n        }\n        data <-x$get()\n        print(data)\n        m <-ginv(data)\n        x$setinv(m)\n        m\n}\n", 
            "cell_type": "code", 
            "execution_count": 11, 
            "outputs": [], 
            "metadata": {}
        }, 
        {
            "source": "\n#test functions\nmy_matrix <- matrix(rnorm(16,1),4,4)", 
            "cell_type": "code", 
            "execution_count": 12, 
            "outputs": [], 
            "metadata": {}
        }, 
        {
            "source": "my_matrix", 
            "cell_type": "code", 
            "execution_count": 13, 
            "outputs": [
                {
                    "output_type": "display_data", 
                    "data": {
                        "text/plain": "     [,1]        [,2]       [,3]      [,4]     \n[1,]  0.14786201 -0.1949809 0.1985277 0.3455896\n[2,] -0.09184325 -0.5621930 2.2902086 1.5428314\n[3,]  1.85707726  1.2261722 1.2785838 1.2015577\n[4,] -0.71534329 -0.4555324 1.2175613 2.5383364", 
                        "text/latex": "\\begin{tabular}{llll}\n\t  0.14786201 & -0.1949809  & 0.1985277   & 0.3455896  \\\\\n\t -0.09184325 & -0.5621930  & 2.2902086   & 1.5428314  \\\\\n\t  1.85707726 &  1.2261722  & 1.2785838   & 1.2015577  \\\\\n\t -0.71534329 & -0.4555324  & 1.2175613   & 2.5383364  \\\\\n\\end{tabular}\n", 
                        "text/html": "<table>\n<tbody>\n\t<tr><td> 0.14786201</td><td>-0.1949809 </td><td>0.1985277  </td><td>0.3455896  </td></tr>\n\t<tr><td>-0.09184325</td><td>-0.5621930 </td><td>2.2902086  </td><td>1.5428314  </td></tr>\n\t<tr><td> 1.85707726</td><td> 1.2261722 </td><td>1.2785838  </td><td>1.2015577  </td></tr>\n\t<tr><td>-0.71534329</td><td>-0.4555324 </td><td>1.2175613  </td><td>2.5383364  </td></tr>\n</tbody>\n</table>\n", 
                        "text/markdown": "\n|  0.14786201 | -0.1949809  | 0.1985277   | 0.3455896   |\n| -0.09184325 | -0.5621930  | 2.2902086   | 1.5428314   |\n|  1.85707726 |  1.2261722  | 1.2785838   | 1.2015577   |\n| -0.71534329 | -0.4555324  | 1.2175613   | 2.5383364   |\n\n"
                    }, 
                    "metadata": {}
                }
            ], 
            "metadata": {}
        }, 
        {
            "source": "cmc <- makeCacheMatrix(my_matrix)", 
            "cell_type": "code", 
            "execution_count": 14, 
            "outputs": [], 
            "metadata": {}
        }, 
        {
            "source": "cmc", 
            "cell_type": "code", 
            "execution_count": 15, 
            "outputs": [
                {
                    "output_type": "display_data", 
                    "data": {
                        "text/plain": "$set\nfunction(y) {\n                x <<- y \n                m <<- NULL\n        }\n<environment: 0x55b79369ba38>\n\n$get\nfunction() x\n<environment: 0x55b79369ba38>\n\n$setinv\nfunction(inv) m<<-inv\n<environment: 0x55b79369ba38>\n\n$getinv\nfunction() m\n<environment: 0x55b79369ba38>\n", 
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
            "source": "cacheSolve(cmc)", 
            "cell_type": "code", 
            "execution_count": 16, 
            "outputs": [
                {
                    "output_type": "stream", 
                    "name": "stdout", 
                    "text": "[1] \"NULL\"\n[1] TRUE\n            [,1]       [,2]      [,3]      [,4]\n[1,]  0.14786201 -0.1949809 0.1985277 0.3455896\n[2,] -0.09184325 -0.5621930 2.2902086 1.5428314\n[3,]  1.85707726  1.2261722 1.2785838 1.2015577\n[4,] -0.71534329 -0.4555324 1.2175613 2.5383364\n"
                }, 
                {
                    "output_type": "display_data", 
                    "data": {
                        "text/plain": "     [,1]       [,2]       [,3]       [,4]      \n[1,]  2.4822905 -0.1433098 0.20055380 -0.3457886\n[2,] -3.2237621 -0.1022289 0.37605495  0.3230340\n[3,] -1.1425215  0.6579841 0.02484514 -0.2561394\n[4,]  0.6690412 -0.3743477 0.11208899  0.4773442", 
                        "text/latex": "\\begin{tabular}{llll}\n\t  2.4822905 & -0.1433098 & 0.20055380 & -0.3457886\\\\\n\t -3.2237621 & -0.1022289 & 0.37605495 &  0.3230340\\\\\n\t -1.1425215 &  0.6579841 & 0.02484514 & -0.2561394\\\\\n\t  0.6690412 & -0.3743477 & 0.11208899 &  0.4773442\\\\\n\\end{tabular}\n", 
                        "text/html": "<table>\n<tbody>\n\t<tr><td> 2.4822905</td><td>-0.1433098</td><td>0.20055380</td><td>-0.3457886</td></tr>\n\t<tr><td>-3.2237621</td><td>-0.1022289</td><td>0.37605495</td><td> 0.3230340</td></tr>\n\t<tr><td>-1.1425215</td><td> 0.6579841</td><td>0.02484514</td><td>-0.2561394</td></tr>\n\t<tr><td> 0.6690412</td><td>-0.3743477</td><td>0.11208899</td><td> 0.4773442</td></tr>\n</tbody>\n</table>\n", 
                        "text/markdown": "\n|  2.4822905 | -0.1433098 | 0.20055380 | -0.3457886 |\n| -3.2237621 | -0.1022289 | 0.37605495 |  0.3230340 |\n| -1.1425215 |  0.6579841 | 0.02484514 | -0.2561394 |\n|  0.6690412 | -0.3743477 | 0.11208899 |  0.4773442 |\n\n"
                    }, 
                    "metadata": {}
                }
            ], 
            "metadata": {}
        }, 
        {
            "source": "# Test cache\ncacheSolve(cmc)", 
            "cell_type": "code", 
            "execution_count": 17, 
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
                        "text/plain": "     [,1]       [,2]       [,3]       [,4]      \n[1,]  2.4822905 -0.1433098 0.20055380 -0.3457886\n[2,] -3.2237621 -0.1022289 0.37605495  0.3230340\n[3,] -1.1425215  0.6579841 0.02484514 -0.2561394\n[4,]  0.6690412 -0.3743477 0.11208899  0.4773442", 
                        "text/latex": "\\begin{tabular}{llll}\n\t  2.4822905 & -0.1433098 & 0.20055380 & -0.3457886\\\\\n\t -3.2237621 & -0.1022289 & 0.37605495 &  0.3230340\\\\\n\t -1.1425215 &  0.6579841 & 0.02484514 & -0.2561394\\\\\n\t  0.6690412 & -0.3743477 & 0.11208899 &  0.4773442\\\\\n\\end{tabular}\n", 
                        "text/html": "<table>\n<tbody>\n\t<tr><td> 2.4822905</td><td>-0.1433098</td><td>0.20055380</td><td>-0.3457886</td></tr>\n\t<tr><td>-3.2237621</td><td>-0.1022289</td><td>0.37605495</td><td> 0.3230340</td></tr>\n\t<tr><td>-1.1425215</td><td> 0.6579841</td><td>0.02484514</td><td>-0.2561394</td></tr>\n\t<tr><td> 0.6690412</td><td>-0.3743477</td><td>0.11208899</td><td> 0.4773442</td></tr>\n</tbody>\n</table>\n", 
                        "text/markdown": "\n|  2.4822905 | -0.1433098 | 0.20055380 | -0.3457886 |\n| -3.2237621 | -0.1022289 | 0.37605495 |  0.3230340 |\n| -1.1425215 |  0.6579841 | 0.02484514 | -0.2561394 |\n|  0.6690412 | -0.3743477 | 0.11208899 |  0.4773442 |\n\n"
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