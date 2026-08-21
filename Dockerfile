FROM node:20-bookworm-slim

WORKDIR /app

ENV NODE_ENV=production

# Copy only package files first (for better layer caching)
COPY package.json package-lock.json ./

# Install dependencies
RUN npm ci --omit=dev

# Copy application code
COPY . .

EXPOSE 3000

CMD ["npm", "start"]