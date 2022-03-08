#
# Zadanie - zbudować kontener z aplikacją
#
# Projekt: LMS https://www.lms.org.pl
# Github: https://github.com/chilek/lms/
#
# Obraz bazowy: debian:10-slim
# Bazujemy na wydaniu latest (pobieramy według numerka wydania)

# DB: vaza danych - użyjemy zewętrzego kontenera mysql (łączymy się do mysql:5.7)
# env: SQL_TYPE, MYSQL_HOST, MYSQL_USER,MYSQL_PASS, MYSQL_DATABASE

# HOMEWORK:
# 1. Optymalizacja wielkości obrazu.
# 2. zdefiniować docker volumes - przechowywanie danych poza kontenerem
# 3. Backup&recovery - mysql dump, vol backup




