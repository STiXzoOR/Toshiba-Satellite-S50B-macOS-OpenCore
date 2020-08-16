# makefile
#
# Created by the-braveknight, edited by me.
#

BUILDDIR=./Build
HOTPATCH=./Hotpatch

IASL=iasl
HACK=$(wildcard $(HOTPATCH)/*.dsl)
HACK:=$(subst $(HOTPATCH),$(BUILDDIR),$(HACK))
HACK:=$(subst .dsl,.aml,$(HACK))

ALL=$(HACK)

.PHONY: all
all : $(ALL)
	
.PHONY: clean
clean:
	rm -f $(BUILDDIR)/*.aml

.PHONY: install
install: $(HACK)
	$(eval EFIDIR:=$(shell macos-tools/mount_efi.sh))
	rm -f $(EFIDIR)/EFI/OC/ACPI/*.aml
	cp $(HACK) $(EFIDIR)/EFI/OC/ACPI

Build/%.aml : Hotpatch/%.dsl
	$(IASL) -p $@ $<

#EOF
