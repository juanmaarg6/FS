#!/bin/bash
#Titulo:	ejercicio_practica4_JMRG
#Fecha:		10/03/2020
#Autor:		Juan Manuel Rodriguez Gomez
#Version:	1.0
#Descripcion:	Si alguno de los dos argumentos no es un número finaliza y muestra un mensaje al #		usuario del error "el argumento .... no es un numero". A continuación, compara #		ambos argumentos. Si son iguales, crea una variable con los nombres de los #		archivos del directorio actual del usuario y si son distintos crea una variable #		con los nombres de los archivos del directorio home del usuario. Finalmente #		imprime en pantalla el contenido de dicha variable y el nombre de ruta del #		directorio (actual o home, según sea el caso).
#Opciones:	Ninguna
#Uso:		./ejercicio_practica4_JMRG.sh [numero1] [numero2]

es_numero='^-?[0-9]+([.][0-9]+)?$'
if ! [[ $1 =~ $es_numero ]] ; then
	echo -e "\nEl argumento $1 no es un numero" ;
elif ! [[ $2 =~ $es_numero ]] ; then
	echo -e "\nEl argumento $2 no es un numero" ;
else
	if [ $1 == $2 ] ; then
		mostrar_archivos=`ls .` ; echo -e "\n"$mostrar_archivos"\n" ; pwd ;
	else
		mostrar_archivos=`ls $HOME` ; echo -e "\n"$mostrar_archivos"\n" ; cd $HOME ; pwd ;
	fi 
fi
	
