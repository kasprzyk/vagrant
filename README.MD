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
przekierowanie z 5000 na 80 a następnie z 80 na 20080
w przegladarce http://127.0.0.1:20080/

docker run -d -p 80:5000 --env INFOSHARE=TEST python-app:0.0.4
przekazanie env

docker push kasprzyk1/python-app:0.0.4


aplikacja java:
docker build . -t java-app:0.0.1
docker run -d -p 82:8080 java-app:0.0.1

WORKDIR - zmenia kontekst na dany katalog (jak nie ma katalogu to go utworzy)


docker run -it debian:10-slim /bin/bash    (wywołanie interaktywnego terminalu, sprawdzamy co po kolei instalować)
apt update
apt install apache2
apt search php7
apt install locales
cat /etc/group - użytkownicy i uidy
cat /etc/passwd - uidy, foldery domowe usera, jaką powłoke dany user ma domyślną
