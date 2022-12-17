SYN_CLEAN_TARGET += *.txt
SYN_CLEAN_TARGET += *.jou
SYN_CLEAN_TARGET += *.log
SYN_CLEAN_TARGET += *.zip
SYN_CLEAN_TARGET += *.xsa
SYN_CLEAN_TARGET += ./adrv9361z7035_ccbob_lvds

.PHONY: clean

syn: system_top.xsa 

system_top.xsa: $(wildcard hdl/*) $(wildcard xdc/*)
	@make clean
	@vivado -mode batch -source project.tcl >> vivado.log || exit $$?;
	@echo "Bitstream is created successfully."

clean:
	@for clean_target in $(SYN_CLEAN_TARGET); do\
		rm -rf ./$${clean_target} || exit $$?; \
	done