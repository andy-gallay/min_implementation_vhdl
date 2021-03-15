# C:\Xilinx\Vivado\2020.1\bin\vivado -mode tcl -source ../synthesis.tcl

read_vhdl -vhdl2008 ../fifo.vhd
read_vhdl -vhdl2008 ../fork.vhd
read_vhdl -vhdl2008 ../selector.vhd
read_vhdl -vhdl2008 ../switch.vhd
read_vhdl -vhdl2008 ../genericMultistageInterconnectionNetwork.vhd
read_xdc ../basys3_constraints.xdc
#synthese
synth_design -top genericMultistageInterconnectionNetwork -generic M=8 -generic messageW=32 -generic N=2  -part xc7a35tcpg236-1 -assert 
report_utilization -file ./reports/utilization_8_32_2.txt

synth_design -top genericMultistageInterconnectionNetwork -generic M=8 -generic messageW=32 -generic N=4  -part xc7a35tcpg236-1 -assert 
report_utilization -file ./reports/utilization_8_32_4.txt

synth_design -top genericMultistageInterconnectionNetwork -generic M=8 -generic messageW=32 -generic N=8  -part xc7a35tcpg236-1 -assert 
report_utilization -file ./reports/utilization_8_32_8.txt

synth_design -top genericMultistageInterconnectionNetwork -generic M=8 -generic messageW=32 -generic N=16  -part xc7a35tcpg236-1 -assert 
report_utilization -file ./reports/utilization_8_32_16.txt

synth_design -top genericMultistageInterconnectionNetwork -generic M=8 -generic messageW=32 -generic N=32 -part xc7a35tcpg236-1 -assert 
report_utilization -file ./reports/utilization_8_32_32.txt

synth_design -top genericMultistageInterconnectionNetwork -generic M=8 -generic messageW=32 -generic N=64 -part xc7a35tcpg236-1 -assert 
report_utilization -file ./reports/utilization_8_32_64.txt

synth_design -top genericMultistageInterconnectionNetwork -generic M=8 -generic messageW=64 -generic N=2 -part xc7a35tcpg236-1 -assert 
report_utilization -file ./reports/utilization_8_64_2.txt

synth_design -top genericMultistageInterconnectionNetwork -generic M=8 -generic messageW=128 -generic N=2 -part xc7a35tcpg236-1 -assert 
report_utilization -file ./reports/utilization_8_128_2.txt

synth_design -top genericMultistageInterconnectionNetwork -generic M=8 -generic messageW=256 -generic N=2 -part xc7a35tcpg236-1 -assert 
report_utilization -file ./reports/utilization_8_256_2.txt

synth_design -top genericMultistageInterconnectionNetwork -generic M=8 -generic messageW=512 -generic N=2 -part xc7a35tcpg236-1 -assert 
report_utilization -file ./reports/utilization_8_512_2.txt

synth_design -top genericMultistageInterconnectionNetwork -generic M=16 -generic messageW=32 -generic N=2  -part xc7a35tcpg236-1 -assert 
report_utilization -file ./reports/utilization_16_32_2.txt

synth_design -top genericMultistageInterconnectionNetwork -generic M=32 -generic messageW=32 -generic N=2  -part xc7a35tcpg236-1 -assert 
report_utilization -file ./reports/utilization_32_32_2.txt

synth_design -top genericMultistageInterconnectionNetwork -generic M=64 -generic messageW=32 -generic N=2  -part xc7a35tcpg236-1 -assert 
report_utilization -file ./reports/utilization_64_32_2.txt