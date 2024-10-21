library(readr)
Dati3 <- read_delim("Dati3.csv", delim = ";", 
                    escape_double = FALSE, trim_ws = TRUE)
Dati3 <- Dati3[!is.na(datos$Temperatura), ]
View(Dati3)    

# Visualizar las primeras filas de los datos para asegurarte que se han cargado correctamente
head(Dati3)

# Instalar (si es necesario) y cargar la librería ggplot2 para gráficos
library(ggplot2)
colnames(Dati3)

# Crear el gráfico
ggplot(Dati3, aes(x = Voltmetro, y = Ampmetro, color = factor(Temperature))) +
  geom_line() +
  geom_point() +
  labs(x = "Voltage (V)",
       y = "Current (mA)",
       color = "Temperature") +
  theme_minimal()
# Lista de temperaturas únicas
temperaturas <- unique(Dati3$Temperature)



# Bucle para generar un gráfico por cada temperatura en una nueva ventana
for (temp in temperaturas) {
  # Filtrar datos por la temperatura actual
  datos_temp <- Dati3[Dati3$Temperature == temp, ]
  
  # Abrir una nueva ventana gráfica (para que cada gráfico se muestre en una nueva pestaña)
  dev.new()  # En RStudio o R, esto abre una nueva ventana gráfica
  
  # Crear el gráfico para la temperatura actual
  p <- ggplot(datos_temp, aes(x = Voltmetro, y = Ampmetro)) +
    geom_line() +
    geom_point() +
    labs(title = paste("Current vs Voltage at", temp, "degrees"),
         x = "Voltage (V)",
         y = "Current (mA)") +
    theme_minimal()
  
  # Mostrar el gráfico
  print(p)
}
