set.seed(101) # Semilla de aleatoriedad.

# Se asume que 1 indica que el componente
experimento <- rbinom(5, size = 3, prob = 0.1)
print(experimento)

# Punto 1.
muestras <- replicate(100, rbinom(1000, size = 3, prob = 0.1))
f_n <- c() # Frecuencia Relativa.

for (i in 1:100){
  f_n <- c(f_n,sum(muestras[,i] == 3)/1000)
}

# a). y b).
plot(1:100,
     f_n,pch=19,
     main = "Dispersión de fallo para 3 componentes",
     ylab="fi",
     xlab ="Simulación",
     sub="Figura 1. Gráfico de dispersión del fallo de 3 componentes después de 5 años")

mid <- (max(f_n) + min(f_n)) / 2
lines(1:100,
      rep(0.29,100), col = "red")

# c).
n <- c(2, 5, 10, 20, 30, 40, 50, 80, 150, 200, 400, 500, 600, 700, 800, 900, 1000, 2000, 5000, 10000)
f_n <- c() # Frecuencia Relativa.
for (i in n){
  f_n <- c(f_n,sum(rbinom(i, size=3,prob=0.1) == 3)/i)
}
plot(1:20,
     f_n,
     pch=19,
     main = "Dispersión de fallo para 3 componentes",
     ylab="fi (%)",
     xlab ="n",
     sub="Figura 2. Diagrama de dispersión de las frecuencias relativas segun el crecimiento de n")