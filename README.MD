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

task8
netstat -a   - otwarte porty
iptraf-ng

AUTO_START_SWARM=true vagrant up (wrzucamy bezpośrednio do terminala, możemy dać tylko vagrant up ale nie utworzy się klaster)

docker node ls - Lists all the nodes that the Docker Swarm manager knows about. 

portainer docker swarm https://docs.portainer.io/v/ce-2.11/start/install/server/swarm/linux
wejście na managera (vagrant ssh manager) przejście do folderu cd /vagrant i uruchomienie 
docker stack deploy -c portainer-agent-stack.yml portainer

https://127.0.0.1:19443/ adres portainera, pamiętać żeby nei dawac bezpośrednio 127.0.0.1:19443 tylko przez https!

ps aux

docker node ps - wyświetla listę,errory,statusy

docker stack deploy -c docker-compose.yml app (będąc wewnarz app1)

zmienić w opcjach vm mapowanie z 10080 na 20080 (nie dodawać kolejnego tylko edytować istniejący), wejść http://127.0.0.1:20080/ wyświetli popraniwe

docker stack rm app -> ubicie 

docker service scale app_app=3 -> skalowanie aplikacji


task9 
ansible -m ping -i hosts all
-m - użyj modułu

ansible -m ping -i hosts web_servers - ping do grupy

ansible-playbook -i hosts.yaml 01-playbook.yaml

ansible-playbook -i hosts.yaml 03-cwiczenie.yaml

ansible-playbook -i hosts.yaml 04-loop-example.yaml 

inventory_hostname - zmienna z ansible


23-task
vagrant up
ansible-galaxy install -r requirements.txt
ansible-galaxy install --roles-path ./roles/ -r requirements.yaml -> instaluje role z pliku
ansible-playbook -i hosts.yaml 1-task.yaml


task11
vagrant ssh
aws sts get-caller-identity
terraform init
terraform apply
aws ec2 help
aws ec2 describe-images


task12
kubectl get po -o wide
kubectl get hpa
kubectl scale deploy myapp-deployment --replicas=1
kubectl get deploy
kubectl get po --all-namespaces
kubectl get rs - current replicasets
kubectl delete rs  <name>


https://labs.play-with-k8s.com/

kubectl apply -f new.yaml
kubectl get deploy
kubectl get pods


task15
jenkins.io/doc/book/installing/linux/#debianubuntu