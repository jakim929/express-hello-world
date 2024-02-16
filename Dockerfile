FROM node:18-alpine AS base

ENV PNPM_HOME="/pnpm"

ENV PATH="$PNPM_HOME:$PATH"

RUN corepack enable


# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json files
COPY . .

# Install the dependencies in the package.json
RUN pnpm install

# Your app binds to port 3000, so use the EXPOSE instruction to have it mapped by the docker daemon
EXPOSE 3000

# Define the command to run the app using CMD which defines your runtime
CMD ["node", "index.js"]
