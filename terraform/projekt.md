# Projekt Terraform

Korzystając z konfiguracji Vagranta używanej podczas warsztatów przygotuj konfigurację Terraforma.

- struktura plików powinna być zgodnie z praktykami
- przypiąć wersję terraforma i providera w pliku głównym

Utwórz:
- parę kluczy z Twojego klucza SSH (wygenerowany w Vagrancie podczas provisioningu)
- moduł do tworzenia instancji EC2; zmienną z tagami (co najmniej Name), które będziesz używał we wszystkich resourcach
- korzystając z utworzonego modułu maszynę EC2 (instancję) w domyślnym VPC, do której będziesz mógł się połączyć po SSH
- Dodaj Security Groupę, które pozwala na połączenie SSH do Twojej instancji z internetu
- VPC, z 2 podsieciami prywatnymi i 2 publicznymi
  - [opcjonalnie] na początek można użyć modułu z Terraform Registry
  - [**] utworzyć własny moduł tworzący wszystkie podstawowe resource'y dla VPC (VPC, 2 lub 4 subnety, tablice routingu, internet gateway) i wywołać w kodzie głównym; podsieci powinny być stworzone bez powielania kodu
- przenieś maszynę EC2 z domyślnego VPC do publicznej podsieci Twojego VPC
- [opcjonalnie] Ulepszenia? Formatowanie kodu, praktyki, pomysły?
- Usuń utworzone zasoby

