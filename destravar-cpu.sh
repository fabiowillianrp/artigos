#!/bin/bash
modprobe msr
sleep 2
val=$(rdmsr 0x1FC)
wrmsr -a 0x1FC 0x$(printf '%x' $(( 0x$val & ~1 )))
