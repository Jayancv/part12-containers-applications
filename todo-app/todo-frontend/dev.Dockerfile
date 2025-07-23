FROM node:20

# ENV VITE_BACKEND_URL=http://localhost:8080/api/
ARG VITE_BACKEND_URL
ENV VITE_BACKEND_URL=$VITE_BACKEND_URL

WORKDIR /usr/src/app

COPY . .
# RUN rm -rf node_modules package-lock.json

# Change npm ci to npm install since we are going to be in development mode
RUN npm install

# npm run dev is the command to start the application in development mode
CMD ["npm", "run", "dev", "--", "--host"]