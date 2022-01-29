# Ansible running in Vagrant

W tym katalogu:

```shell
vagrant up  # przygotowanie środowiska
vagrant ssh runner  # połączenie do maszyny z której uruchamiamy ansible
```

Na maszynie `runner` (z ansible)
```shell
cd /vagrant  # w tym katalogu dostępne są pliki z hosta
```

# Troubleshooting

Jeśli uruchamiając `vagrant up` dostajesz błąd o niepoprawnej adresacji w sieci, zwróć uwagę na podany w nim blok adresów.
Zmień adresy IP maszyn w `Vagrantfile` na zawarte w tym bloku.
Analogicznie zmień adresy IP w plikach `hosts` i `hosts.yaml`.

# Tematy dodatkowe

- Ansible Vault
- Dynamic Inventories

# Więcej o Ansible

- dokumentacja
- Jeff Geerling (yt, github, ansible galaxy)
  - https://www.youtube.com/c/JeffGeerling/search?query=ansible