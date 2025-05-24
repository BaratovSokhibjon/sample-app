#!/bin/bash

# mkdir tempdir
# mkdir tempdir/templates
# mkdir tempdir/static

# cp sample-app.py tempdir/.
# cp -r templates/* tempdir/templates/.
# cp -r static/* tempdir/static/.

# cd tempdir || exit 2

docker build -t sample-app .
docker run -t -d -p 5050:5050 --name sample-app-running sample-app
docker ps -a