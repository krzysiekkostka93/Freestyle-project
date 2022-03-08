FROM python:3.10-slim

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

WORKDIR /app
COPY app.py app.py

CMD [ "python3", "-m", "flask", "run", "--host=0.0.0.0" ] 

#EXPOSE 5000
