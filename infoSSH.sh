#!/bin/bash

echo "Historial de conexiones SSH del último día:"

# Mostrar el historial de conexiones SSH del último día con formato mejorado
journalctl _COMM=sshd --since yesterday | awk '
{
    if ($0 ~ /Accepted password/ || $0 ~ /session opened/)
        print "\033[32m"$0"\033[0m"   # Resalta conexiones abiertas en verde
    else if ($0 ~ /session closed/)
        print "\033[31m"$0"\033[0m"   # Resalta conexiones cerradas en rojo
    else
        print $0
}'
