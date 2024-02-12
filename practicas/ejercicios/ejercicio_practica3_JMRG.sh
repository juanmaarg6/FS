#!/bin/bash
#Titulo:	ejercicio_practica3_JMRG
#Fecha:		03/03/2020
#Autor:		Juan Manuel Rodriguez Gomez
#Version:	1.0
#Descripcion:	Muestra los archivos de un directorio
#		que han sido accedidos en los ultimos x dias.
#Opciones:	Ninguna
#Uso:		./ejercicio_practica3_JMRG.sh [nombre_directorio] [numero_dias]

printf "Los archivos del directorio $1 que han sido accedidos en los ultimos $2 dias son:\n"

find $1 -atime -$2

