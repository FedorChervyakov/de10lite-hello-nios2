QSYS_PROJECT = hello_nios2

QSYS_QIP = $(QSYS_PROJECT)/synthesis/$(QSYS_PROJECT).qip

qsys: $(QSYS_QIP)


QSYS_ARGS = --synthesis=VHDL

$(QSYS_QIP): $(QSYS_PROJECT).qsys
	qsys-generate $(QSYS_ARGS) $(QSYS_PROJECT).qsys
