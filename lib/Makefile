###########################################################################
# Makefile for libraries
#
# This Makefile expects the following environment vars:
# BUILD_ROOT
# OUTPUT_PATH
#
# Author: J. Ian Lindsay
###########################################################################
C_STANDARD   = gnu99
CPP_STANDARD = gnu++11

C_SRCS         =
CXX_SRCS       =
LIBS_TO_BUILD  =
INCLUDES       = -iquote.

# TODO: More makefile fixes required to avoid this...
INCLUDES   += -I.

###########################################################################
# Environmental awareness...
###########################################################################
SHELL          = /bin/sh



###########################################################################
# Option conditionals
###########################################################################
ifeq ($(CRYPTO),MBED)
INCLUDES    += -I$(BUILD_ROOT)/lib/mbedtls/include/
CRYPTO_LIBS += -lmbedtls
CRYPTO_LIBS += -lmbedx509
CRYPTO_LIBS += -lmbedcrypto
BURRITO_OPTIONS += -DWITH_MBEDTLS
# mbedTLS will require this in order to use our chosen options.
BURRITO_OPTIONS += -DMBEDTLS_CONFIG_FILE='<mbedTLS_conf.h>'
LIBS_TO_BUILD  += mbedtls.a
endif

# TODO: OpenSSL

# TODO: TinyDTLS

# TODO: Sodium


###########################################################################
# Parameter unification and make targets
###########################################################################
LOCAL_C_FLAGS   += $(INCLUDES) -nostdlib $(CFLAGS)
LOCAL_CXX_FLAGS += $(INCLUDES) $(CXXFLAGS)

OBJS  = $(C_SRCS:.c=.o) $(CXX_SRCS:.cpp=.o)


all: $(LIBS_TO_BUILD)

%.o : %.c
	$(CC) $(LOCAL_C_FLAGS) -std=$(C_STANDARD) -c $< -o $@

%.o : %.cpp
	$(CXX) $(LOCAL_CXX_FLAGS) -std=$(CPP_STANDARD) -c $< -o $@

libburritobackend.a: $(OBJS)
	$(AR) -rvs $(OUTPUT_PATH)/libburritobackend.a $(OBJS)

mbedtls.a:
	$(MAKE) lib -C mbedtls/
	cp -RP mbedtls/library/*.a $(OUTPUT_PATH)

clean:
	rm -f $(OBJS) $(OUTPUT_PATH)/libburritobackend.a
	$(MAKE) clean -C mbedtls/
