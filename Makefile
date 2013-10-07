
all::

CFLAGS = -I.
LDFLAGS = -lX11 -lEGL -lGLESv2

-include Makefile.common

TEST.SRCS := src/main.c
TEST.OBJS := $(TEST.SRCS:.c=.o)
TEST.CFLAGS := -I. -Llib -lcommon $(COMMON.STATICS)
TEST.BIN := bin/test

$(TEST.BIN): $(TEST.OBJS) $(COMMON.STATICS)
	@mkdir -p $(dir $@)
	$(CC) -o $@ $< $(TEST.CFLAGS) $(CFLAGS) $(LDFLAGS)

all:: $(TEST.BIN)

clean::
	$(RM) $(TEST.OBJS) $(TEST.BIN)

.PHONY: all clean
