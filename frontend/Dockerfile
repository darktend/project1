# Використовуйте базовий образ для фронтенду
FROM node:16 AS build

# Встановлення робочої директорії
WORKDIR /app

# Копіювання package.json та package-lock.json
COPY package*.json ./

# Встановлення залежностей
RUN npm install

# Копіювання всіх файлів
COPY . .

# Побудова фронтенду
RUN npm run build

# Використання базового образу для сервера статичних файлів
FROM nginx:alpine

# Копіювання побудованих файлів у Nginx
COPY --from=build /app/build /usr/share/nginx/html

# Відкриття порту
EXPOSE 80

# Налаштування Nginx
CMD ["nginx", "-g", "daemon off;"]
