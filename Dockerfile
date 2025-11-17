# Use Node.js version 20 on Alpine Linux (small, lightweight image)
FROM node:20-alpine


# Set the Working Directory
WORKDIR /app

# Copy only package files first
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the source code
COPY . .

# Build
RUN npm run build

# Start
CMD ["npm", "run", "start"]
