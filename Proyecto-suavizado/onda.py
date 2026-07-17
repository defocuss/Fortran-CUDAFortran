import math
import random
import numpy as np
import matplotlib.pyplot as plt

def generar_datos_ruidosos(nombre_archivo="datos_ruidosos.txt", puntos=1000):
    """
    Genera una onda senoidal continua y le agrega ruido aleatorio.
    Los datos se guardan en un archivo de texto en una sola columna.
    """
    print(f"Generando {puntos} puntos de datos...")
    
    with open(nombre_archivo, "w") as f:
        for i in range(puntos):
            # 1. Crear un avance para el eje X (tiempo o ángulo)
            # Multiplicamos por 0.1 para que la onda sea suave y visible.
            t = i * 0.1 
            
            # 2. Generar la señal pura usando la función seno
            # math.sin(t) genera valores entre -1.0 y 1.0
            senal_pura = math.sin(t)
            
            # 3. Generar ruido aleatorio
            # random.uniform(-A, A) genera un valor decimal aleatorio en ese rango.
            # Puedes cambiar el 0.4 para hacer el ruido más o menos agresivo.
            ruido = random.uniform(-0.4, 0.4)
            
            # 4. Construir la señal final (Señal Original + Ruido)
            senal_ruidosa = senal_pura + ruido
            
            # Escribimos el valor con 4 decimales seguido de un salto de línea
            f.write(f"{senal_ruidosa:.4f}\n")
            
    print(f"¡Listo! Los datos han sido guardados en el archivo '{nombre_archivo}'.")

def graficar_datos(nombre_archivo="datos_ruidosos.txt"):
    """
    Lee los datos de un archivo de texto y los grafica.
    """
    # Cargamos los datos desde el archivo
    datos = np.loadtxt(nombre_archivo)
    
    # Creamos un vector de tiempo para el eje X
    tiempo = np.arange(len(datos)) * 0.1  # Asumiendo que cada punto representa 0.1 unidades de tiempo
    
    # Graficamos la señal ruidosa
    plt.figure(figsize=(10, 5))
    plt.plot(tiempo, datos, label="Señal Ruidosa", color='blue')
    plt.title("Onda Senoidal con Ruido Aleatorio")
    plt.xlabel("Tiempo")
    plt.ylabel("Amplitud")
    plt.grid(True)
    plt.legend()
    
    # Guardar la imagen
    plt.savefig("grafico_datos_sucios.png", dpi=300, bbox_inches="tight")
    plt.close()

if __name__ == "__main__":
    # Ejecutamos la función al correr el archivo
    #generar_datos_ruidosos()
    graficar_datos()