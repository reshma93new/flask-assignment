FROM python:3.8-alpine

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY app.py .
EXPOSE 8096
ENTRYPOINT [ "python" ]
CMD ["app.py" ]