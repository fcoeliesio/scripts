#!/bin/bash

####################################################
#Nome		: Organizador de Arquivos em Downloads
#Autor		: Francisco Eliésio (fcoeliesio@gmail.com)
#Data		: 2024-01-14
###################################################

# Direcionamento à pasta home do usuário caso o script não esteja nela
cd

# Pasta e diretório de destino
destino=Downloads
diretorio="$(pwd)/$destino"

# Criação da pasta caso não exista e de suas subpastas
mkdir -p "$destino"
for i in Documentos Imagens Músicas Vídeos Outros; do
    mkdir -p "$destino/$i"
done

# Laço de repetição para os arquivos dentro da pasta destino
for arquivo in "$destino"/*; do
    if [ ! -d "$arquivo" ]; then	# Verifica se não é um diretório
        case ${arquivo##*.} in		# Pega a extensão do arquivo
            docx | doc | xls | xlsx | ppt | pptx | pdf | txt | odt | ods | odf)
                mv "$arquivo" "$diretorio/Documentos";;
            jpeg | png | gif | bitmap | bmp | tiff | raw | exif | ppm | pgm | svg | webp)
		mv "$arquivo" "$diretorio/Imagens";;
            mp3 | aac)
		mv "$arquivo" "$diretorio/Músicas";;
            mkv | mp4 | avi | wmv | flv | mpeg-2 | mpeg | rmvb)
		mv "$arquivo" "$diretorio/Vídeos";;
            desktop | sh | lnk) : ;;	# Ignorar arquivos sh e atalhos
            *)
		mv "$arquivo" "$diretorio/Outros" ;;
        esac
    fi
done
