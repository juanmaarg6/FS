Alumno: Juan Manuel Rodríguez Gómez





1. Cree tres directorios con una única orden: curso_1920 y dentro de éste, cuatrimestre_1 y cuatrimestre_2.

	mkdir curso_1920; mkdir curso_1920/cuatrimestre_1 curso_1920/cuatrimestre_2





2. Cree un  archivo  cuyo  nombre  sea repasoMod1 en  el  directorio curso_1920. A continuación, edítelo y escriba lo siguiente: 
   DNI: número del DNI
   Nombre y apellidos: nombre y apellidos
   Fecha: fecha actual (dd/mm/aaaa)

	cd curso_1920/
	touch repasoMod1
	echo "DNI: 49559494Z" >> repasoMod1
	echo "Nombre y apellidos: Juan Manuel Rodríguez Gómez" >> repasoMod1
	echo "Fecha: $(date +'%D')" >> repasoMod1





3. Copie el archivo repasoMod1 del directorio curso_1920 en el directorio cuatrimestre_1. 

	cp repasoMod1 cuatrimestre_1/





4. Redireccione el resultado de ejecutar la orden que obtiene la fecha actual al fichero que ha creado 
   en el punto 2 (en el directorio curso_1920) sin destruir su contenido.

	date +'%D' >> repasoMod1





5. Indique qué es necesario hacer para crear una variable RUTA que contenga la ruta absoluta del directorio en el que  
   nos encontramos. Compruebe con el comando correspondiente las variables locales de su sistema.

	RUTA=$(pwd)
	echo $RUTA
	set 
	set | grep ^RUTA





6. Obtenga  las  20  últimas  líneas  del  manual  de  la  orden  find  y  guárdelas  en  un  fichero llamado ayudafind, 
   dentro del directorio cuatrimestre_2.

	cd cuatrimestre_2
	touch ayudafind
	man find | tail -20 >> ayudafind





7. En la carpeta personal, construya un guión llamado repaso-guion que admita tres argumentos, el primero será un directorio, 
   el segundo una letra, y el tercero una palabra:

   examen-guion <nombre_directorio> <letra> <palabra>

   El guión debe:

   - Comprobar que se le están pasando tres argumentos, y si no fuera así, indicar cómo se debe ejecutar para que 
     funcione correctamente. Esto es, dar una pequeña ayuda y terminar.

   - Crear, en caso de no existir, el directorio dado como primer argumento.

   - Comprobar que el segundo argumento sea una f o una d. Si no fuera así, indicarlo con un mensaje de error y salir.

   - Encontrar la palabra dada en el tercer argumento de forma recursiva en los archivos existentes a partir del directorio 
     indicado por el usuario (primer argumento), incluyendo el número de línea en donde se localiza el término. Almacenar el 
     resultado de la consulta en un fichero llamado resultado dentro del directorio desde el que se ejecute el guión.

   - Buscar en el directorio indicado por el usuario (primer argumento) todos los ficheros o directorios según la letra pasada 
     como segundo argumento (f=fichero, d=directorio). Almacenar el resultado de la consulta al final del fichero resultado
     del apartado anterior.

	PARA CREAR EL GUIÓN:

	touch repaso-guion.sh

	CONTENIDO DEL GUIÓN:

	#!/bin/bash
	#Titulo:	repaso-guion
	#Fecha:		19/04/2020
	#Autor:		Juan Manuel Rodriguez Gomez
	#Version:	1.0
	#Descripcion:	Comprueba que se le están pasando tres argumentos, y si no fuera así, indica cómo se debe ejecutar para que 
	#		funcione correctamente. Esto es, dar una pequeña ayuda y terminar.
	#		Crea, en caso de no existir, el directorio dado como primer argumento.
	#		Comprueba que el segundo argumento sea una f o una d. Si no fuera así, lo indica con un mensaje de error y salir.
	#		Encuentra la palabra dada en el tercer argumento de forma recursiva en los archivos existentes a partir del directorio 
	#		indicado por el usuario (primer argumento), incluyendo el número de línea en donde se localiza el término. Almacena el 
	#		resultado de la consulta en un fichero llamado resultado dentro del directorio desde el que se ejecute el guión.
	#		Busca en el directorio indicado por el usuario (primer argumento) todos los ficheros o directorios según la letra pasada 
	#		como segundo argumento (f=fichero, d=directorio). Almacena el resultado de la consulta al final del fichero resultado
	#		del apartado anterior.
	#Opciones:	Ninguna
	#Uso:		./repaso-guion <nombre_directorio> <letra> <palabra>

		if [ $# == 3 ] ; then

			if [ "$2" = "d" ] || [ "$2" = "f" ] ; then

				if ! [ -d $1 ] ; then

					mkdir $1 ; echo -e "\nSe ha creado el directorio '$1'\n"

				else
					echo -e "\nDirectorio: $1\n"
					grep -r -n "$3" $1 > resultado

					if [ "$2" = "d" ] ; then

						find $1 -type d >> resultado

					elif [ "$2" = "f" ] ; then

						find $1 -type f >> resultado
					fi
				fi

			else
				echo -e "\nEl segundo argumento debe ser 'd' o 'f'\n"
			fi

		else
			echo -e "\nPara ejecutar el guion: ./repaso-guion <nombre_directorio> <letra> <palabra>\n"
		fi


