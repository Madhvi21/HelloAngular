# stage 1
#FROM node:12-alpine as node
#RUN mkdir -p /app
#WORKDIR /app
#COPY package.json /app 
#RUN npm install
#COPY . /app
#RUN npm run build --prod

#stage 2
#FROM nginx:alpine
#COPY --from=node /app/docs /usr/share/nginx/html
#COPY --from=node /app/dist /usr/share/ngix/html


#FROM node:10-alpine as build-step
#RUN mkdir -p /app
#WORKDIR /app
#COPY package.json /app
#RUN npm install
#COPY . /app
#RUN npm run build --prod

#FROM nginx:1.17.1-alpine
#COPY --from=build-step /app/docs /usr/share/nginx/html

FROM nginx:alpine
COPY ./dist/HelloAngular
  /usr/share/nginx/html
EXPOSE 80 443
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]

