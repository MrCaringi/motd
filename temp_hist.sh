#! /bin/bash
#
#	HISTORIC TEMP CALCULATOR for RASPBIAN
#
#	Required Packages
#	none
#
#	example of use
#	script + directory of files
#	temp_hist-sh /home/pi/script/
#
#
###########################################################

#	tomamos la temperatura
	temp=$(/opt/vc/bin/vcgencmd measure_temp | cut -c 6-9)

#	ejemplo bc
#	z=$(echo 'scale=3;4.1+5.2' | bc);echo $z devuelve 9.3

#	Calculamos y guardamos los promedios
#	m(inuto)5 / m(inuto)10 / m(inuto)60 / m(inuto)480

	m=5
	ruta=$1m$m
	t=$(cat $ruta)
	echo "scale=4;($t)*(1-1/$m)+($temp)/$m" | bc > $ruta

	m=10
	ruta=$1m$m
	t=$(cat $ruta)
	echo "scale=4;($t)*(1-1/$m)+($temp)/$m" | bc > $ruta

	m=60
	ruta=$1m$m
	t=$(cat $ruta)
	echo "scale=4;($t)*(1-1/$m)+($temp)/$m" | bc > $ruta

	m=480
	ruta=$1m$m
	t=$(cat $ruta)
	echo "scale=4;($t)*(1-1/$m)+($temp)/$m" | bc > $ruta


#	Comentar despues del testing
#	echo $ruta
#	m5=$(cat m5)
#	m10=$(cat m10)
#	m60=$(cat m60)
#	m480=$(cat m480)
#	echo "m0=$temp m5=$m5 m10=$m10 m60=$m60 m480=$m480"

