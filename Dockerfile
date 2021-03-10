# stage 1
FROM node:latest as node
WORKDIR /app
COPY package.json /app 
RUN npm install
RUN npm run build --prod

#stage 2
FROM nginx:alpine
COPY --from=node /app/docs /usr/share/nginx/html
#COPY --from=node /app/dist /usr/share/ngix/html
