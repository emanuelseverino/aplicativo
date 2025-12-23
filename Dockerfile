# Usando imagem oficial do Python
FROM python:3.12-slim

# Evita prompts de interação durante a instalação
ENV DEBIAN_FRONTEND=noninteractive

# Atualiza pip e instala dependências do sistema
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        libpq-dev \
        gcc \
        curl \
        && pip install --upgrade pip \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

# Define o diretório de trabalho no container
WORKDIR /app

# Copia o requirements.txt e instala dependências do Python
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copia todo o projeto Django para dentro do container
COPY . .

# Expõe a porta padrão do Django
EXPOSE 8000

# Comando padrão para rodar o servidor de desenvolvimento
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
