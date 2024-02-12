#!/bin/bash
#Titulo:	ejercicio_practica5_JMRG
#Fecha:		31/03/2020
#Autor:		Juan Manuel Rodriguez Gomez
#Version:	1.0
#Descripcion:	Muestra un menú con el siguiente aspecto:
#
#			Seleccione opción:
#
#				1) Sumar números
#
#				2) Restar números
#
#				3) Multiplicar números
#
#				4) Salir
#
#			Elija la opción deseada:
#
#		(a) La opción 1, debe solicitar por teclado dos números y deberá mostrar los números, así como la suma de ambos.
#
#		(b) La opción 2, debe solicitar por teclado dos números y deberá mostrar los números, así como la diferencia entre ambos.
#
#		(c) La opción 3, debe solicitar por teclado dos números y deberá mostrar los números, así como el producto de ambos.
#
#		(d) La opción 4, debe permitir salir del script y volver al indicador del Shell. Mientras no se pulse este valor, siempre se
#	            mostrará el menú.
#Opciones:	Ninguna
#Uso:		./ejercicio_practica5_JMRG.sh

while : ;
do
	printf "\n Seleccione opción: \n"
	printf "\t 1) Sumar números \n"
	printf "\t 2) Restar números \n"
	printf "\t 3) Multiplicar números \n"
	printf "\t 4) Salir \n"
	printf "\n Elija la opción deseada: "
	read opcion
	case $opcion in
		1 ) printf "\t Introduzca el primer numero: "
		   read numero1
		   printf "\t Introduzca el segundo numero: "
	           read numero2
		   echo -e "\n\t El primer numero introducido es: $numero1"
		   echo -e "\t El segundo numero introducido es: $numero2"
		   let suma=$numero1+$numero2 
		   echo -e "\n\t La suma de ambos numeros es: $suma" ;;

		2 ) printf "\t Introduzca el primer numero: "
		   read numero1
		   printf "\t Introduzca el segundo numero: "
	           read numero2
		   echo -e "\n\t El primer numero introducido es: $numero1"
		   echo -e "\t El segundo numero introducido es: $numero2"
		   let resta=$numero1-$numero2 
		   echo -e "\n\t La resta de ambos numeros es: $resta" ;;

		3 ) printf "\t Introduzca el primer numero: "
		   read numero1
		   printf "\t Introduzca el segundo numero: "
	           read numero2
		   echo -e "\n\t El primer numero introducido es: $numero1"
		   echo -e "\t El segundo numero introducido es: $numero2"
		   let producto=$numero1*$numero2 
		   echo -e "\n\t La suma de ambos numeros es: $producto" ;;

		4 ) break ;;
	esac
done
