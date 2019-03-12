# Lapply

x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean)

x <- 1:4
lapply(x, runif, min = 0.8, max = 10)

# Sapply
# Igual pero retorna vector o matrix según resultado, o lista si no puede

x <- list(a = 1:5, b = rnorm(10))
sapply(x, mean)

# Apply
# Aplica función a columnas o filas (igual a rowsum o colsum), incluso a 3d

x <- matrix(rnorm(200), 20, 10)
apply(x,2,mean)

apply(x, 1, quantile, probs = c(0.25,0.75))

# Mapply
# aplica una función a multiples elementos como argumentos
mapply(rep,  1:4, 4:1)

noise <- function(n,mean,sd) {
  rnorm(n,mean,sd)
}

mapply(noise,1:5,1:5,2)

# Tapply
# corre una función sobre un vector, con un indice que permite agrupar el vector






