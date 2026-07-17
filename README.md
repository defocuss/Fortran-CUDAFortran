# Aprendiendo Fortran

Estudiante: David Baez

Repositorio de práctica y aprendizaje en Fortran 90.  
Aquí se reúnen ejercicios básicos de programación, una simulación de difusión térmica y un proyecto de suavizado de datos con apoyo de Python para graficar resultados.

## Contenido del proyecto

### Basicos
Ejercicios introductorios de Fortran:

- variables y entrada de datos
- condicionales
- ciclos
- sumas simples
- tablas
- lectura y escritura de archivos

### Proyecto-difusionTermica
Simulación bidimensional de difusión de calor usando diferencias finitas.

Archivos principales:
- main.f90
- actualizar.f90

Resultados generados:
- p_calor.txt
- mapa_calor.png

### Proyecto-suavizado
Procesamiento de datos ruidosos y filtrado de señales.

Archivos principales:
- main.f90
- filtros.f90
- onda.py

Resultados generados:
- datos_ruidosos.txt
- datos_limpios.txt
- grafico_datos_sucios.png
- grafico_datos_limpios.png

## Requisitos

- Fortran 90
- gfortran
- Python 3
- numpy
- matplotlib

## Ejecución

En VS Code se puede ejecutar con:
```bash
Ctrl + Alt + N
```
siempre que tengas configurado el entorno correctamente. Ademas, si se desea compilar los archivos, actualmente en MacOS se debe realizar:

```bash
gfortran nombre_archivo.f90 nombre_archivo2.f90 -o nombre_programa
```
Y luego se ejecuta con:

```bash
./nombre_programa
```

### Difusión térmica
Compilar y ejecutar los archivos de la carpeta Proyecto-difusionTermica.

El programa:
- inicializa una matriz de temperatura
- aplica iteraciones del método de diferencias finitas
- guarda la matriz final en p_calor.txt
- permite graficar el resultado con Python

### Suavizado de datos
Compilar y ejecutar los archivos de la carpeta Proyecto-suavizado.

El flujo del proyecto:
- genera o utiliza una señal ruidosa
- aplica un filtro para suavizar los datos
- guarda la salida en un archivo de texto
- grafica los resultados con Python

## Objetivo del repositorio

Este repositorio documenta el proceso de aprendizaje de Fortran 90 y muestra ejemplos progresivos de:

- variables y control de flujo
- arreglos y matrices
- procedimientos y módulos
- lectura y escritura de archivos
- integración con Python para análisis y visualización

## Notas

- Algunos archivos en las carpetas de proyecto son resultados generados al ejecutar los programas.
- Si quieres reutilizar los datos en Python, los archivos de texto están pensados para ser leídos fácilmente con numpy.
- Si quieres visualizar la difusión térmica, el archivo p_calor.txt puede convertirse en un mapa de calor con matplotlib.