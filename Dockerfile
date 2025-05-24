FROM python:alpine

RUN pip install flask

COPY ./static /home/myapp/static/

COPY ./templates /home/myapp/templates/

COPY ./src/sample-app.py /home/myapp/

EXPOSE 5050

CMD [ "python3", "/home/myapp/sample-app.py"]
