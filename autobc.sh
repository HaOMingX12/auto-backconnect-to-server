#!/bin/bash
# HaOMing_X12
# MasukinNicklu
# Team: Clan_X12
# Coded by HaOMing_X12
# Tools Reverse Shell HaOMing_X12

# Bersihkan layar
clear

# Mendapatkan IP lokal (menggunakan ip addr show sebagai alternatif dari ifconfig)
local_ip=$(ip addr show | grep 'inet ' | awk '{print $2}' | cut -d/ -f1 | head -n1)

# Mendapatkan IP publik menggunakan layanan eksternal (pastikan server terhubung ke internet)
public_ip=$(curl -s ifconfig.me)

# Tampilan judul dan informasi
echo "=>>>> Tools Reverse Shell <<<<="
echo "Local IP  : $local_ip"
echo "Public IP : $public_ip"

# Meminta input port dari pengguna
echo "Masukkan Port Yang Ingin Listen :"
read port

# Cek apakah input port valid (harus angka antara 1-65535)
if [[ "$port" =~ ^[0-9]+$ ]] && [ "$port" -ge 1 ] && [ "$port" -le 65535 ]; then
    echo "Listening on port $port..."

    # Mulai mendengarkan di port yang dimasukkan pengguna menggunakan Netcat
    nc -lvnp $port
else
    echo "Error: Port tidak valid. Silakan masukkan angka antara 1-65535."
fi
