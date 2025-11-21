# Stage 1: Build frontend
FROM node:20-alpine AS build
WORKDIR /app
COPY client/package*.json ./   
RUN npm install
COPY client ./                
RUN npm run build             

# Stage 2: Serve with nginx
FROM nginx:stable-alpine
RUN rm -rf /usr/share/nginx/html/*
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
