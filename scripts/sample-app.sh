#!/bin/bash

# mkdir tempdir
# mkdir tempdir/templates
# mkdir tempdir/static

# cp sample-app.py tempdir/.
# cp -r templates/* tempdir/templates/.
# cp -r static/* tempdir/static/.

# echo "FROM python" >> tempdir/Dockerfile
# echo "RUN pip install flask" >> tempdir/Dockerfile
# echo "COPY ./static /home/myapp/static/" >> tempdir/Dockerfile
# echo "COPY ./templates /home/myapp/templates/" >> tempdir/Dockerfile
# echo "COPY sample_app.py /home/myapp/" >> tempdir/Dockerfile
# echo "EXPOSE 5050" >> tempdir/Dockerfile
# echo "CMD python3 /home/myapp/sample_app.py" >> tempdir/Dockerfile

# cd tempdir || exit 2

docker build -t sample-app .
docker run -t -d -p 5050:5050 --name sample-app-running sample-app
docker ps -a