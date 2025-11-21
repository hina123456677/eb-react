# Stage 1: Build React app
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Serve with nginx
FROM nginx:stable-alpine
RUN rm -rf /usr/share/nginx/html/*

# Copy frontend (client folder) instead of /app/build
COPY --from=build /app/client /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]
