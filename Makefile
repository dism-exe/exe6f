# binary tools used in build
# (devkitpro/devkitARM/bin should be in path)
MAKE = make
CC = arm-none-eabi-gcc
LD = arm-none-eabi-ld
OBJCOPY = arm-none-eabi-objcopy
SHA1SUM = sha1sum

# project paths
SRCDIR = asm
INC = include
BIN = bin
CONST = constants
EXTERNS = externs
OBJ =

# build flags
COMPLIANCE_FLAGS =
WFLAGS =
ARCH = -march=armv4t -mtune=arm7tdmi -mabi=aapcs -mthumb -mthumb-interwork
CDEBUG =
CFLAGS = $(ARCH) $(WFLAGS) $(COMPLIANCE_FLAGS) $(CDEBUG)
LDFLAGS = -g -Map exe6f.map
LIB =
ROM_OBJ_FLAGS = -O elf32-littlearm -B arm --rename-section .data=.f__rom --set-section-flags .f__rom="r,c,a"

# project files
SFILES = $(SRCDIR)/_link.s #$(wildcard $(SRCDIR)/*.s)
OFILES = $(addprefix $(OBJ),$(notdir $(SFILES:.s=.o)))
ROM = exe6f

all:

rom: $(ROM)
	@# TODO: this tab is needed or ROM is executed weirdly?? oops!

$(ROM):
	$(OBJCOPY) -I binary $(ROM_OBJ_FLAGS) $(BIN)/$(ROM).bin rom.o
	$(CC) $(CFLAGS) -c $(SFILES) -I$(INC)
	$(LD) $(LDFLAGS) -o $(ROM).elf -T ld_script.x $(OFILES) rom.o $(LIB)
	$(OBJCOPY) --set-section-flags .f__rom="r,c,a" $(ROM).elf
	$(OBJCOPY) -O binary $(ROM).elf $(ROM).gba

checksum:
	$(SHA1SUM) -b $(BIN)/$(ROM).bin $(ROM).gba

clean:
	rm -f *.preout
	rm -f *.o
	rm -f *.d
	rm -f *.map
	rm -f *.elf

# Rule for how to translate a single c file into an object file.
%.o : %.c
	echo compiling $<
	echo $(CC) $(CFLAGS) -c $<
	$(CC) $(CFLAGS) -E $< > $<.preout
	$(CC) $(CFLAGS) -S $<
	$(CC) $(CFLAGS) -c $<
	echo done compiling $<

# Rule for how to generate the dependencies for the given files. -M gcc option generates dependencies.
%.d : %.c
	@set -e; rm -f $@; \
	$(CC) $(COMPLIANCE_FLAGS ) -M $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	rm -f $@.$$$$
