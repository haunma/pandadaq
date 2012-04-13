BITGEN_OPTS = -d -g LCK_cycle:6 -w

ifeq ($(RESCUE),1)
	BUILDDIR=build-rescue
else
	BUILDDIR=build
endif

all: $(BUILDDIR)/pandadaq.bit

timing: $(BUILDDIR)/pandadaq-routed.twr

usage: $(BUILDDIR)/pandadaq-routed.xdl
	../../tools/xdlanalyze.pl $(BUILDDIR)/pandadaq-routed.xdl 0

#load: $(BUILDDIR)/pandadaq.bit
#	jtag -n load.batch

# Sometimes different options are needed to meet timing
build/pandadaq.ncd: build/pandadaq.ngd
	cd build && map -ol high -t 20 -w pandadaq.ngd

build/pandadaq-routed.ncd: build/pandadaq.ncd
	cd build && par -ol high -w pandadaq.ncd pandadaq-routed.ncd

build-rescue/pandadaq.ncd: build-rescue/pandadaq.ngd
	cd build-rescue && map -ol high -w pandadaq.ngd

build-rescue/pandadaq-routed.ncd: build-rescue/pandadaq.ncd
	cd build-rescue && par -ol high -w pandadaq.ncd pandadaq-routed.ncd

$(BUILDDIR)/pandadaq.bit: $(BUILDDIR)/pandadaq-routed.ncd
	cd $(BUILDDIR) && bitgen $(BITGEN_OPTS) pandadaq-routed.ncd pandadaq.bit

$(BUILDDIR)/pandadaq-routed.xdl: $(BUILDDIR)/pandadaq-routed.ncd
	cd $(BUILDDIR) && xdl -ncd2xdl pandadaq-routed.ncd pandadaq-routed.xdl

$(BUILDDIR)/pandadaq-routed.twr: $(BUILDDIR)/pandadaq-routed.ncd
	cd $(BUILDDIR) && trce -e 100 pandadaq-routed.ncd pandadaq.pcf


clean:
	rm -rf build/* build-rescue/*

.PHONY: timing usage clean

