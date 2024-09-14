# Використовуємо офіційний образ Python як базовий
FROM python:3.9-slim

# Встановлюємо системні залежності (для роботи з PostgreSQL)
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Встановлюємо pip та psycopg2-binary окремо, якщо це необхідно
RUN pip install --upgrade pip && pip install psycopg2-binary==2.9.6

# Встановлюємо робочу директорію
WORKDIR /app

# Копіюємо файл requirements.txt у контейнер
COPY requirements.txt /app/

# Встановлюємо залежності з requirements.txt (повторне встановлення psycopg2-binary, якщо вже вказаний у файлі)
RUN pip install --no-cache-dir -r /app/requirements.txt

# Копіюємо решту коду додатка у контейнер
COPY ./backend_rds /app/

# Відкриваємо порт (типово для Django - 8000)
EXPOSE 8000

# Запускаємо Django додаток
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
