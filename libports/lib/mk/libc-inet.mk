LIBC_INET_DIR = $(LIBC_DIR)/libc/inet

FILTER_OUT_C += nsap_addr.c

SRC_C = $(filter-out $(FILTER_OUT_C),$(notdir $(wildcard $(LIBC_INET_DIR)/*.c)))

include $(REP_DIR)/lib/mk/libc-common.inc

vpath %.c $(LIBC_INET_DIR)
