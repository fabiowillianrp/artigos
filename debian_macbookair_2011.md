==================================================================
GUIA DE OTIMIZAÇÃO: DEBIAN TESTING NO MACBOOK AIR 2011 (4GB RAM)
==================================================================

1. ATIVAÇÃO E AJUSTE DO ZRAM (MEMÓRIA VIRTUAL COMPACTADA)
------------------------------------------------------------------
Comando de instalação:
$ sudo apt install zram-tools

Configuração (/etc/default/zramswap):
PERCENT=50
ALGORITHM=lz4 (ou zstd se instalado o pacote 'zstd')

Comando para reiniciar e checar:
$ sudo systemctl restart zramswap
$ zramctl

2. ACELERAÇÃO DE VÍDEO HARDWARE (INTEL HD 3000)
------------------------------------------------------------------
Instalação dos drivers legados:
$ sudo apt install i965-va-driver intel-media-va-driver vainfo

Configuração da variável de ambiente (/etc/environment):
LIBVA_DRIVER_NAME=i965

Comando de validação pós-reboot (Deve retornar 'returns 0'):
$ vainfo

3. CONTROLE DE TEMPERATURA E REFRIGERAÇÃO SEM BATERIA
------------------------------------------------------------------
Instalação do gerenciador de energia e coolers:
$ sudo apt install tlp tlp-rdw mbpfan

Configuração do TLP para desativar Turbo Boost (/etc/tlp.conf):
CPU_BOOST_ON_AC=0
CPU_BOOST_ON_BAT=0
CPU_SCALING_GOVERNOR_ON_AC=conservative

Configuração dos módulos dos sensores da Apple (/etc/modules):
coretemp
applesmc

Configuração do mbpfan para disparar o cooler mais cedo (/etc/mbpfan.conf):
low_temp = 55
max_temp = 75

Comandos para ativar os serviços:
$ sudo tlp start
$ sudo systemctl enable mbpfan && sudo systemctl start mbpfan

4. OTIMIZAÇÃO DO AMBIENTE GRÁFICO GNOME
------------------------------------------------------------------
Desativar animações pesadas de janelas:
$ gsettings set org.gnome.desktop.interface enable-animations false

Ajustar agressividade da Swap (/etc/sysctl.conf):
vm.swappiness=10
vm.vfs_cache_pressure=50
Aplicar: $ sudo sysctl -p

5. REPRODUÇÃO DE VÍDEOS NO YOUTUBE (FAIXA DE 70°C)
------------------------------------------------------------------
- Instalar extensão "Enhanced h264ify" no navegador.
- Bloquear os formatos modernos: VP8, VP9 e AV1.
- No Firefox (about:config): ativar 'media.ffmpeg.vaapi.enabled' para true.
- No Chrome (chrome://flags): ativar 'Hardware-accelerated video decode'.

Comando em modo texto para monitorar a temperatura em tempo real:
$ watch -n 2 cat /sys/class/thermal/thermal_zone0/temp
==================================================================
