# --- Fase de Build ---
    FROM node:20-alpine as builder

    ENV NODE_ENV build
    
    USER node
    WORKDIR /home/node/backend
    
    # Copia apenas os arquivos essenciais primeiro
    COPY backend/package*.json ./
    RUN npm ci
    
    # Limpa o cache do npm
    RUN npm cache clean --force
    
    # Agora copia o restante dos arquivos do backend
    COPY --chown=node:node backend/ ./
    
    # Gera os arquivos do Prisma e faz o build
    RUN npx prisma generate \
        && npm run build \
        && npm prune --omit=dev
    
    # --- Fase de Produção ---
    FROM node:20-alpine
    
    ENV NODE_ENV production
    
    USER node
    WORKDIR /home/node/backend
    
    # Copia os arquivos necessários do builder
    COPY --from=builder --chown=node:node /home/node/backend/package*.json ./
    COPY --from=builder --chown=node:node /home/node/backend/node_modules/ ./node_modules/
    COPY --from=builder --chown=node:node /home/node/backend/dist/ ./dist/
    
    CMD ["node", "dist/src/main.js"]