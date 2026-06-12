# VTP Attack — VLAN Add & Delete
**Estudiante:** Enmanuel Feliz Soto | **Matrícula:** 20251402
**Institución:** ITLA | **Curso:** Seguridad en Redes | **Práctica:** P2

## 📹 Video Demostración
🔗 [Ver en YouTube — VTP Attack](https://youtu.be/3wIp_Bs5HmA)
🔗 [Playlist completa](https://www.youtube.com/playlist?list=PLn9wGcsdOtleB6unDjCUvq4LdJYgd4TTj)

## 🎯 Objetivo del Laboratorio
Demostrar un ataque VTP inyectando anuncios con número de revisión alto para agregar y borrar VLANs en switches que actúan como VTP Clients, y aplicar la contramedida correspondiente.

## 🎯 Objetivo del Script
Usar Yersinia para inyectar mensajes VTP Summary Advertisement con revisión superior al switch víctima, logrando:
- **Attack 1:** Agregar una VLAN
- **Attack 2:** Borrar una VLAN

## ⚙️ Requisitos
```bash
sudo apt install yersinia -y
sudo bash EnmanuelFelizSoto_20251402_VTP_Attack_P2.sh [interfaz]
```
- Yersinia 0.8.2+
- Root/sudo
- Interfaz conectada al trunk del switch objetivo

## 📋 Parámetros
| Parámetro | Descripción | Default |
|-----------|-------------|---------|
| `$1` (interfaz) | Interfaz de red | `ens3` |
| `-attack 1` | Agregar VLAN via VTP | — |
| `-attack 2` | Borrar VLAN via VTP | — |

## 🔧 Uso
```bash
# Ataque con interfaz por defecto (ens3)
sudo bash EnmanuelFelizSoto_20251402_VTP_Attack_P2.sh

# Ataque con interfaz específica
sudo bash EnmanuelFelizSoto_20251402_VTP_Attack_P2.sh eth1
```

## 🗺️ Topología de Red
| Dispositivo | Rol | Interfaz |
|-------------|-----|----------|
| SW1 | VTP Server | e0/2-3 |
| SW2 | VTP Client (objetivo) | e0/0-1 |
| Ubuntu MATE | Host atacante (Yersinia) | ens3 |

**Entorno:** PNetLab con Cisco IOL + Ubuntu MATE (Desktop)
**Direccionamiento:** Basado en matrícula 20251402 → 14.2.0.0

## 🔍 Funcionamiento
1. Yersinia escucha en la interfaz trunk y captura anuncios VTP existentes
2. Construye un VTP Summary Advertisement con revision_number mayor al actual
3. Los switches VTP Client aceptan el anuncio y sincronizan su base de VLANs
4. Se puede agregar o borrar VLANs de toda la red desde un punto no autorizado

## 🛡️ Contramedida
```
! Usar VTP versión 3 (protección por contraseña primaria)
SW(config)# vtp version 3
SW(config)# vtp password ITLA2025 secret

! O configurar en modo transparente para no aceptar actualizaciones
SW(config)# vtp mode transparent

! Port Security para limitar dispositivos por puerto
SW(config-if)# switchport port-security maximum 2
SW(config-if)# switchport port-security violation restrict
```

## 📁 Estructura
```
├── EnmanuelFelizSoto_20251402_VTP_Attack_P2.sh
├── EnmanuelFelizSoto_20251402_Informe_P2.pdf
├── screenshots/
└── README.md
```

> ⚠️ Solo para uso en laboratorio controlado con contrato de ética firmado.
