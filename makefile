# CC = gcc
# AR=ar
# CFLAGS = -Wall
# LFLAGS= -shared
# SFLAGS=rcu
# FPIC=-fPIC
# RANLIB=ranlib


# Loop=advancedClassificationLoop
# Rec=advancedClassificationRecursion
# MAIN = main
# HTYPE = NumClass.h
# BASIC = basicClassification


# 1LIB_LOOP = libclassloops.a
# 2LIB_LOOP = libclassloops.so
# 1LIB_REC = libclassres.a
# 2LIB_REC = libclassres.so

# .PHONY: all clean loops recursives recursived loopd

# all:loops loopd recursives recursived mains maindrec maindloop

# loops: $(1LIB_LOOP)
#      $(1LIB_LOOP): $(Loop).o $(BASIC).o
#       $(AR)$(SFLAGS) $@ $^
#       $(RANLIB) $@

# recursives:$(1LIB_REC)
#      $(1LIB_LOOP): $(Rec).o $(BASIC).o
#       $(AR) $(SFLAGS) $@ $^
#      $(RANLIB) $@
 
# recursived: $(2LIB_REC)
#      $(2LIB_REC): $(Rec).o $(BASIC).o
#      $(CC) $(LFLAGS) $(CFLAGS) $^ -o$@

# loopd: $(2LIB_LOOP)
#      $(2LIB_LOOP): $(Loop).o $(BASIC).o
#      $(CC) $(LFLAGS) $(CFLAGS) $^ -o$@

# mains: $(MAIN).o $(1LIB_REC)
#      $(CC) $(CFLAGS) $<./$(1LIB_REC) -o $@

# maindloop: $(MAIN).o $(2LIB_LOOP)
#      $(CC) $(CFLAGS) $< .-$(2LIB_LOOP) -o $@

# maindrec: $(MAIN).O $(2LIB_REC)
#      $(CC) $(CFLAGS) $< .-$(2LIB_REC) -o $@

# clean:
#      rm -f *.o *.a *.so mains maindrec maindloop

CC = gcc
AR = ar

# Flags setup
CFLAGS = -Wall -g
LFLAGS = -shared
SFLAGS = rcs
FP = -fPIC
MATHLIB = -lm

# File names
MAIN = main.c
HEADER = NumClass.h
LIBB = basicClassification.c
LIBLOOP = advancedClassificationLoop.c
LIBREC = advancedClassificationRecursion.c
LIBLS = libclassloops.a
LIBRS = libclassrec.a
LIBLD = libclassloops.so
LIBRD = libclassrec.so

# Phony tag for non-targeted commands
.PHONY: all clean loops recursives recursived loopd

# Build everything 
all: mains maindloop maindrec loops recursives recursived loopd

# Marcos to build libraries
loops: $(LIBLS)

recursives: $(LIBRS)

recursived: $(LIBRD)

loopd: $(LIBLD)

# Build main programs

# The main program with static libary of recursive implametation
mains: $(MAIN:.c=.o) $(LIBRS)
	$(CC) $(CFLAGS) $< ./$(LIBRS) $(MATHLIB) -o $@

# The main program with dynamic libary of loops implametation
maindloop: $(MAIN:.c=.o) $(LIBLD)
	$(CC) $(CFLAGS) $< ./$(LIBLD) $(MATHLIB) -o $@

# The main program with dynamic libary of recursive implametation
maindrec: $(MAIN:.c=.o) $(LIBRD)
	$(CC) $(CFLAGS) $< ./$(LIBRD) $(MATHLIB) -o $@

# Compile the main program to an object file
$(MAIN:.c=.o): $(MAIN) $(HEADER)
	$(CC) $(CFLAGS) -c $^

# Building all necessary libraries
$(LIBRD): $(LIBREC:.c=.o) $(LIBB:.c=.o)
	$(CC) $(LFLAGS) $(CFLAGS) $^ -o $@

$(LIBLD): $(LIBLOOP:.c=.o) $(LIBB:.c=.o)
	$(CC) $(LFLAGS) $(CFLAGS) $^ -o $@

$(LIBLS): $(LIBLOOP:.c=.o) $(LIBB:.c=.o)
	$(AR) $(SFLAGS) $@ $^

$(LIBRS): $(LIBREC:.c=.o) $(LIBB:.c=.o)
	$(AR) $(SFLAGS) $@ $^

$(LIBLOOP:.c=.o): $(LIBLOOP) $(HEADER)
	$(CC) $(CFLAGS) -c $^ $(FP)

$(LIBREC:.c=.o): $(LIBREC) $(HEADER)
	$(CC) $(CFLAGS) -c $^ $(FP)

$(LIBB:.c=.o): $(LIBB) $(HEADER)
	$(CC) $(CFLAGS) -c $^ $(FP)

# Clean command to cleanup all the compiled files (*.o, *.a, *.so, *.gch, mains, maindloop and maindrec)
clean:
	rm -f mains maindloop maindrec *.o *.a *.so *.gch


