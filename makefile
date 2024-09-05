CC = clang
CFLAGS = -I/usr/include/GNUstep
LDFLAGS = -lobjc -lgnustep-base

your_executable: main.m
    $(CC) $(CFLAGS) -o your_executable main.m $(LDFLAGS)