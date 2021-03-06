MPFR_DIR  = $(REP_DIR)/contrib/mpfr-3.0.0

ifeq ($(wildcard $(MPFR_DIR)),)
REQUIRES += prepare_mpfr
endif

# mpfr depends on gmp, which is only supported on x86 yet
REQUIRES += x86

LIBS      = libc gmp
CC_OPT   += -DHAVE_STDARG -DHAVE_VA_COPY -DHAVE_INTTYPES_H
INC_DIR  += $(REP_DIR)/include/mpfr

MPFR_SRC_C := $(notdir $(wildcard $(MPFR_DIR)/*.c))
FILTER_OUT := ansi2knr.c jyn_asympt.c round_raw_generic.c speed.c tuneup.c
SRC_C      := $(filter-out $(FILTER_OUT),$(MPFR_SRC_C))

vpath %.c $(MPFR_DIR)

SHARED_LIB = 1
