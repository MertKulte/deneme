# ADI Libraries that are used in the design
ADI_LIB_DEPS += axi_ad9361
ADI_LIB_DEPS += util_cdc
ADI_LIB_DEPS += util_axis_fifo
ADI_LIB_DEPS += axi_dmac
ADI_LIB_DEPS += axi_gpreg
ADI_LIB_DEPS += axi_sysid
ADI_LIB_DEPS += sysid_rom
ADI_LIB_DEPS += util_pack/util_cpack2
ADI_LIB_DEPS += util_pack/util_upack2
ADI_LIB_DEPS += util_rfifo
ADI_LIB_DEPS += util_tdd_sync
ADI_LIB_DEPS += util_wfifo
ADI_LIB_DEPS += xilinx/axi_xcvrlb
ADI_LIB_DEPS += xilinx/util_clkdiv

.PHONY: all clean adi_lib clean_adi_lib adi_lib
#all: adi_lib 

all: adi_lib

clean: clean_adi_lib

adi_lib: 
	@for lib in $(ADI_LIB_DEPS); do \
		#echo $$lib; \
		$(MAKE) --no-print-directory -C hdl/adi_lib/$${lib} xilinx || exit $$?; \
	done															
	
clean_adi_lib:
	echo $$?
	@for lib in $(ADI_LIB_DEPS); do \
		$(MAKE) --no-print-directory -C hdl/adi_lib/$${lib} clean; \
	done