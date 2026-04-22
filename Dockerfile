FROM node:20-bullseye

# Set working directory
WORKDIR /usr/src/app

# Enable Corepack and pnpm
RUN corepack enable && corepack prepare pnpm@latest --activate

# Copy package manifests first for better caching
COPY package.json pnpm-workspace.yaml* ./
COPY artifacts/menu-card/package.json ./artifacts/menu-card/package.json

# Copy the rest of the repo
COPY . .

# Install dependencies (workspace-aware)
RUN pnpm install --shamefully-hoist

# Expose Vite default port
EXPOSE 5173

# Start the dev server for the menu-card package (listens on 0.0.0.0)
CMD ["pnpm", "--filter", "@workspace/menu-card", "dev", "--", "--host", "0.0.0.0"]
