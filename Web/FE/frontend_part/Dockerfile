# FROM node:18.16.1
# 이미지 내부 작업공간 설정
# WORKDIR /app
# COPY ./Web/FE/frontend_part/package.json .
# RUN npm install
# COPY ./Web/FE/frontend_part .
# RUN npm run build
# CMD ["npm", "run", "build"]

FROM node:18.16.1 as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install -g npm@9.5.1
RUN npm install
COPY ./ .
RUN npm run build

FROM nginx:1.25.1-alpine
RUN mkdir /app
COPY --from=build-stage /app/dist /app

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]