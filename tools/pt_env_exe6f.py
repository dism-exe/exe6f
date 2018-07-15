# execute this file after pt.py in IDA to define the environmental variables
# for pt there.

# set up a new environment
pt.clrenv()

## ROM Paths
pt.env(ROMPath= '')

## search utils
pt.env(compareBinPath= '')


## disassembly utils
# TODO set this to your project path relative to your analysis idb path
# [progress ---------------------------]
# compile   | 0.00% (0x00/0x8000000)
# checksum  | 0.00% (0x00/0x8000000)
pt.env(dismProjPath= 'GameDev/Disassembly/exe6f/')
pt.env(asmPath= 'asm/')
pt.env(binPath= 'bin/')
pt.env(incPath= 'inc/')
pt.env(externsPath= 'externs/')
pt.env(gameFiles={
    'start':    (0x08000000, 0x080002BC),
    'main':     (0x080002BC, 0x080005AC),
})

print("Environment set!")
