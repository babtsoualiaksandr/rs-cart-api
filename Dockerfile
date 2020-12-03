FROM node:12

# создание директории приложения
WORKDIR /app

# установка зависимостей
# символ астериск ("*") используется для того чтобы по возможности 
# скопировать оба файла: package.json и package-lock.json
COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build
# Если вы создаете сборку для продакшн
# RUN npm ci --only=production

# копируем исходный код
USER node
ENV PORT=4000

EXPOSE 4000
CMD [ "node", "dist/main.js" ]
