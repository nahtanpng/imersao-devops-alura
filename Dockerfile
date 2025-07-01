FROM python:3.13.4-alpine3.22

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos de requerimentos primeiro para aproveitar o cache de camadas
COPY requirements.txt .

# Instala as dependências do Python
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação para o diretório de trabalho
COPY . .

# Expôe a porta que a API irá rodar
EXPOSE 8000

# Comando para rodar a aplicação
# O host 0.0.0.0 permite que a aplicação seja acessivel externamento ao contêiner
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"] 
