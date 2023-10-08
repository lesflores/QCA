#--------------------
# Análisis Comparativo Cualitativo Nítido (Crisp-Set o csQCA) utilizando R
# Ejemplo hipotético ilustrativo
#--------------------

library(SetMethods)
library(QCA)

# Datos ficticios
set.seed(123) 
n <- 10 # Número de observaciones

A <- sample(c(0, 1), n, replace = TRUE) 
B <- sample(c(0, 1), n, replace = TRUE) 
C <- sample(c(0, 1), n, replace = TRUE)
Resultado <- sample(c(0, 1), n, replace = TRUE)

datos <- data.frame(A, B, C, Resultado)

# Tabla de Verdad
# incl.cut. Un puntaje de 1 indica que la configuración de condiciones es suficiente para el resultado
tv <- truthTable(data = datos, outcome = "Resultado", conditions = c("A, B, C"), incl.cut= 1, complete=TRUE)
tv

# Condiciones Necesarias 
QCAfit(x = datos[, c("A", "B", "C")], y = datos$Resultado, necessity = TRUE)

# Minimización Booleana
minimize(input = tv, include = "all", details = TRUE)

