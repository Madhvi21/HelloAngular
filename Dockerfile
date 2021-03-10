# stage 1
FROM node:12-alpine as node
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app 
RUN npm install
RUN npm run build --prod

#stage 2
FROM nginx:alpine
COPY --from=node /app/docs /usr/share/nginx/html
#COPY --from=node /app/dist /usr/share/ngix/html
