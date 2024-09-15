# Використовуємо офіційний Python образ як базовий
FROM python:3.9-slim

# Встановлюємо системні залежності
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Оновлюємо pip та встановлюємо psycopg2-binary
RUN pip install --upgrade pip && pip install psycopg2-binary

# Встановлюємо робочу директорію
WORKDIR /app

# Копіюємо файл requirements.txt у контейнер
COPY requirements.txt /app/

# Встановлюємо залежності з requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

#копіюємо env файл
COPY .env /app/

# Копіюємо решту коду додатка у контейнер
COPY . /app/

# Відкриваємо порт (8000 для Django)
EXPOSE 8000

# Встановлюємо gunicorn для продакшн
RUN pip install gunicorn

# Запускаємо gunicorn та збираємо статичні файли при запуску контейнера
CMD ["sh", "-c", "python manage.py collectstatic --noinput && gunicorn --bind 0.0.0.0:8000 core.wsgi:application"]
