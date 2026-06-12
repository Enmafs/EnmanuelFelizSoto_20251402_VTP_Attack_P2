# VTP Attack — VLAN Add & Delete
**Estudiante:** Enmanuel Feliz Soto | **Matrícula:** 20251402
**Institución:** ITLA | **Curso:** Seguridad en Redes | **Práctica:** P2

## 📹 Video Demostración
🔗 [▶ VTP VLAN Hopping Attack — Ver en YouTube](https://youtu.be/3wIp_Bs5HmA)
🔗 [Playlist completa NetSec](https://www.youtube.com/playlist?list=PLn9wGcsdOtleB6unDjCUvq4LdJYgd4TTj)

## 🎯 Objetivo del Laboratorio
Demostrar un ataque VTP inyectando anuncios con número de revisión alto para agregar y borrar VLANs en switches VTP Client, y aplicar la contramedida.

## 🎯 Objetivo del Script
Usar Yersinia para inyectar VTP Summary Advertisements con revisión superior, logrando agregar o borrar VLANs en toda la red desde un punto no autorizado.

## 🗺️ Topología
<img width="1430" height="477" alt="Captura de pantalla 2026-06-12 014740" src="https://github.com/user-attachments/assets/1a439753-426d-4e1f-b924-d3cf18112348" />

| Dispositivo | Rol                      | Interfaz | IP            |
| ----------- | ------------------------ | -------- | ------------- |
| R1          | GTW RED                  | e0/0     | —              |
| SW1         | VTP Server (objetivo)    | e0/1-3   | —              |
| Ubuntu MATE | Host atacante (Yersinia) | ens3     | 14.2.0.X/27    |

**Entorno:** PNetLab — Cisco IOL + Ubuntu MATE | **Base IP:** Matrícula 20251402 → 14.2.0.0

## ⚙️ Requisitos
```bash
sudo apt install yersinia -y
sudo bash EnmanuelFelizSoto_20251402_VTP_Attack_P2.sh
```
Yersinia 0.8.2+ · Root/sudo · Puerto en modo trunk hacia el switch

## 📋 Parámetros
| Parámetro | Descripción | Default |
|-----------|-------------|---------|
| `$1` interfaz | Interfaz de red | `ens3` |
| `-attack 1` | Agregar VLAN | — |
| `-attack 2` | Borrar VLAN | — |

## 🔧 Uso
```bash
sudo bash EnmanuelFelizSoto_20251402_VTP_Attack_P2.sh
# Con interfaz específica:
sudo bash EnmanuelFelizSoto_20251402_VTP_Attack_P2.sh eth1
```

## 🔍 Funcionamiento
1. Yersinia captura anuncios VTP existentes en la interfaz trunk
2. Construye un VTP Summary Advertisement con `revision_number` mayor al actual
3. Los switches VTP Client aceptan el anuncio y sincronizan su base de VLANs
4. Se agrega o borra una VLAN desde un punto no autorizado

## 🛡️ Contramedida
```
SW(config)# vtp version 3
SW(config)# vtp password ITLA2025 secret
! O modo transparente para no aceptar actualizaciones
SW(config)# vtp mode transparent
SW(config-if)# switchport port-security maximum 2
```

> ⚠️ Solo para uso en laboratorio controlado con contrato de ética firmado.
