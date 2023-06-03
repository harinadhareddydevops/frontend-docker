FROM node:alpine as build_stage
WORKDIR /app
copy package.json .
RUN npm install
copy . .
RUN npm run build

FROM nginx
COPY -from=build_stage /app/build /usr/share/nginx/html
