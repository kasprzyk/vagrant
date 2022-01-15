Docker ps -a – wyświetli ostatnie operacje
docker logs … id containera

docker run ubuntu:18.04 echo "hello from kontener"
touch Dockerfile
docker ps lista obrazów uruchominych
docker run -it --name lab1 ubuntu:18.04 /bin/bash
docker stop container id z listy wyżej
docker build . Buduje obraz na podstawie dockerfile
docker images lista obrazów

docker build . -t ubuntu-test:dev

docker build . -f Dockerfile-app apache


python3 -m flask run
instalacja pip3 I flask


docker build . -t python-app:0.0.1
docker run -d python-app:0.0.1

docker run -d -p 80:5000 python-app:0.0.3
w przegladarce http://127.0.0.1:20080/

docker run -d -p 80:5000 --env INFOSHARE=TEST python-app:0.0.4
przekazanie env

docker push kasprzyk1/python-app:0.0.4