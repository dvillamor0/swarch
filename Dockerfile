FROM python:3.11-slim 
 
# Instalamos dependencias necesarias para compilar mysqlclient 
RUN apt-get update && apt-get install -y \ 
    gcc \ 
    default-libmysqlclient-dev \ 
    build-essential \ 
    pkg-config \ 
    && apt-get clean \ 
    && rm -rf /var/lib/apt/lists/* 
 
WORKDIR /app 
COPY . . 

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt 
EXPOSE 5000 
CMD ["python", "app.py"]