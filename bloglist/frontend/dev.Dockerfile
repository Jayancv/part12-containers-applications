FROM node:20

# ARG VITE_BACKEND_URL
# ENV VITE_BACKEND_URL=$VITE_BACKEND_URL

WORKDIR /usr/src/app

COPY package*.json ./

# Clean and install dependencies
RUN rm -rf node_modules package-lock.json && npm install

# Now copy the full source code
COPY . .

# npm run dev is the command to start the application in development mode
CMD ["npm", "run", "dev", "--", "--host"]