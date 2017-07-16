#!/bin/bash
#
# This script exists for the sake of running the built-in example programs. If
#   you are only interested in using the wrapper as a library, this file is
#   unimportant. Your codebase will be expected to provide the selected backend.

# mbedTLS...
rm -rf lib/mbedtls
git clone https://github.com/ARMmbed/mbedtls.git lib/mbedtls
