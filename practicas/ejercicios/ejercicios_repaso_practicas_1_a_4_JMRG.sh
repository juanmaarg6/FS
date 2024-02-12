Alumno: Juan Manuel Rodríguez Gómez





1. A partir del directorio personal y utilizando una única orden, cree un directorio llamado repaso, dentro de él otros dos directorios llamados prueba1y prueba2, y dentro de prueba1 otro directorio llamado ejercicio1

	mkdir repaso; mkdir repaso/prueba1 repaso/prueba2; mkdir repaso/prueba1/ejercicio1





2. Situados en el directorio ejercicio1, con una única orden, cree cinco archivos llamados arch1.txt, arch2.txt, arch3.txt, arch4.pdf y arch5.pdf

	touch arch1.txt arch2.txt arch3.txt arch4.pdf arch5.pdf





3. Desde el directorio ejercicio1, redireccione al archivo arch1.txt el resultado de buscar la palabra “expresiones” en la ayuda (help) de la orden let

	help let | grep -n "expresiones" >> arch1.txt






4. Desde  el directorio  personal,  copie  los  ficheros  de  ejercicio1  cuya  extensión  tenga  una  x  al directorio prueba2.

	cp repaso/prueba1/ejercicio1/*.*x* repaso/prueba2






5. Nuevamente desde el directorio personal, obtenga las 15 primeras líneas del manual de la orden find y añádalo al final del archivo arch1.txt del directorio prueba2.

	man find | head -15 >> repaso/prueba2/arch1.txt






6. Exprese la siguiente operación aritmética e indique su resultado: 2+3+4+5/2 con y sin decimales.

	let resultado_entero=2+3+4+5/2 ; echo $resultado_entero

	resultado_decimal=$(echo 2+3+4+5/2 | bc -l) ; echo $resultado_decimal






7. En la carpeta personal, construya un guión llamado repaso que admita dos argumentos, el primero será un directorio y el segundo será unarchivo:

repaso<nombre_directorio> <nombre_archivo>

El guión deberá hacer lo siguiente:

–Comprobar que el número de argumentos es correcto, y si no fuera así, indicar cómo se debe ejecutar para que funcione correctamente. Esto es, una pequeña ayuda y terminar.

–Si el segundo argumento es un archivo, escribir las tres primeras líneas en otro archivo llamado salida y  mostrar  un  mensaje  informando  de  dicha  acción.  En  caso  contrario informar del error y salir.

–Si el primer argumento es un directorio, mostrar un mensaje con el número de archivos que contiene. En caso contrario crear un directorio con el nombre del primer argumento.

–Buscar en el directorio pasado como primerargumento los archivos que tienen permiso de lectura y añadir el resultado de la búsqueda al final del archivo salida. Además, mostrar por pantalla el siguiente mensaje: “De un total de N archivos, hay X archivos con permiso de lectura” (siendo N el número total de archivos del directorio y X los que tienen permiso de lectura).

	PARA CREAR EL GUIÓN:

	touch repaso.sh

	CONTENIDO DEL GUIÓN:

	#!/bin/bash
	#Titulo:	repaso
	#Fecha:		22/03/2020
	#Autor:		Juan Manuel Rodriguez Gomez
	#Version:	1.0
	#Descripcion:	Comprueba que el número de argumentos es correcto. Si no es así indica cómo se debe ejecutar para que funcione correctamente.
	#		Si el segundo argumento es un archivo, escribe las tres primeras líneas en otro archivo llamado salida y  muestra  un  mensaje  	
	#		informando  de  dicha  acción.  En  caso  contrario informa del error y sale.
	#		Si el primer argumento es un directorio, muestra un mensaje con el número de archivos que contiene. En caso contrario crea un 		
	#		directorio con el nombre del primer argumento.
	#		Finalmente, busca en el directorio pasado como primer argumento los archivos que tienen permiso de lectura y añade el resultado 	
	#		de la búsqueda al final del archivo salida. Además, muestra por pantalla el siguiente mensaje: “De un total de N archivos, hay 		
	#		X archivos con permiso de lectura” (siendo N el número total de archivos del directorio y X los que tienen permiso de lectura).
	#Opciones:	Ninguna
	#Uso:		repaso <nombre_directorio> <nombre_archivo>

	if [ $# == 2 ] ; then
		if ! [ -e $2 ] ; then
			echo "Error. El archivo '$2' no existe" ;
		elif ! [ -s $2 ] ; then
			echo "Error. El archivo '$2' existe pero esta vacio" ;
		elif [ -d $2 ] ; then
			echo "Error. El archivo '$2' es un directorio" ;
		else
			head -3 $2 > salida.txt ; echo "Las tres primeras lineas de '$2' se han copiado en salida.txt correctamente" ;
			if ! [ -d $1 ] ; then
				mkdir $1 ; echo "Se ha creado el directorio '$1'" ;
				let N=$(find $1 | wc -l);
			else
				let N=$(find $1 | wc -l) ; echo "El directorio '$1' tiene $N archivos" ; 
			fi

			let X=$(find $1 -perm -a+r | wc -l) ; echo $X >> salida.txt
			echo "De un total de $N archivos del directorio $1, hay $X archivos con permiso de lectura"
		fi 
	else
		echo "Para ejecutar el guion: repaso <nombre_directorio> <nombre_archivo>" ;
	fi










