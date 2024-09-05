# Usa una imagen base de Ubuntu
FROM ubuntu:20.04

# Instala las dependencias necesarias
RUN apt-get update && apt-get install -y \
    build-essential \
    clang \
    libobjc-7-dev \
    gnustep-devel \
    gnustep-make

# Establece el directorio de trabajo
WORKDIR /usr/src/app

# Copia el código fuente al contenedor
COPY . .

# Compila el código Objective-C
RUN make

# Define el comando por defecto para ejecutar el contenedor
CMD ["./your_executable"]