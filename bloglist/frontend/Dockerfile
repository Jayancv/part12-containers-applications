FROM node:20 AS test-stage 

# ARG VITE_BACKEND_URL
# ENV VITE_BACKEND_URL=$VITE_BACKEND_URL

WORKDIR /usr/src/app

COPY package*.json ./

# Clean and install dependencies
RUN rm -rf node_modules
RUN npm ci
COPY . .
RUN npm run test

FROM test-stage AS build-stage
WORKDIR /usr/src/app
ENV NODE_ENV production
RUN npm run build

FROM nginx:1.25-alpine
COPY --from=build-stage /usr/src/app/dist /usr/share/nginx/html