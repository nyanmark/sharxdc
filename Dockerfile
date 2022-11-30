FROM python:3.10.7-alpine

WORKDIR /app

COPY ./requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

COPY ./main.py /app
COPY ./wsgi.py /app

EXPOSE 8081

CMD ["gunicorn", "--bind", ":8081", "--workers", "3", "wsgi:app"]