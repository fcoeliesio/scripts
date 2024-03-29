#!/bin/bash

# Diretório de origem do backup
origem="$HOME/Downloads"

# Diretório de destino do backup
destino="$HOME/Backup"

# Criação da pasta de destino caso ela não exista
mkdir -p "$destino"

# Configurando o nome, junto ao caminho, do arquivo de backup:
# /home/user/ano-mês-dia-hora-minutos_backup.zip
backup="$destino/$(date +%Y-%m-%d-%H.%M_backup.zip)"

# Compactando os arquivos da pasta download já os encaminhando para
# o diretório de backup
zip -r "$backup" "$origem"

# Deletando os backups mais antigos e deixando apenas o recente
cd "$destino"
while [ $(ls "$destino" | wc -l) -ne 1 ]; do
	for i in *; do
		[ "$backup" -nt "$i" ] && rm "$i"
	done
done
