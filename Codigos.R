set.seed(101) # Semilla de aleatoriedad.

# Se asume que 3 indica que los 3 componentes fallaron.
experimento <- rbinom(5, size = 3, prob = 0.1)
print(experimento)

# Punto 1.
f_n <- replicate(100, sum((rbinom(10000, size = 3, prob = 0.1) == 3)/ 10000))

# a), b) y c).
plot(1:100,
     f_n,pch=19,
     main = "Dispersión de fallo para 3 componentes",
     ylab="fi",
     xlab ="Simulación",
     sub="Figura 1. Gráfico de dispersión del fallo de 3 componentes después de 5 años")
lines(1:100,
      rep(0.001,100), col = "red")

# Punto 2.
n <- c(20, 30, 40, 50, 100, 200, 300, 400, 1000, 20000, 40000, 50000, 60000, 70000, 80000, 90000, 100000, 200000, 500000, 1000000)
length(n)
f_n <- c() # Frecuencia Relativa.
for (i in n){
  f_n <- c(f_n,round(sum(rbinom(i, size=3,prob=0.1) == 3)/i, 3))
}
print(f_n)
plot(1:20,
     f_n,
     pch=19,
     main = "Dispersión de fallo para 3 componentes",
     ylab="fi (%)",
     xlab ="n",
     sub="Figura 2. Diagrama de dispersión de las frecuencias relativas segun el crecimiento de n")
lines(1:20,
      rep(0.001,20), col = "red")