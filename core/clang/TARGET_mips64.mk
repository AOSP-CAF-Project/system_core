
include $(BUILD_SYSTEM)/clang/mips64.mk

CLANG_CONFIG_mips64_TARGET_TRIPLE := mips64el-linux-android
CLANG_CONFIG_mips64_TARGET_TOOLCHAIN_PREFIX := \
  $(TARGET_TOOLCHAIN_ROOT)/$(CLANG_CONFIG_mips64_TARGET_TRIPLE)/bin

CLANG_CONFIG_mips64_TARGET_EXTRA_ASFLAGS := \
  $(CLANG_CONFIG_EXTRA_ASFLAGS) \
  $(CLANG_CONFIG_TARGET_EXTRA_ASFLAGS) \
  $(CLANG_CONFIG_mips64_EXTRA_ASFLAGS) \
  -target $(CLANG_CONFIG_mips64_TARGET_TRIPLE) \
  -B$(CLANG_CONFIG_mips64_TARGET_TOOLCHAIN_PREFIX)

CLANG_CONFIG_mips64_TARGET_EXTRA_CFLAGS := \
  $(CLANG_CONFIG_EXTRA_CFLAGS) \
  $(CLANG_CONFIG_TARGET_EXTRA_CFLAGS) \
  $(CLANG_CONFIG_mips64_EXTRA_CFLAGS) \
  $(CLANG_CONFIG_mips64_TARGET_EXTRA_ASFLAGS)

CLANG_CONFIG_mips64_TARGET_EXTRA_CONLYFLAGS := \
  $(CLANG_CONFIG_EXTRA_CONLYFLAGS) \
  $(CLANG_CONFIG_TARGET_EXTRA_CONLYFLAGS) \
  $(CLANG_CONFIG_mips64_EXTRA_CONLYFLAGS)

CLANG_CONFIG_mips64_TARGET_EXTRA_CPPFLAGS := \
  $(CLANG_CONFIG_EXTRA_CPPFLAGS) \
  $(CLANG_CONFIG_TARGET_EXTRA_CPPFLAGS) \
  $(CLANG_CONFIG_mips64_EXTRA_CPPFLAGS) \

CLANG_CONFIG_mips64_TARGET_EXTRA_LDFLAGS := \
  $(CLANG_CONFIG_EXTRA_LDFLAGS) \
  $(CLANG_CONFIG_TARGET_EXTRA_LDFLAGS) \
  $(CLANG_CONFIG_mips64_EXTRA_LDFLAGS) \
  -target $(CLANG_CONFIG_mips64_TARGET_TRIPLE) \
  -B$(CLANG_CONFIG_mips64_TARGET_TOOLCHAIN_PREFIX)


define convert-to-clang-flags
  $(strip \
  $(call subst-clang-incompatible-mips64-flags,\
  $(filter-out $(CLANG_CONFIG_mips64_UNKNOWN_CFLAGS),\
  $(1))))
endef

RS_TRIPLE := aarch64-linux-android
RS_TRIPLE_CFLAGS :=
RS_COMPAT_TRIPLE := mips64el-linux-android

TARGET_LIBPROFILE_RT := $(LLVM_RTLIB_PATH)/libclang_rt.profile-mips64el-android.a

# Address sanitizer clang config
$(clang_2nd_arch_prefix)ADDRESS_SANITIZER_RUNTIME_LIBRARY := libclang_rt.asan-mips64-android
$(clang_2nd_arch_prefix)ADDRESS_SANITIZER_LINKER := /system/bin/linker_asan64
