BOARD_DIR=.
CORES_DIR=../modules

include common.mak
include sources.mak

SRC=$(BOARD_SRC) $(CORES_SRC)

$(BUILDDIR)/pandadaq.ucf: common.ucf xst.ucf
	cat common.ucf xst.ucf > $(BUILDDIR)/pandadaq.ucf

$(BUILDDIR)/pandadaq.prj: $(SRC)
	rm -f $(BUILDDIR)/pandadaq.prj
	for i in `echo $^`; do \
	    echo "verilog work ../$$i" >> $(BUILDDIR)/pandadaq.prj; \
	done

build/pandadaq.ngc: build/pandadaq.prj
	cd build && xst -ifn ../pandadaq.xst

build-rescue/pandadaq.ngc: build-rescue/pandadaq.prj
	cd build-rescue && xst -ifn ../pandadaq-rescue.xst

$(BUILDDIR)/pandadaq.ngd: $(BUILDDIR)/pandadaq.ngc $(BUILDDIR)/pandadaq.ucf
	cd $(BUILDDIR) && ngdbuild -uc pandadaq.ucf pandadaq.ngc

