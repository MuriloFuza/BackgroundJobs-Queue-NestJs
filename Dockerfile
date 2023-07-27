FROM node:18

# Defina o diretório de trabalho no container
WORKDIR /app

# Copie o package.json e o package-lock.json para o container
COPY package*.json ./

# Copie o .env
COPY .env ./

# Instale o PNPM
RUN npm install -g pnpm

# Instale as dependencia do projeto
RUN pnpm i

# Copie todo o código-fonte para o container
COPY . .

# Execute o comando para compilar o código TypeScript (substitua 'build' pelo seu comando específico)
RUN pnpm build

# Comando para iniciar o aplicativo quando o container estiver em execução
CMD ["pnpm", "start"]