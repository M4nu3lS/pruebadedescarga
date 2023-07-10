#!/bin/bash

wget -qO archivo.txt  https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv

generar_nombres(){
        archivo=$1
        nombre=$(shuf -n 1 "$archivo"|cut -d "," -f 1|tr " " "_")
        for imagenes in $nombre;do
                echo "$imagenes"
        done

}

generar_imagenes(){
        read -p "Ingrese la cantidad de imágenes que desea generar: " cantidad
        for (( i=1; i<=cantidad; i++));do
                nombre=$(generar_nombres "archivo.txt")
                wget -qO "$nombre.jpg" https://thispersondoesnotexist.com/
                sha256sum "$nombre.jpg"| cut -d " " -f 1 > "$nombre.txt"
                sleep 1
        echo "Se generó correctamente la imagen"
        done
}

generar_imagenes

