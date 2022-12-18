FROM node:14

# Create app directory
WORKDIR /app

# Install app dependencies
COPY package.json .
RUN npm install

# Bundle app source
COPY . .

# Build the app
RUN npm run build

# Specify command to run the app
CMD ["npm", "run", "serve"]