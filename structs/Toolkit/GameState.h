#ifndef S_02001B80_H
#define S_02001B80_H

#include "../inttypes.h"
#include "../OWPlayer.h"

typedef struct {
	/*
	bx index?
	0x00 - ?? Everything goes poof, you only see the background
	0x04 - Default state?
	0x08 - Rendering gets all distorted then CRASH BOOM
	0x0C - Only background
	0x10 - A quick disappearance occurs, then you pop out in a presumable location in the map (ACDC, mayl's house)
	0x14 - Jack in/Jack out animation. Takes you to mayl's house in either cases
	0x18 - Open PET Windows (Distorted pallete)
	0x1C - CRASH. Camera gets distorted?
	0x20 - Rendering distortion
	0x24 - Opens a different kind of folder, teleports to bus station after leaving
	0x28 - CRASH. Camera distortion
	0x2C - CRASH. Camera distortion
	0x30 - CRASH. Same thing. Everything in memory nearby zeros out?
	0x34 - Opens mail box subsystem!
	0x38 - Train Mini game
	*/
	u8 subSystemSelect;         // loc=0x0
	/*
	Seems to only be valid from 0x00 to 0x0E.
	Changing this basically modifies the navi sprie near the PET icon
	*/
	u8 PET_naviSelect;          // loc=0x1
		u8 pad_02[0x01];
	u8 unk_03;                  // loc=0x3
	/*
	TODO: MMBN6F
	This changes both the map name when accessing PET, and when accessing a submenu, you find yourself
	in that map next!!
	>= 0x80 is the internet?! It actually triggers random battles while walking in the real world TOO
	but after coming back you'd be warped to the internet
	It is used as such: v2[MapSelect] + unk_05 where v2 = (int*)&0x803385C
	803385C seems to be pointing to map data to be loaded
	*/
	u8 MapSelect;               // loc=0x4
	/*
	TODO: MMBN6F
	Seems to also be map selection related! values above 0x01 may crash? confirm
	It is used as such: v2[MapSelect] + off_05 where v2 = (int*)&0x803385C
	*/
	u8 MapSubOffset;            // loc=0x5
	/*
	Changes conversations for NPCs... Including L Message!!!
	This is a flag checked by conversation scripts, also.
	*/
	u8 gameProgress;           // loc=0x6
	u8 unk_07;                 // loc=0x7
	/*
	Seems to affect L-messages.
	> 0x03 crashes game when initiating L-msg?
	*/
	u8 unk_08;                  // loc=0x8
	u8 unk_09;                  // loc=0x9
	u8 unk_0A;                  // loc=0xA
		u8 pad_0B[0x01];
	u8 unk_0C;                  // loc=0xC
	/*
	Linked with offset 0x05 somehow? equated to it in sub_8005C04
	*/
	u8 unk_0D;                  // loc=0xD
	u8 unk_0E;                  // loc=0xE
	/*
	Changing this and entering then exiting a subsystem changes background music
	But changing it alone is not enough to trigger music change
	*/
	u8 bgMusicIndicator;        // loc=0xF
	u8 unk_10;                  // loc=0x10
	u8 unk_11;                  // loc=0x11
	u8 unk_12;                  // loc=0x12
		u8 pad_13[0x01];
	u8 unk_14;                  // loc=0x14
	u8 unk_15;                  // loc=0x15
	u8 unk_16;                  // loc=0x16
	u8 unk_17;                  // loc=0x17
	OWPlayer *player;           // loc=0x18
	/*
	This is loaded when a battle is initiated! It's otherwise NULL
	Contains current battle information!!!
	*/
	u32 *currBattleData;        // loc=0x1C
	u32 unk_20;                 // loc=0x20
	/*
	x coordinate of player in some circumstance? They don't update often though
	Seems to update when you open a subsystem, so it might be to reload the player back in when coming back
	*/
	u32 player_x;               // loc=0x24
	/*
	y coordinate of player in some circumstance? Doesn't update continuously though
	Seems to update when you open a subsystem, so it might be to reload the player back in when coming back
	*/
	u32 player_y;               // loc=0x28
	u32 unk_2C;                 // loc=0x2C
	u32 unk_30;                 // loc=0x30
	u32 unk_34;                 // loc=0x34
	u32 unk_38;                 // loc=0x38
	u32 unk_3C;                 // loc=0x3C
	u32 unk_40;                 // loc=0x40
	u32 unk_44;                 // loc=0x44
		u8 pad_48[0x14];
	/*
	Amount of money you have, but changing this triggers an ANTI-CHEATING mechanism
	setting your zennies to zero!
	*/
	u32 protected_zennies;      // loc=0x5C
	/*
	Amount of bugfrags you have, but changing this triggers an ANTI CHEAT MECHANISM!
	It sets them to zero. Boo-hoo.
	*/
	u32 protected_bugFrags;     // loc=0x60
	u32 unk_64;                 // loc=0x64
	u32 unk_68;                 // loc=0x68
	u32 unk_6C;                 // loc=0x6C
	u32 unk_70;                 // loc=0x70
		u8 pad_74[0x0C];
	// size=0x80
}GameState;


