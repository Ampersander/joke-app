<<<<<<< HEAD
FROM node:16 AS builder
WORKDIR "/app"
COPY . .
RUN npm install -g pnpm
RUN npm i
RUN npm run build
RUN npm prune --production
FROM node:16-alpine AS production
WORKDIR "/app"
COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/views ./views
COPY --from=builder /app/node_modules ./node_modules
=======
FROM node:16 AS builder
WORKDIR "/app"
COPY . .
RUN npm i
RUN npm run build
RUN npm prune --production
FROM node:16-alpine AS production
WORKDIR "/app"
COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/views ./views
COPY --from=builder /app/node_modules ./node_modules
>>>>>>> a5868b2a54ec50095aa6c873a92b7cc5069d039d
CMD [ "sh", "-c", "npm run start:prod"]