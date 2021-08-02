FROM node:alpine AS builder
WORKDIR '/app'

COPY  package.json .

RUN yarn install

COPY . .

RUN yarn run build


FROM nginx:1.15
COPY --from=builder /app/build/ /usr/share/nginx/html