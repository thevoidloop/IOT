# Usamos una imagen oficial de Node.js
FROM node:lasted

# Establecemos el directorio de trabajo
WORKDIR /usr/src/app

# Copiamos los archivos de configuración del paquete y los instalamos
COPY package*.json ./
RUN npm install

# Copiamos el resto del código de la aplicación
COPY . .

# Exponemos el puerto que usará la aplicación
EXPOSE 3000

# Comando para ejecutar la aplicación
CMD [ "node", "server.js" ]