// Accesses (TODO: MMBN6F)
/*
	Format: <subroutine_Addr>::<Address of access> <type>(<value>)
	If an access has eben shown before: subAddr, type and register are not shown.
	Writes:
		A: (When interacting with an NPC & object)
		0809EF18::0809EF96 u8(0x11), 0809E880::0809E888 u8(0x11),
		0809F438 u8(0x10)
		B: (Chatbox window going down after (A & C'))
		0809ED10 u8(0x10),
		C: (When interacting with an Object)
		?::0809F454 u8(0x0E), 0809F438::0809F45A u8(0x03),
		08005268::08005274 u8(0xE),
		D: (When JUST Pressing A ('Z'))
		0809EF18::0809EF96, 0809E880::0809E888,
		E: (Accessing main menu through pressing START)
		?::08001082 u32(0x24), ?::08001086 u32(0x28), 08005AF4::08005B66 u8 (0x00),
		F: (Exiting submenu)
		08121504::08121514 u8(0x00), ?::080051BE u8(0x15) u8(0x0E) u8(0x03) u32(0x68)
		?::08005260 u8(0x00), ::08005B66,
		G: (Exiting main menu)
		::080054F2 u8(0x00)
	Reads: (Way too many, only unique acccesses)
		u8(0x04), u8(0x0A), u16(0x04) CONFLICT, u8(0x01), u8(0x00), u8(0x10)
		u32(0x18), u8(0x06), u8(0x0E), u8(0x12), u8(0x11)

Manual Accesses */
/*
	name=s_02001B80, size=0x80
	080050EC::080050F4 u8(0x00), 08035932::08035938 u8(0x06), 0809F99A::0809F9A0 u8(0x10),
	0809DEA0::0809DEC0 u8(0x04), 08034EF0::08034EFC u8(0x0E), 08034F68::08034F74 u32(0x18),
	080350BC::080350C2 u8(0x04), 08034DCA?::08034DCE u8(0x0E), 08035274::0803528A u8(0x04),
	08035054::08035060 u8(0x12), 08005268::08005274 u8(0x0E), 08003BA2::08003BC4 u8(0x0A),
	080010B6?::080010BA u8(0x01), 0809E880::0809E888 u8(0x11), 0809F44E?::0809F454 u8(0x0E),
	0809F9A6::0809F9AC u32(0x18), 0809F098::0809F0CE u8(0x11), 08035694::0803569E u16(0x04),
	0809E6D4::0809E72C u8(0x04), 0800461E::0800464A u8(0x0A), 080048D2::080048FE u8(0x0A),
	080A0E22::080A0E36 u32(0x18), 080339CC::080339DC u8(0x04), 080058D0::080058D6 u8(0x00),
	080058D0::080058FC u32(0x18), 08005A8C::08005A92 u8(0x00), 080ABD30::080ABD3C u8(0x04),
	08005AF4::08005AFA u8(0x00), 0809EA98::0809EAA2 u8(0x04), 0809EBF4::0809EBFE u8(0x04),
	0809EF18::0809EF96 u8(0x11), 0809F438::0809F448 u8(0x10), 080A0058::080A0066 u32(0x18),
	080A00F4::080A0104 u8(0x10), 0804171C::08041726 u8(0x06), 0809ED10::0809ED20 u8(0x10),
	0809F44E?::0809F45A u8(0x03), 08034EF0::08034F06 u8(0x04), 08034EF0::08034F08 u8(0x05),
	0809F600::0809F608 u32(0x18), 0809F600::0809F628 u32(0x18), 0809F7F0?::0809F7F4 u32(0x18),
	080010BE?::080010C2 u8(0x01), 0803CE18::0803CE1E u8(0x04), 0813E18C::0813E1B0 u8(0x04),
	0800107A?::0800107E u32(0x18), 0800107A?::08001082 u32(0x24), 0800107A?::08001086 u32(0x28),
	0800107A?::0800108A u32(0x2C), 0800107A?::0800108E u32(0x30), 08005AF4::08005B66 u8(0x00),
	0812513C::08125158 u8(0x04), 08006F78::08006F7E u32(0x5C), 08006F78::08006F80 u32(0x6C),
	0803D040::0803D04C u32(0x5C), 08006FD0::08006FD6 u32(0x60), 08006FD0::08006FD8 u32(0x70),
	0803D0C8::0803D0D4 u32(0x60), 0812106C::08121072 u8(0x04), 0812106C::0812107C u8(0x05),
	0812149C::081214B6 u16(0x04), 0812149C::081214B8 u16(0x0C), 080014EC::080014F2 u32(0x00),
	080014EC::080014F4 u32(0x00), 08121504::08121514 u8(0x00), 081214E4::081214F0 u8(0x16),
	08000FAC::08000FBC u8(0x04), 08000FAC::08000FBE u8(0x0C), 08000FAC::08000FC4 u8(0x05),
	08000FAC::08000FC6 u8(0x0D), 080355EC::080355F4 u8(0x04), 080355EC::080355F6 u16(0x04),
	08001172?::08001176 u8(0x09), 08005152?::080051BE u8(0x15), 08005152?::080051C0 u8(0x0E),
	08005152?::080051C2 u8(0x03), 08005152?::080051C4 u32(0x68), 08033948::08033958 u8(0x04),
	08033978::08033980 u8(0x04), 08005152?::08005210 u8(0x04), 08005152?::08005212 u8(0x05),
	08005152?::08005218 u8(0x04), 08005152?::0800521A u8(0x05), 08005152?::08005220 u8(0x04),
	08005152?::08005222 u8(0x05), 08036E44::08036E4E u8(0x04), 08036E44::08036E50 u8(0x05),
	08036E44::08036E52 u8(0x07), 08035028::0803502E u32(0x44), 08035028::08035036 u8(0x04),
	0809F59C::0809F5AE u32(0x18), 0809F59C::0809F5B0 u32(0x24), 0809F59C::0809F5B4 u32(0x28),
	0809F59C::0809F5B8 u32(0x2C), 0809F59C::0809F5BC u32(0x30), 08035134::08035144 u8(0x04),
	08035134::08035146 u8(0x05), 08030A60::08030A66 u32(0x20), 0803537C::0803538C u16(0x04),
	080005D4::080005DA u8(0x0F), 08005152?::08005228 u8(0x04), 0804DD14::0804DD1C u8(0x05),
	0804DD14::0804DD26 u8(0x04), 0804DD14::0804DD28 u8(0x05), 0804DD14::0804DD2E u8(0x04),
	0804DD14::0804DD30 u8(0x05), 0804DD14::0804DD36 u32(0x24), 0804DD14::0804DD38 u32(0x28),
	0804DD14::0804DD3A u32(0x2C), 0804DD14::0804DD3C u8(0x04), 0804DD14::0804DD3E u8(0x05),
	0804DD14::0804DD4E u8(0x05), 08040704::0804070C u8(0x04), 08040704::0804070E u8(0x05),
	08040704::08040714 u8(0x08), 08040768::0804076E u8(0x04), 08040768::08040770 u8(0x05),
	08040768::08040772 u8(0x06), 0804079C::080407A2 u8(0x04), 0804079C::080407A4 u8(0x05),
	0804DE08::0804DE0E u8(0x05), 0804DD14::0804DD64 u8(0x05), 0804DD14::0804DD6A u32(0x64),
	08005152?::08005246 u8(0x16), 08005152?::08005248 u8(0x17), 08005152?::08005250 u8(0x16),
	08005152?::08005254 u8(0x17), 08005152?::08005260 u8(0x00), 0809E7A8::0809E7BC u8(0x04),
	0809E7A8::0809E804 u32(0x18), 0809E7A8::0809E848 u8(0x10), 08005462::080054F2 u8(0x00),
	08005462::080054F6 u8(0x0E), 08034CB6::08034CD8 u16(0x04), 08034CB6::08034CDA u8(0x04),
	08034CB6::08034CFA u32(0x18), 08034CB6::08034D2E u32(0x64), 0809F7E6?::0809F7EA u32(0x18),
	0809F6E6?::0809F6EA u32(0x18), 0809F96C::0809F972 u32(0x18), 080005D4::080005E0 u8(0x0F),
	08005F14::08005F20 u8(0x00), 080341B6::080341BE u8(0x04), 0803423C::08034258 u8(0x16),
	08005C04::08005C0C u32(0x20), 08005C04::08005C2C u8(0x04), 08005C04::08005C2E u8(0x05),
	08005C04::08005C4C u8(0x04), 08005C04::08005C62 u32(0x18), 08005C04::08005C6E u32(0x34+0x00),
	08005C04::08005C70 u32(0x34+0x04), 08005C04::08005C72 u32(0x34+0x08), 08005C04::08005C74 u32(0x34+0x0C),
	08005C04::08005C76 u8(0x04), 08005C04::08005C78 u8(0x05), 08005C04::08005C7E u32(0x34+0x10),
	08005C04::08005CB8 u32(0x24), 08005C04::08005CBA u32(0x28), 08005C04::08005CBC u32(0x2C),
	08005C04::08005CBE u32(0x30), 08005C04::08005CC8 u8(0x00), 08005C04::08005CCA u8(0x05),
	08005C04::08005CCC u8(0x0D), 08005C04::08005CCE u8(0x04), 08005C04::08005CD0 u8(0x0C),
	08005C04::08005CD2 u8(0x0C), 08005C04::08005CD4 u8(0x04), 08005C04::08005CD6 u8(0x05),
	08000784::0800079A u8(0x0F), 08000FAC::08000FD0 u32(0x1C), 080355EC::080355FC u32(0x44),
	08070D94::08070DAE u8(0x05), 08030A60::08030A6C u32(0x20), 08070A94::08070A9C u8(0x05),
	08070BE0::08070BE6 u8(0x05), 08070BE0::08070C06 u8(0x05), 08070A94::08070AAA u8(0x04),
	08070A94::08070AAC u8(0x05), 08070A94::08070AB2 u8(0x04), 08070A94::08070AB4 u8(0x05),
	08070A94::08070ABA u32(0x24), 08070A94::08070ABC u32(0x28), 08070A94::08070ABE u32(0x2C),
	08070A94::08070AC0 u8(0x04), 08070A94::08070AC2 u8(0x05), 08070A94::08070AD2 u8(0x05),
	08070E66::08070E6C u8(0x05), 08034FB8::08034FBE u8(0x05), 08034FB8::08034FC0 u8(0x0D),
	080A10FC::080A1104 u8(0x04), 080A10FC::080A1106 u8(0x05), 0809F98A?::0809F98E u32(0x18),
	0809F97A?::0809F97E u32(0x18), 0809DEA0::0809DED0 u8(0x0E), 08035274::08035290 u32(0x18),
	080ABD30::080ABD54 u8(0x05), 080ABE64::080ABE9A u8(0x04), 080ABE64::080ABE9C u8(0x05),
	080ABD30::080ABE0E u32(0x1C), 08005BC8::08005BD4 u32(0x1C), 08005BC8::08005BE0 u32(0x1C),
	08005BC8::08005BE4 u16(0x04), 08005BC8::08005BE6 u16(0x0C), 08005BC8::08005BF2 u8(0x00),
	0800531C::08005342 u8(0x00), 0800531C::08005344 u32(0x1C), 080823C8::080823DA u8(0x04),
	080823C8::080823DC u8(0x05), 0800A032?::0800A038 u8(0x0A), 0800A03C?::0800A040 u8(0x0A),
	0800A024?::0800A02E u8(0x0A), 080031AC::080031D0 u8(0x0A), 08007A44::08007ACC u8(0x0A),
	08007CA0::08007E3A u8(0x0A), 08005360::0800536A u8(0x00), 08034FB8::08034FC6 u8(0x04),
	08034FB8::08034FC8 u8(0x0C), 08035D98::08035DA4 u8(0x16), 08035D98::08035DAC u8(0x17),
	080342EC::08034304 u8(0x16), 080342EC::08034308 u8(0x17), 08005C04::08005CA2 u32(0x34),
	08005C04::08005CA4 u32(0x38), 08005C04::08005CA6 u32(0x3C), 08005C04::08005CA8 u32(0x40),
	08005C04::08005CAA u32(0x44), 080340F6::080340FC u8(0x06), 080A07A8::080A07AE u8(0x06),
	0809EC96::0809ECC2 u8(0x10), 0800825A::080082D2 u8(0x14), 0809F78C?::0809F790 u32(0x18),
	0809B2E4::0809B2EC u32(0x18), 0809F780?::0809F784 u32(0x18),
Accesses */
/*
	{} Crash <> Something interesting happens <doMagic> named function
	{<>} crash or danger state after execution () no observed effect
	080005D4 ()	08000784 {}	08000FAC {} 0800107A? 080010B6?
	080010BE? {} 08001172? () 080014EC 080031AC 08003BA2
	0800461E 080048D2 080050EC 08005152? {<>} 08005268
	0800531C 08005360 08005462 080058D0 08005A8C
	08005AF4 08005BC8 08005C04 08005F14 08006F78
	08006FD0 08007A44 08007CA0 0800825A 0800A024?
	0800A032? {} 0800A03C? {} 08030A60 08033948 08033978
	080339CC 080340F6 080341B6 0803423C 080342EC
	08034CB6 08034DCA? 08034EF0 08034F68 08034FB8
	08035028 08035054 080350BC 08035134 08035274
	0803537C 080355EC 08035694 08035932 08035D98
	08036E44 0803CE18 0803D040 0803D0C8 08040704
	08040768 0804079C 0804171C 0804DD14 0804DE08
	08070A94 {} 08070BE0 <> 08070D94 {} 08070E66 080823C8
	0809B2E4 0809DEA0 {} 0809E6D4 {} 0809E7A8 {} 0809E880 {}
	0809EA98 0809EBF4 0809EC96 0809ED10 0809EF18
	0809F098 0809F438 0809F44E? {} 0809F59C 0809F600
	0809F6E6? {} 0809F780? () 0809F78C? {} 0809F7E6? {} 0809F7F0? {}
	0809F96C 0809F97A? {} 0809F98A? 0809F99A 0809F9A6
	080A0058 <RunChatbox> 080A00F4 080A07A8 080A0E22 080A10FC
	080ABD30 080ABE64 0812106C 0812149C 081214E4
	08121504 0812513C 0813E18C
Detected Access Functions */

#endif /* S_02001B80_H */
