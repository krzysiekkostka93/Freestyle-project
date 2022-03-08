#

docker build . -t python-app:0.0.2

docker run -d -p 80:5000 --env INFOSHARE=NASZA_ZMIENNA python-app:0.0.2

docker stop {CONTAINER ID}

docker tag python-app:0.0.2 llluuu/infoshare-app.py:0.0.2

docker push llluuu/infoshare-app.py:0.0.2

docker run -d -p 80:5000 --env INFOSHARE=NASZA_ZMIENNA llluuu/infoshare-app.py:0.0.2
