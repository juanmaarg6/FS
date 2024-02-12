#!/bin/bash
#Titulo:	ejercicio_practica4_2_JMRG
#Fecha:		24/03/2020
#Autor:		Juan Manuel Rodriguez Gomez
#Version:	1.0
#Descripcion:	Guión que admite dos parámetros, compara por separado si el primer parámetro que 
#		se le pasa es igual al segundo, o es menor, o es mayor, e informa tanto del valor 
#		de cada uno de los parámetros como del resultado de cada una de las evaluaciones 
#		mostrando un 0 o un 1, según corresponda.
#Opciones:	Ninguna
#Uso:		./ejercicio_practica4_2_JMRG.sh [numero1] [numero2]

echo "El primer numero introducido es: " $1;
echo "El segundo numero introducido es: " $2;

echo "¿" $1 "=" $2 "?";
if (( $1==$2 )) ; then
	echo "1"; 
else
	echo "0";
fi;

echo "¿" $1 "<" $2 "?";
if (( $1<$2 )) ; then
	echo "1"; 
else
	echo "0";
fi;

echo "¿" $1 ">" $2 "?";
if (( $1>$2 )) ; then
	echo "1"; 
else
	echo "0";
fi
