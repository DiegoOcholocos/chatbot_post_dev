# Utiliza la imagen de Heroku con Node.js
FROM heroku/nodejs

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia el archivo package.json y package-lock.json (si existe)
COPY package*.json ./

# Instala las dependencias
RUN npm ci --only=production

# Copia el resto de la aplicación
COPY . .

# Expone el puerto que utilizará la aplicación (por defecto Heroku utiliza el puerto 3000)
# Si necesitas un puerto específico, asegúrate de configurar la variable de entorno PORT
EXPOSE $PORT

# Comando para ejecutar la aplicación
CMD ["npm", "start"]