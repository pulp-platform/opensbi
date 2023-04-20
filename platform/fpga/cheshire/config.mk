#
# SPDX-License-Identifier: BSD-2-Clause
#
# Copyright (C) 2019 FORTH-ICS/CARV
#		Panagiotis Peristerakis <perister@ics.forth.gr>
#

#for more infos, check out /platform/template/config.mk

PLATFORM_RISCV_XLEN = 64

# Blobs to build
FW_TEXT_START=0x80000000
FW_JUMP=n

ifeq ($(PLATFORM_RISCV_XLEN), 32)
 # This needs to be 4MB aligned for 32-bit support
 FW_JUMP_ADDR=0x80400000
 else
 # This needs to be 2MB aligned for 64-bit support
 FW_JUMP_ADDR=0x80200000
 endif
# TODO: this is a cancerous workaround; set this correctly, ideally built!
FW_JUMP_FDT_ADDR=0x80800000

# Firmware with payload configuration.
FW_PAYLOAD=y

ifeq ($(PLATFORM_RISCV_XLEN), 32)
# This needs to be 4MB aligned for 32-bit support
  FW_PAYLOAD_OFFSET=0x400000
else
# This needs to be 2MB aligned for 64-bit support
  FW_PAYLOAD_OFFSET=0x200000
endif
# TODO: this is a cancerous workaround; set this correctly, ideally built!
FW_PAYLOAD_FDT_ADDR=0x80800000
FW_PAYLOAD_ALIGN=0x1000