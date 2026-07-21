# Guía de Instalación: CUDA Fortran en Arch Linux

La trampa más común al empezar con CUDA Fortran es instalar el paquete
normal de `cuda`. El toolkit tradicional de NVIDIA solo incluye `nvcc`
(el compilador para C/C++), **NO** incluye Fortran.

Para obtener el compilador `nvfortran`, necesitas instalar el **NVIDIA
HPC SDK (Software Development Kit de Computación de Alto Rendimiento)**.
Afortunadamente, Arch Linux lo incluye en su repositorio oficial
**Extra**.

Sigue estos pasos en tu terminal:

## 1. Instalar los controladores de video (Drivers)

Si tu tarjeta es una RTX 2060 Super y no tienes los drivers
propietarios, instálalos primero y reinicia tu PC:

``` bash
sudo pacman -S nvidia nvidia-utils
```

(Puedes verificar que funcionan escribiendo `nvidia-smi` en la terminal.
Debería mostrar tu RTX 2060 Super).

## 2. Instalar el NVIDIA HPC SDK

Dado que Arch Linux ya lo soporta oficialmente, el comando es rápido y
directo. Instalaremos el meta-paquete `nvhpc`, el cual automáticamente
traerá el paquete `nvhpc-compilers` (que contiene `nvfortran`) y las
librerías necesarias.

``` bash
sudo pacman -S nvhpc
```

## 3. Configurar tus Variables de Entorno

El compilador de la versión que descargaste (26.5) se instalará dentro
de `/opt/nvidia/hpc_sdk/`. Sin embargo, tu terminal no sabrá que está
ahí a menos que se lo digas.

Abre tu archivo de configuración de terminal (generalmente `~/.bashrc`
si usas Bash, o `~/.zshrc` si usas Zsh) con tu editor favorito:

``` bash
nano ~/.bashrc
```

Y agrega estas líneas al final del archivo:

``` bash
# Variables para NVIDIA HPC SDK (nvfortran) v26.5
export PATH=/opt/nvidia/hpc_sdk/Linux_x86_64/26.5/compilers/bin:$PATH
export LD_LIBRARY_PATH=/opt/nvidia/hpc_sdk/Linux_x86_64/26.5/compilers/lib:$LD_LIBRARY_PATH
```

## 4. Recargar y Verificar

Guarda el archivo, cierra la terminal y ábrela de nuevo, o recarga la
configuración actual con:

``` bash
source ~/.bashrc
```

Finalmente, comprueba que el compilador esté listo para usarse:

``` bash
nvfortran --version
```

## 5. Ejecucion

Para ejecutar codigo con Fortran sin cuda se debe realizar el comando:

``` bash
gfortran archivo1.f90 archivo2.f90 -o nombre_del_archivo_compilado
```

Si se desea ejecutar codigo de CUDA, se debe utilizar el compilador de este, lo que se realiza de la siguiente forma:

``` bash
nvfortran archivo1.cuf archivo2.cuf -o nombre_del_archivo_compilado
```
Finalmente, para ejecutar el archivo compilado se realiza:

``` bash
./nombre_del_archivo_compilado
```