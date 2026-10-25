import socket
import struct

def send_wol(mac_address):
    # Remove separadores se houver e transforma em bytes
    cleaned_mac = mac_address.replace(':', '').replace('-', '')
    mac_bytes = bytes.fromhex(cleaned_mac)

    # Cria o Magic Packet (6 bytes de FF + MAC repetido 16 vezes)
    packet = b'\xff' * 6 + mac_bytes * 16

    # Envia via Broadcast para a rede
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)

    # Dispara tanto para o broadcast geral quanto para o local comum
    sock.sendto(packet, ('255.255.255.255', 9))
    sock.sendto(packet, ('192.168.31.255', 9))
    print(f"Pacote mágico enviado para {mac_address}!")

send_wol('00:00:00:00:00:00')  # Substitua pelo endereço MAC real do dispositivo
