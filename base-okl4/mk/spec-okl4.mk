#
# Specifics for the OKL4 kernel API
#

#
# Read default and builddir-specific config files
#
-include $(call select_from_repositories,etc/okl4.conf)
-include $(BUILD_BASE_DIR)/etc/okl4.conf

#
# If no OKL4 source directory is set, we use the standard contrib directory
#
OKL4_DIR ?= $(BASE_DIR)/../base-okl4/contrib/okl4

#
# Make sure that symlink modification times are handled correctly.
# Otherwise, the creation of symlinks that depend on their own directory
# behaves like a phony rule. This is because the directory mtime is
# determined by taking the mtimes of containing symlinks into account.
# Hence, all symlinks (except for the youngest) depend on a directory
# with a newer mtime. The make flag -L fixes the problem. Alternatively,
# we could use 'cp' instead of 'ln'.
#
MAKEFLAGS += -L

#
# OKL4-specific Genode headers
#
INC_DIR += $(BUILD_BASE_DIR)/include

#
# Startup code to be used when building a program
#
STARTUP_LIB ?= startup
PRG_LIBS    += $(STARTUP_LIB)

#
# Define maximum number of threads, needed by the OKL4 kernel headers
#
CC_OPT += -DCONFIG_MAX_THREAD_BITS=10

#
# Clean rules for removing the side effects of building the platform
# library
#
clean_includes:
	$(VERBOSE)rm -rf $(BUILD_BASE_DIR)/include

clean cleanall: clean_includes
