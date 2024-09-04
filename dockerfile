# Dockerfile para backend-merchandise

# Usa una imagen oficial de Node.js como imagen base
FROM node

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Copia el package.json y package-lock.json al directorio de trabajo
COPY merchandise/package*.json ./

# Instala las dependencias
RUN npm install -g pm2

# Copia el resto de la aplicación al directorio de trabajo
COPY merchandise/ ./

# Expone el puerto en el que la aplicación estará corriendo
EXPOSE 3003

# Usa PM2 para ejecutar la aplicación
CMD ["pm2-runtime", "start", "server.js", "--name", "backend-merchandise"]

