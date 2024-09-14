# Використовуємо офіційний Python образ як базовий
FROM python:3.9-slim

# Встановлюємо системні залежності
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Встановлюємо psycopg2-binary окремо
RUN pip install --upgrade pip && pip install 

# Встановлюємо робочу директорію
WORKDIR /app

# Копіюємо файл requirements.txt у контейнер
COPY requirements.txt /app/

# Встановлюємо залежності з requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# Копіюємо решту коду додатка у контейнер
COPY ./backend_redis /app/

# Відкриваємо порт (типово для Django - 8000)
EXPOSE 7000

# Запускаємо Django додаток
CMD ["python", "manage.py", "runserver", "0.0.0.0:7000"]
