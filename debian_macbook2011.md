# Guia de Otimização: Debian Testing no MacBook Air 2011 (4GB RAM)

Este guia contém os procedimentos realizados para otimizar o Debian Testing com interface GNOME em um MacBook Air 2011 rodando sem bateria física.

## 1. Ajuste do ZRAM (Memória Virtual Compactada)
```bash
sudo apt install zram-tools
```
Configuração aplicada em `/etc/default/zramswap`:
* `PERCENT=50`
* `ALGORITHM=lz4`

## 2. Aceleração de Vídeo por Hardware (Intel HD 3000)
```bash
sudo apt install i965-va-driver intel-media-va-driver vainfo
```
Adicionado ao arquivo `/etc/environment`:
```text
LIBVA_DRIVER_NAME=i965
```

## 3. Controle Térmico Sem Bateria (TLP + mbpfan)
```bash
sudo apt install tlp tlp-rdw mbpfan
```
* Módulos ativos em `/etc/modules`: `coretemp` e `applesmc`.
* Configuração do TLP (`/etc/tlp.conf`): Desativado Turbo Boost (`CPU_BOOST_ON_AC=0`).
* Configuração do mbpfan (`/etc/mbpfan.conf`): `low_temp = 55` e `max_temp = 75`.

## 4. Otimização do GNOME e Swappiness
Desativar animações:
```bash
gsettings set org.gnome.desktop.interface enable-animations false
```
Configuração de Swappiness em `/etc/sysctl.conf`:
```text
vm.swappiness=10
vm.vfs_cache_pressure=50
```

## 5. Streaming no YouTube (Alívio de CPU)
* Instalação da extensão **Enhanced h264ify**.
* Bloqueio dos formatos VP8, VP9 e AV1 (forçando H.264 acelerado por hardware).
* Ativação de VA-API nas flags/configurações do navegador.
