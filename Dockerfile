FROM python:stretch

ADD ./requirements.txt /tmp/requirements.txt

RUN pip3 install -r /tmp/requirements.txt
RUN pip3 install gunicorn

ADD . /opt/api/
WORKDIR /opt/api

ENTRYPOINT ["gunicorn", "-b", ":8080", "main:APP"]