FROM node:20-bookworm-slim

WORKDIR /app

ENV NODE_ENV=production

# Install runtime dependencies inside the image. This avoids Railway/Nixpacks
# skipping the install layer, which caused express and dotenv to be absent.
COPY package.json package-lock.json ./
RUN npm install --omit=dev --no-audit --no-fund

COPY . .

EXPOSE 3000
CMD ["npm", "start"]