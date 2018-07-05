#ifndef S_0200A480_H
#define S_0200A480_H

#include "../inttypes.h"


typedef struct{
	/*
	jump table: 0800034C subsystem_jt
	- Jumptable index! Changing
	- its value while not in the overworld may yield different results, such as the window persisting (doesn't go back to OW)
	- When equal to these values:
			- =0x00: Everything disappears, only background left?
			- =0x04: Default. Nothing?
			- =0x08: JACK-IN animation, but does not actually jack in
			- =0x0C: CREDITS!
			- =0x10: Game reset??
			- =0x14: Sends us to the GAMEOVER Screen!
			- =0x18: Opens a glitchy text prompt window
			- =0x1C: Communication error. Transmission failed.
			- =0x20: Communication error.
			- =0x24: Crashes game. E55EC002 gets spammed in memory lots too
			- =0x28: Opens folder. When exiting though, Camera may not be set up correctly?
			- =0x2C: Creepy graphics glitch. WARNING.
			- =0x30: Failed to initialize wireless adapter. < Only the first time. Somehow goes to entrance of map
			- =0x34: Opens folder too, but not the same usual menu. You can't select subfolders
			- =0x38: MORE CREDITS!
			- =0x3C: Just freezes... Booo!!!
			- =0x40: Just freezes... :'(
			- =0x44: Just freezes... D:
			- =0x48: Oh you wanted to check the mail? Sure! But when you come back, your camera will be all messed up.
			- =0x4C: Please enter folder name! Actually changes your first folder! Same camera business.
			- =0x50: Launches Train mini-game!
			- =0x54-0x6C: Brr! Freezing!
			...
	*/
	u8 gameSubsysSel;     // loc=0x0
		u8 pad_1[0x3]; // loc=0x1
	u8 countdownTimer;     // loc=0x4
		u8 pad_5[0xB]; // loc=0x5
	u32 unk_10;    // loc=0x10
	u8 unk_14;     // loc=0x14
		u8 pad_15[0x3]; // loc=0x15
	u32 unk_18;    // loc=0x18
		u8 pad_1C[0x20]; // loc=0x1C
	// size=0x3C
}s_0200A480;

// Function Accesses (TODO: MMBN6F)
/*
    080002B4? 08000454 080007BE 08000808 080053E4
    08005524 080056B8 0803423C 080342EC 08121504
*/

// Accesses (TODO: MMBN6F)
/*
    name=s_0200A480, size=0x3C
    080007BE::080007C2 u32(0x10+0x00), 080007BE::080007F2 u32(0x10+0x00), 080007BE::080007F4 u32(0x10+0x08),
    080002B4?::08000314 u8(0x00), 08000454::08000466 u8(0x00), 08000454::08000476 u8(0x04+0x00),
    08000454::080004A0 u8(0x04+0x00), 08000808::0800080C u32(0x10+0x00), 08000808::08000816 u32(0x10+0x00),
    080007BE::080007C8 u8(0x10+0x04), 080007BE::080007D2 u8(0x10+0x04), 080007BE::080007D6 u32(0x10+0x08),
    08005524::08005556 u8(0x00), 08121504::0812150C u8(0x00), 080053E4::08005430 u8(0x00),
    0803423C::08034244 u8(0x00), 080342EC::080342F4 u8(0x00), 080056B8::08005728 u8(0x00),

Accesses */

#endif /* S_0200A480_H */
