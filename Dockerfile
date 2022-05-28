FROM node:16-alpine AS builder
WORKDIR "/app"
COPY . .
RUN chmod -R 777 /root
RUN npm ci
RUN npx hardhat compile
FROM node:16-alpine AS production
WORKDIR "/app"
COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/package-lock.json ./package-lock.json
COPY --from=builder /app/node_modules ./node_modules
ENTRYPOINT ["/bin/sh"]