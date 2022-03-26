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

# Odpowiedzi na pytania z zajęć

## Jak wykluczyć hosty z wykonania polecenia / playbooka?

https://docs.ansible.com/ansible/latest/user_guide/intro_patterns.html#patterns-and-ad-hoc-commands

`ansible -m [module] -a "[module options]" --limit 'all:!host1'`

Wykona się na wszystkich hostach (`all`), poza `host1` (`!host1`)

## `command` i `shell`, zawsze są `changed`

Tak, domyślnie zawsze zwrócą `changed`.
Żeby uzyskać inny wynik, możemy do taska dodać `changed_when`.

https://docs.ansible.com/ansible/latest/user_guide/playbooks_error_handling.html#defining-changed

## Variable precedence

https://docs.ansible.com/ansible/latest/reference_appendices/general_precedence.html

https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#ansible-variable-precedence

## `shell` vs `command`

https://blog.confirm.ch/ansible-modules-shell-vs-command/

`command` nie przechodzi przez powłokę użytkownika, nie ma dostępnych zmiennych środowiskowych, nie można używać `> < |`

`shell` uruchamia powłokę użytkownika (domyślnie `/bin/sh`) i w niej wykonuje komendy

command jest bardziej ograniczone, przez co bezpieczniejsze w użyciu
