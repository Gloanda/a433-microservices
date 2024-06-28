# Menggunakan base image Node.js versi 14
FROM node:14-alpine

# Menentukan working directory
WORKDIR /app

# Menyalin source code ke working directory
COPY . .

# Menentukan environment variables
ENV NODE_ENV=production DB_HOST=item-db

# Melakukan instalasi dependencies dan melakukan build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Mengekspos port 8080 pada container
EXPOSE 8080

# Menjalankan perintah npm start saat container dijalankan
CMD ["npm", "start"]
