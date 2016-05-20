
include $(BUILD_SYSTEM)/clang/x86_64.mk

CLANG_CONFIG_x86_64_TARGET_TRIPLE := x86_64-linux-android
CLANG_CONFIG_x86_64_TARGET_TOOLCHAIN_PREFIX := \
  $(TARGET_TOOLCHAIN_ROOT)/$(CLANG_CONFIG_x86_64_TARGET_TRIPLE)/bin

CLANG_CONFIG_x86_64_TARGET_EXTRA_ASFLAGS := \
  $(CLANG_CONFIG_EXTRA_ASFLAGS) \
  $(CLANG_CONFIG_TARGET_EXTRA_ASFLAGS) \
  $(CLANG_CONFIG_x86_64_EXTRA_ASFLAGS) \
  -target $(CLANG_CONFIG_x86_64_TARGET_TRIPLE) \
  -B$(CLANG_CONFIG_x86_64_TARGET_TOOLCHAIN_PREFIX)

CLANG_CONFIG_x86_64_TARGET_EXTRA_CFLAGS := \
  $(CLANG_CONFIG_EXTRA_CFLAGS) \
  $(CLANG_CONFIG_TARGET_EXTRA_CFLAGS) \
  $(CLANG_CONFIG_x86_64_EXTRA_CFLAGS) \
  $(CLANG_CONFIG_x86_64_TARGET_EXTRA_ASFLAGS)

CLANG_CONFIG_x86_64_TARGET_EXTRA_CONLYFLAGS := \
  $(CLANG_CONFIG_EXTRA_CONLYFLAGS) \
  $(CLANG_CONFIG_TARGET_EXTRA_CONLYFLAGS) \
  $(CLANG_CONFIG_x86_64_EXTRA_CONLYFLAGS)

CLANG_CONFIG_x86_64_TARGET_EXTRA_CPPFLAGS := \
  $(CLANG_CONFIG_EXTRA_CPPFLAGS) \
  $(CLANG_CONFIG_TARGET_EXTRA_CPPFLAGS) \
  $(CLANG_CONFIG_x86_64_EXTRA_CPPFLAGS) \

CLANG_CONFIG_x86_64_TARGET_EXTRA_LDFLAGS := \
  $(CLANG_CONFIG_EXTRA_LDFLAGS) \
  $(CLANG_CONFIG_TARGET_EXTRA_LDFLAGS) \
  $(CLANG_CONFIG_x86_64_EXTRA_LDFLAGS) \
  -target $(CLANG_CONFIG_x86_64_TARGET_TRIPLE) \
  -B$(CLANG_CONFIG_x86_64_TARGET_TOOLCHAIN_PREFIX)


define convert-to-clang-flags
  $(strip \
  $(call subst-clang-incompatible-x86_64-flags,\
  $(filter-out $(CLANG_CONFIG_x86_64_UNKNOWN_CFLAGS),\
  $(1))))
endef

RS_TRIPLE := aarch64-linux-android
RS_TRIPLE_CFLAGS := -D__x86_64__
RS_COMPAT_TRIPLE := x86_64-linux-android

TARGET_LIBPROFILE_RT := $(LLVM_RTLIB_PATH)/libclang_rt.profile-x86_64-android.a
