FROM node:13.10.1-alpine3.11 AS builder

WORKDIR /usr/src/app

COPY package*.json yarn.lock ./

RUN yarn

COPY . .

RUN yarn build


FROM nginx

EXPOSE 80

COPY --from=builder /usr/src/app/build /usr/share/nginx/html
