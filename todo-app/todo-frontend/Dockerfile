FROM node:20 AS test-stage 

ENV VITE_BACKEND_URL=http://localhost:3000/

WORKDIR /usr/src/app
COPY . .
RUN npm ci
RUN npm run test

FROM test-stage AS build-stage
WORKDIR /usr/src/app
ENV NODE_ENV production
RUN npm run build

FROM nginx:1.25-alpine
COPY --from=build-stage /usr/src/app/dist /usr/share/nginx/html