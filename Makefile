NIOS_2_SHELL = /opt/intel/quartus/20.1/nios2eds/nios2_command_shell.sh

QSYS_PROJECT = hello_nios2
SOPCINFO = quartus/$(QSYS_PROJECT).sopcinfo

NIOS_BSP_PATH = nios/bsp
NIOS_APP_PATH = nios/app

SRCS = $(wildcard $(NIOS_APP_PATH)/src/*)

BSP_FILES = $(addprefix $(NIOS_BSP_PATH)/, Makefile settings.bsp)
APP_FILES = $(NIOS_APP_PATH)/Makefile

ELF_NAME = $(QSYS_PROJECT).elf

.PHONY: all create-bsp-hal create-app

all: $(NIOS_APP_PATH)/$(ELF_NAME)

create-bsp-hal: $(BSP_FILES)
create-app: $(APP_FILES)

$(BSP_FILES): $(SOPCINFO)
	$(NIOS_2_SHELL) nios2-bsp hal $(NIOS_BSP_PATH) quartus

$(APP_FILES): $(SRCS) $(BSP_FILES)
	$(NIOS_2_SHELL) nios2-app-generate-makefile --bsp-dir $(NIOS_BSP_PATH) \
		--app-dir $(NIOS_APP_PATH) --elf-name $(ELF_NAME) --src-dir $(dir $(SRCS))

$(NIOS_APP_PATH)/$(ELF_NAME): $(BSP_FILES) $(APP_FILES)
	$(NIOS_2_SHELL) make -C $(NIOS_APP_PATH)
