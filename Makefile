
all::

-include Makefile.common

TEST.SRCS := src/main.cc
TEST.OBJS := $(TEST.SRCS:.cc=.o)
TEST.CFLAGS := -I. -Llib -lcommon $(COMMON.STATICS)
TEST.BIN := bin/test

$(TEST.BIN): $(TEST.OBJS) $(COMMON.STATICS)
	@mkdir -p $(dir $@)
	$(CXX) $(TEST.CFLAGS) $(CFLAGS) -o $@ $<

all:: $(TEST.BIN)

clean::
	$(RM) $(TEST.OBJS) $(TEST.BIN)

.PHONY: all clean
