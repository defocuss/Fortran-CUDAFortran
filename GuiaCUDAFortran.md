# Entorno de Desarrollo: Pop!_OS + CUDA Fortran

Esta guía documenta los pasos realizados para aislar un entorno de desarrollo en Linux (Pop!_OS 24.04 LTS) junto a Windows, optimizado para trabajar con una NVIDIA RTX 2060 Super utilizando Python, C/C++, Java y CUDA Fortran.

## 1. Instalación del Sistema Operativo

Para evitar conflictos de arranque con Windows (Dual Boot seguro), se utilizó particionamiento manual en un disco M.2 de la siguiente manera:

- Boot EFI: 1024 MB, Formato fat32, Punto de montaje /boot/efi.
- Root: ~139 GB, Formato ext4, Punto de montaje /.

Nota: Es crucial activar la opción "Format" en ambas particiones durante la instalación personalizada.

## 2. Instalación de Compiladores Base y Python

Para instalar las herramientas estándar de CPU, librerías de construcción y el ecosistema de Python:

```bash
sudo apt update
sudo apt install python3-pip python3-venv python3-dev build-essential gfortran
```

- build-essential: Incluye utilidades de GNU como gcc, g++ y make.
- gfortran: Compilador clásico de Fortran (solo CPU).

## 3. Instalación de NVIDIA HPC SDK (CUDA Fortran)

Para compilar código Fortran acelerado por GPU, se requiere el SDK de NVIDIA (nvfortran), ya que el compilador estándar gfortran no soporta extensiones .cuf.

### Paso 3.1: Agregar repositorios de NVIDIA

```bash
curl https://developer.download.nvidia.com/hpc-sdk/ubuntu/DEB-GPG-KEY-NVIDIA-HPC-SDK | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-hpc-sdk-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/nvidia-hpc-sdk-archive-keyring.gpg] https://developer.download.nvidia.com/hpc-sdk/ubuntu/amd64 /" | sudo tee /etc/apt/sources.list.d/nvhpc.list
```

### Paso 3.2: Instalar el paquete

```bash
sudo apt update
sudo apt install nvhpc
```

### Paso 3.3: Configurar variables de entorno (PATH)

Agregar al final del archivo ~/.bashrc (usando nano ~/.bashrc):

```bash
# Variables para NVIDIA HPC SDK (CUDA Fortran)
export NVARCH=`uname -s`_`uname -m`
export NVCOMPILERS=/opt/nvidia/hpc_sdk
# IMPORTANTE: Cambiar el año (ej. 2026) según la versión instalada de nvhpc
export PATH=$NVCOMPILERS/$NVARCH/2026/compilers/bin:$PATH
```

Aplicar los cambios con:

```bash
source ~/.bashrc
```

Verificar instalación con:

```bash
nvfortran --version
```

## 4. Guía de Ejecución y Compilación

Esta sección resume cómo compilar tus archivos dependiendo de si usarás la CPU o la tarjeta gráfica.

### A. Ejecutar Fortran Clásico (Solo CPU)

Si tienes un archivo con extensión .f90 que no requiere aceleración gráfica:

Compilar:

```bash
gfortran mi_programa.f90 -o app_cpu
```

Ejecutar:

```bash
./app_cpu
```

### B. Ejecutar CUDA Fortran (GPU)

Si tu archivo usa directivas CUDA y arreglos de memoria alojados en la GPU (usualmente con extensión .cuf o .f90 si usas OpenACC):

Compilar:

```bash
nvfortran mi_programa_gpu.cuf -o app_gpu
```

Ejecutar:

```bash
./app_gpu
```

(Opcional: Si el archivo es un .f90 estándar pero quieres aplicar flags de paralelización automática, puedes compilarlo como nvfortran -stdpar mi_programa.f90 -o app_stdpar).