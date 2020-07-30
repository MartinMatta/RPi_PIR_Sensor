#!/bin/bash


echo 20 > /sys/class/gpio/export
echo 21 > /sys/class/gpio/export

echo out > /sys/class/gpio/gpio20/direction
echo in > /sys/class/gpio/gpio21/direction


sensor() {
  value=$(cat /sys/class/gpio/gpio21/value)
}

led() {
  echo $1 > /sys/class/gpio/gpio20/value
}


for ((;;))
do
  sensor

  if [ $value -eq 1 ];
  then
    led 1
  else
    led 0
  fi
  
done


#clean up
echo 20 > /sys/class/gpio/unexport
echo 21 > /sys/class/gpio/unexport
