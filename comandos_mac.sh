#!/bin/bash
# Comando manual:
# sudo modprobe msr && val=$(sudo rdmsr 0x1FC); sudo wrmsr -a 0x1FC 0x$(printf '%x' $(( 0x$val & ~1 )))

# Script de automação (/usr/local/bin/destravar-cpu.sh):
# #!/bin/bash
# modprobe msr
# sleep 2
# val=$(rdmsr 0x1FC)
# wrmsr -a 0x1FC 0x$(printf '%x' $(( 0x$val & ~1 )))
