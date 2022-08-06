FROM python:3

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
        libatlas-base-dev gfortran nginx supervisor

RUN useradd --no-create-home nginx

RUN rm /etc/nginx/sites-enabled/default



COPY server-conf/nginx.conf /etc/nginx/nginx.conf
COPY server-conf/flask-site-nginx.conf /etc/nginx/conf.d/
COPY server-conf/supervisord.conf /etc/supervisor/

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

WORKDIR /app
COPY requirements.txt .
COPY server-conf/uwsgi.ini .
COPY server.py .
COPY wsgi.py  . 
RUN pip install -r requirements.txt
CMD ["/usr/bin/supervisord"]