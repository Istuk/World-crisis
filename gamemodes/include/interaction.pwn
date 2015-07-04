public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}
public OnPlayerClickTextDraw( playerid, Text:clickedid ) {
	if (clickedid == Text:INVALID_TEXT_DRAW) {
		if (IsSelecting[ playerid ] == 1) {
			SendClientMessage( playerid, -1, "{D49B31}Server info{FFFFFF}: use {D4B375}/q{FFFFFF} to exit SA-MP");
			SelectTextDraw( playerid, 0xD49B31FF );
		}
	}
	if (clickedid == tdLogButton) {
		Dialog_Show( playerid, dgLogin, DIALOG_STYLE_PASSWORD, "{D49B31}Login",
		"{FFFFFF}Please enter your password:",
		"{D49B31}Login", "Cancel");
	}
	if (clickedid == tdSignButton) {
		Dialog_Show( playerid, dgRules, DIALOG_STYLE_MSGBOX, "{D49B31}Choose password",
		"{D49B31}You're not allowed{FFFFFF}:\n\
 - to cheat or hack\n\
 - to use mods to your advantage (handling mods etc.)\n\
 - to abuse glitches\n\
 - to pause during combat\n\
 - to flood the chat window\n\
 - to spam (e.g. advertising of servers and sites)\n\
 - to insult other players.\n\
 - to have multiple accounts\n\
 - to spawn kill\n\
\n\
\n\
If you see anyone violating the rules use {D49B31}/report{D4B375} [ID] [Message]{FFFFFF}",
		"{D49B31}Accept", "Cancel");
	}
	
	if (clickedid == tdNextCharacter) {
		if (SelectingCharacter[ playerid ] == 19) {
			SelectingCharacter[ playerid ] = 0;
			PlayerTextDrawSetPreviewModel( playerid, ptdCharacter[ playerid ], Characters[ SelectingCharacter[ playerid ] ]);
			PlayerTextDrawSetString( playerid, ptdCharacterDesc[ playerid ], CharDesc[ SelectingCharacter[ playerid ] ]);
			PlayerTextDrawShow( playerid, ptdCharacter[ playerid ] );
		}else{
			SelectingCharacter[ playerid ]++;
			PlayerTextDrawSetPreviewModel( playerid, ptdCharacter[ playerid ], Characters[ SelectingCharacter[ playerid ] ]);
			PlayerTextDrawSetString( playerid, ptdCharacterDesc[ playerid ], CharDesc[ SelectingCharacter[ playerid ] ]);
			PlayerTextDrawShow( playerid, ptdCharacter[ playerid ] );
		}
	}
	if (clickedid == tdPrevCharacter) {
		if (SelectingCharacter[ playerid ] == 0) {
			SelectingCharacter[ playerid ] = 19;
			PlayerTextDrawSetPreviewModel( playerid, ptdCharacter[ playerid ], Characters[ SelectingCharacter[ playerid ] ]);
			PlayerTextDrawSetString( playerid, ptdCharacterDesc[ playerid ], CharDesc[ SelectingCharacter[ playerid ] ]);
			PlayerTextDrawShow( playerid, ptdCharacter[ playerid ] );
		}else{
			SelectingCharacter[ playerid ]--;
			PlayerTextDrawSetPreviewModel( playerid, ptdCharacter[ playerid ], Characters[ SelectingCharacter[ playerid ] ]);
			PlayerTextDrawSetString( playerid, ptdCharacterDesc[ playerid ], CharDesc[ SelectingCharacter[ playerid ] ]);
			PlayerTextDrawShow( playerid, ptdCharacter[ playerid ] );
		}
	}
	if (clickedid == tdUseCharacter) {
		SpawnPlayer( playerid );
		new rand = random(4);
		TextDrawHideForPlayer( playerid, tdPrevCharacter );
		TextDrawHideForPlayer( playerid, tdNextCharacter );
		TextDrawHideForPlayer( playerid, tdUseCharacter );
		TextDrawHideForPlayer( playerid, tdCCinfo );
		TextDrawHideForPlayer( playerid, tdServerName );
		TextDrawHideForPlayer( playerid, tdWelcomeBox );
		{
			TextDrawShowForPlayer( playerid, tdSname );
			TextDrawShowForPlayer( playerid, tdPSbox );
			TextDrawShowForPlayer( playerid, tdTime );
			PlayerTextDrawShow( playerid, ptdPSbox[ playerid ] );
			PlayerTextDrawShow( playerid, ptdLevel[ playerid ] );
		}
		PlayerTextDrawHide( playerid, ptdCharacter[ playerid ] );
		PlayerTextDrawHide( playerid, ptdCharacterDesc[ playerid ] );
		SetSpawnInfo( playerid, 0, Characters[ SelectingCharacter[ playerid ] ], RndSpawn[rand][0], RndSpawn[rand][1], RndSpawn[rand][2], 0.00, 0, 0, 0, 0, 0, 0 );
		TogglePlayerSpectating( playerid, 0 );
		for (new i = 0; i <= 10; i++ ) {
			SetPlayerSkillLevel( playerid, i, 0);
		}
		switch (SelectingCharacter[ playerid ]) {
			case 0: {
				GivePlayerMoney( playerid, 3500 );
				
				Player[ playerid ][ xp ] = 0;
				Player[ playerid ][ level ] = 1;
				Player[ playerid ][ crafting ] = 2;
				Player[ playerid ][ mechanic ] = 2;
				Player[ playerid ][ thief ] = 1;
				Player[ playerid ][ gas ] = 0;
				Player[ playerid ][ mats ] = 0;
				Player[ playerid ][ food ] = 20;
				Player[ playerid ][ advradio ] = 0;
				Player[ playerid ][ skillpts ] = 0;
			}
			case 1: {
				GivePlayerMoney( playerid, 2000 );
				GivePlayerWeapon( playerid, 4, 1);
				
				Player[ playerid ][ xp ] = 0;
				Player[ playerid ][ level ] = 1;
				Player[ playerid ][ crafting ] = 1;
				Player[ playerid ][ mechanic ] = 2;
				Player[ playerid ][ thief ] = 2;
				Player[ playerid ][ gas ] = 0;
				Player[ playerid ][ mats ] = 0;
				Player[ playerid ][ food ] = 0;
				Player[ playerid ][ advradio ] = 0;
				Player[ playerid ][ skillpts ] = 0;
			}
			case 2: {
				GivePlayerMoney( playerid, 2000 );
				GivePlayerWeapon( playerid, 5, 1);
				
				Player[ playerid ][ xp ] = 0;
				Player[ playerid ][ level ] = 1;
				Player[ playerid ][ crafting ] = 3;
				Player[ playerid ][ mechanic ] = 1;
				Player[ playerid ][ thief ] = 1;
				Player[ playerid ][ gas ] = 0;
				Player[ playerid ][ mats ] = 0;
				Player[ playerid ][ food ] = 0;
				Player[ playerid ][ advradio ] = 0;
				Player[ playerid ][ skillpts ] = 0;
			}
			case 3: {
				GivePlayerMoney( playerid, 500 );
				GivePlayerWeapon( playerid, 4, 1);
				
				Player[ playerid ][ xp ] = 0;
				Player[ playerid ][ level ] = 1;
				Player[ playerid ][ crafting ] = 1;
				Player[ playerid ][ mechanic ] = 3;
				Player[ playerid ][ thief ] = 1;
				Player[ playerid ][ gas ] = 30;
				Player[ playerid ][ mats ] = 0;
				Player[ playerid ][ food ] = 0;
				Player[ playerid ][ advradio ] = 0;
				Player[ playerid ][ skillpts ] = 0;
			}
			case 4: {
				Player[ playerid ][ xp ] = 0;
				Player[ playerid ][ level ] = 1;
				Player[ playerid ][ crafting ] = 0;
				Player[ playerid ][ mechanic ] = 0;
				Player[ playerid ][ thief ] = 5;
				Player[ playerid ][ gas ] = 200;
				Player[ playerid ][ mats ] = 0;
				Player[ playerid ][ food ] = 0;
				Player[ playerid ][ advradio ] = 0;
				Player[ playerid ][ skillpts ] = 0;
			}
			case 5: {
				GivePlayerMoney( playerid, 8000 );
				
				Player[ playerid ][ xp ] = 0;
				Player[ playerid ][ level ] = 1;
				Player[ playerid ][ crafting ] = 1;
				Player[ playerid ][ mechanic ] = 1;
				Player[ playerid ][ thief ] = 1;
				Player[ playerid ][ gas ] = 0;
				Player[ playerid ][ mats ] = 0;
				Player[ playerid ][ food ] = 0;
				Player[ playerid ][ advradio ] = 0;
				Player[ playerid ][ skillpts ] = 0;
			}
			case 6: {
				GivePlayerMoney( playerid, 500 );
				GivePlayerWeapon( playerid, 22, 100);
				
				Player[ playerid ][ xp ] = 0;
				Player[ playerid ][ level ] = 1;
				Player[ playerid ][ crafting ] = 1;
				Player[ playerid ][ mechanic ] = 2;
				Player[ playerid ][ thief ] = 1;
				Player[ playerid ][ gas ] = 0;
				Player[ playerid ][ mats ] = 0;
				Player[ playerid ][ food ] = 0;
				Player[ playerid ][ advradio ] = 0;
				Player[ playerid ][ skillpts ] = 0;
			}
			case 7: {
				GivePlayerMoney( playerid, 50 );
				GivePlayerWeapon( playerid, 33, 40);
				
				Player[ playerid ][ xp ] = 0;
				Player[ playerid ][ level ] = 1;
				Player[ playerid ][ crafting ] = 4;
				Player[ playerid ][ mechanic ] = 2;
				Player[ playerid ][ thief ] = 1;
				Player[ playerid ][ gas ] = 0;
				Player[ playerid ][ mats ] = 0;
				Player[ playerid ][ food ] = 0;
				Player[ playerid ][ advradio ] = 0;
				Player[ playerid ][ skillpts ] = 0;
			}
			case 8: {
				GivePlayerWeapon( playerid, 6, 1);
				
				Player[ playerid ][ xp ] = 0;
				Player[ playerid ][ level ] = 1;
				Player[ playerid ][ crafting ] = 1;
				Player[ playerid ][ mechanic ] = 1;
				Player[ playerid ][ thief ] = 10;
				Player[ playerid ][ gas ] = 0;
				Player[ playerid ][ mats ] = 0;
				Player[ playerid ][ food ] = 0;
				Player[ playerid ][ advradio ] = 0;
				Player[ playerid ][ skillpts ] = 0;
			}
			case 9: {
				GivePlayerMoney( playerid, 1500 );
				
				Player[ playerid ][ xp ] = 0;
				Player[ playerid ][ level ] = 1;
				Player[ playerid ][ crafting ] = 1;
				Player[ playerid ][ mechanic ] = 1;
				Player[ playerid ][ thief ] = 1;
				Player[ playerid ][ gas ] = 100;
				Player[ playerid ][ mats ] = 0;
				Player[ playerid ][ food ] = 0;
				Player[ playerid ][ advradio ] = 0;
				Player[ playerid ][ skillpts ] = 0;
				
			}
			case 10: {
				GivePlayerMoney( playerid, 250 );
				GivePlayerWeapon( playerid, 25, 40);
				
				Player[ playerid ][ xp ] = 0;
				Player[ playerid ][ level ] = 1;
				Player[ playerid ][ crafting ] = 2;
				Player[ playerid ][ mechanic ] = 2;
				Player[ playerid ][ thief ] = 1;
				Player[ playerid ][ gas ] = 0;
				Player[ playerid ][ mats ] = 0;
				Player[ playerid ][ food ] = 0;
				Player[ playerid ][ advradio ] = 0;
				Player[ playerid ][ skillpts ] = 0;
				
			}
			case 11: {
				GivePlayerMoney( playerid, 1500 );
				GivePlayerWeapon( playerid, 22, 100);
				
				Player[ playerid ][ xp ] = 0;
				Player[ playerid ][ level ] = 1;
				Player[ playerid ][ crafting ] = 1;
				Player[ playerid ][ mechanic ] = 1;
				Player[ playerid ][ thief ] = 2;
				Player[ playerid ][ gas ] = 0;
				Player[ playerid ][ mats ] = 0;
				Player[ playerid ][ food ] = 0;
				Player[ playerid ][ advradio ] = 0;
				Player[ playerid ][ skillpts ] = 0;
			}
			case 12: {
				GivePlayerMoney( playerid, 3500 );
				
				Player[ playerid ][ xp ] = 0;
				Player[ playerid ][ level ] = 1;
				Player[ playerid ][ crafting ] = 1;
				Player[ playerid ][ mechanic ] = 1;
				Player[ playerid ][ thief ] = 2;
				Player[ playerid ][ gas ] = 30;
				Player[ playerid ][ mats ] = 0;
				Player[ playerid ][ food ] = 0;
				Player[ playerid ][ advradio ] = 0;
				Player[ playerid ][ skillpts ] = 0;
			}
			case 13: {
				GivePlayerMoney( playerid, 15 );
				
				Player[ playerid ][ xp ] = 0;
				Player[ playerid ][ level ] = 1;
				Player[ playerid ][ crafting ] = 4;
				Player[ playerid ][ mechanic ] = 2;
				Player[ playerid ][ thief ] = 1;
				Player[ playerid ][ gas ] = 0;
				Player[ playerid ][ mats ] = 300;
				Player[ playerid ][ food ] = 0;
				Player[ playerid ][ advradio ] = 0;
				Player[ playerid ][ skillpts ] = 0;
			}
			case 14: {
				GivePlayerMoney( playerid, 3500 );
				
				Player[ playerid ][ xp ] = 0;
				Player[ playerid ][ level ] = 1;
				Player[ playerid ][ crafting ] = 1;
				Player[ playerid ][ mechanic ] = 1;
				Player[ playerid ][ thief ] = 1;
				Player[ playerid ][ gas ] = 0;
				Player[ playerid ][ mats ] = 100;
				Player[ playerid ][ food ] = 0;
				Player[ playerid ][ advradio ] = 0;
				Player[ playerid ][ skillpts ] = 0;
			}
			case 15: {
				GivePlayerMoney( playerid, 3000 );
				GivePlayerWeapon( playerid, 34, 25);
				
				Player[ playerid ][ xp ] = 0;
				Player[ playerid ][ level ] = 1;
				Player[ playerid ][ crafting ] = 1;
				Player[ playerid ][ mechanic ] = 1;
				Player[ playerid ][ thief ] = 1;
				Player[ playerid ][ gas ] = 0;
				Player[ playerid ][ mats ] = 0;
				Player[ playerid ][ food ] = 0;
				Player[ playerid ][ advradio ] = 0;
				Player[ playerid ][ skillpts ] = 0;
			}
			case 16: {
				GivePlayerMoney( playerid, 1500 );
				GivePlayerWeapon( playerid, 24, 40);
				
				Player[ playerid ][ xp ] = 0;
				Player[ playerid ][ level ] = 1;
				Player[ playerid ][ crafting ] = 1;
				Player[ playerid ][ mechanic ] = 2;
				Player[ playerid ][ thief ] = 1;
				Player[ playerid ][ gas ] = 0;
				Player[ playerid ][ mats ] = 0;
				Player[ playerid ][ food ] = 0;
				Player[ playerid ][ advradio ] = 0;
				Player[ playerid ][ skillpts ] = 0;
			}
			case 17: {
				GivePlayerMoney( playerid, 200 );
				
				Player[ playerid ][ xp ] = 0;
				Player[ playerid ][ level ] = 1;
				Player[ playerid ][ crafting ] = 2;
				Player[ playerid ][ mechanic ] = 5;
				Player[ playerid ][ thief ] = 1;
				Player[ playerid ][ gas ] = 0;
				Player[ playerid ][ mats ] = 0;
				Player[ playerid ][ food ] = 0;
				Player[ playerid ][ advradio ] = 0;
				Player[ playerid ][ skillpts ] = 0;
			}
			case 18: {
				GivePlayerMoney( playerid, 40 );
				GivePlayerWeapon( playerid, 22, 100);
				
				Player[ playerid ][ xp ] = 0;
				Player[ playerid ][ level ] = 1;
				Player[ playerid ][ crafting ] = 2;
				Player[ playerid ][ mechanic ] = 1;
				Player[ playerid ][ thief ] = 2;
				Player[ playerid ][ gas ] = 0;
				Player[ playerid ][ mats ] = 250;
				Player[ playerid ][ food ] = 0;
				Player[ playerid ][ advradio ] = 0;
				Player[ playerid ][ skillpts ] = 0;
			}
			case 19: {
				GivePlayerMoney( playerid, 500 );
				GivePlayerWeapon( playerid, 34, 25);
				
				Player[ playerid ][ xp ] = 0;
				Player[ playerid ][ level ] = 1;
				Player[ playerid ][ crafting ] = 1;
				Player[ playerid ][ mechanic ] = 1;
				Player[ playerid ][ thief ] = 2;
				Player[ playerid ][ gas ] = 0;
				Player[ playerid ][ mats ] = 0;
				Player[ playerid ][ food ] = 0;
				Player[ playerid ][ advradio ] = 0;
				Player[ playerid ][ skillpts ] = 0;
			}
		}
		new tUserName[ MAX_PLAYER_NAME ];
		GetPlayerName( playerid, tUserName, MAX_PLAYER_NAME );
		format(Query, 512, "INSERT INTO Users (username, password, char) VALUES ('%s','%s',%i)", tUserName, NewUserPassword[ playerid ], SelectingCharacter[ playerid ] );
		db_query( SaveFiles, Query );
		format(Query, 512, "INSERT INTO Weapons (username) VALUES ('%s')", tUserName);
		db_query( SaveFiles, Query );
		Dialog_Show( playerid, HelpOne, DIALOG_STYLE_MSGBOX, "{D49B31}Help 1/3",
"{D49B31}/wt {D4B375}[Message] {FFFFFF}Say something over walky talky\n\n\
{D49B31}/wtf {D4B375}[Frequency] {FFFFFF}Set frequency at WalkyTalky (30-300)\n\n\
{D49B31}/radio {D4B375}[Message] {FFFFFF}Send a message to everyone in the area\n\n\
{D49B31}/radioon {FFFFFF}allows people around to send you messages\n\n\
{D49B31}/radiooff {FFFFFF}disables people around to send you messages\n\n\
{D49B31}/l {D4B375}[Message] {FFFFFF}Say something loud\n\n\
{D49B31}/engine {FFFFFF}Run motor vehicles\n\n\
{D49B31}/lock {D4B375}[Lock code] {FFFFFF}Lock vehicle\n\n\
{D49B31}/unlock {D4B375}[Lock code] {FFFFFF}Unlock vehicle\n\n\
{D49B31}/craft {FFFFFF} Open craft menu\n\n\
{D49B31}/fixcar {FFFFFF} Fix visible damage on the car\n\n\
{D49B31}/fixengine {FFFFFF} Fix the engine on the car\n\n\
{D49B31}/fuelcar {FFFFFF} Fuel car with gas that you have on you\n\n\
{D49B31}/eat {FFFFFF} Eat food that you have on you",
		"{D49B31}Next", "");
	}
	return 1;
}
public OnPlayerExitedMenu(playerid)
{
	return 1;
}

Dialog:dgRules(playerid, response, listitem, inputtext[]) {
	if (response == 0) {
		TextDrawHideForPlayer( playerid, tdSignButton );
		return 1;
	}
	Dialog_Show( playerid, dgRegPassword, DIALOG_STYLE_PASSWORD, "{D49B31}Choose password",
		"{FFFFFF}Your password must be at least 6 characters long,\nand not longer then 24 characters",
		"{D49B31}Next", "Cancel");
	return 1;
}

Dialog:dgRegPassword(playerid, response, listitem, inputtext[]) {
	if (response == 0) {
		return 1;
	}
	if (strlen(inputtext) < 6) {
		Dialog_Show( playerid, dgRegPassword, DIALOG_STYLE_PASSWORD, "{D49B31}Choose password",
		"{D49B31}Your password must be at least 6 characters long{FFFFFF},\nand not longer then 24 characters",
		"{D49B31}Next", "Cancel");
		return 1;
	}
	if (strlen(inputtext) > 24) {
		Dialog_Show( playerid, dgRegPassword, DIALOG_STYLE_PASSWORD, "{D49B31}Choose password",
		"{FFFFFF}Your password must be at least 6 characters long,\n{D49B31}and not longer then 24 characters",
		"{D49B31}Next", "Cancel");
		return 1;
	}
	format(NewUserPassword[ playerid ], 24, "%s", inputtext);
	SelectTextDraw( playerid, 0xD49B31FF );
	TextDrawHideForPlayer( playerid, tdAdmin );
	TextDrawHideForPlayer( playerid, tdAdminMBox );
	TextDrawHideForPlayer( playerid, tdSignButton );
	TextDrawShowForPlayer( playerid, tdPrevCharacter );
	TextDrawShowForPlayer( playerid, tdNextCharacter );
	TextDrawShowForPlayer( playerid, tdUseCharacter );
	TextDrawShowForPlayer( playerid, tdCCinfo );
	PlayerTextDrawShow( playerid, ptdCharacter[ playerid ] );
	PlayerTextDrawShow( playerid, ptdCharacterDesc[ playerid ] );
	SelectingCharacter[ playerid ] = 0;
	return 1;
}
Dialog:HelpOne(playerid, response, listitem, inputtext[]) {
	Dialog_Show( playerid, HelpTwo, DIALOG_STYLE_MSGBOX, "{D49B31}Help 2/3",
"{D49B31}/pick {FFFFFF}pick a lock on the car\n\n\
{D49B31}/takefuel {FFFFFF}Take gas from a car, car must be unlocked\n\n\
{D49B31}/break {FFFFFF}Break in the house or business\n\n\
{D49B31}/takemats {FFFFFF}Take all materials from house or business\n\n\
{D49B31}/takemoney {FFFFFF}Take all money from house or business\n\n\
{D49B31}/takeweapon {FFFFFF}Take all weapons from house or business\n\n\
{D49B31}/takefood {FFFFFF}Take all food from house or business\n\n\
{D49B31}/mats {FFFFFF}Take mats from factory\n\n\
{D49B31}/fuel {FFFFFF}Take fuel from gas station\n\n\
{D49B31}/eavesdrop {FFFFFF} eavesdrop on private conversations on walky talky\n\
it is necessary to upgrade the radio to be used\n\n\
{D49B31}/store {FFFFFF}hide something in your hideout\n\n\
{D49B31}/take {FFFFFF}take something from your hideout\n\n\
{D49B31}/build {FFFFFF}build your hideout\n\n\
{D49B31}/upgrade {FFFFFF}upgrade your hideout\n\n\
{D49B31}/loot {FFFFFF}rob someone else's hideout\n\n\
{D49B31}/help {FFFFFF}Open this dialog",
		"{D49B31}Next", "");
}
Dialog:HelpTwo(playerid, response, listitem, inputtext[]) {
	Dialog_Show( playerid, HelpEnd, DIALOG_STYLE_MSGBOX, "{D49B31}Help 3/3",
"{D49B31}Tips{FFFFFF}:\n\n\
{D4B375}1{FFFFFF}. Use radio to find allies, it will be easier to\n\
play if you're not alone, also you can use it to\n\
sell things or to buy them\n\n\
{D4B375}2{FFFFFF}. Use walky talky when you go into operation with\n\
your allies so that you can communicate with them\n\n\
{D4B375}3{FFFFFF}. Build hideout in a secret place and constantly\n\
upgrading it. Hideout can use to hide things, because\n\
when you die, you lose everything you have on you\n\n\
{D4B375}4{FFFFFF}. You can get XP by killing others, crafting,\n\
pillaging of houses, jobs and hideouts\n\n\
{D4B375}5{FFFFFF}. It will be very difficult in the beginning, and\n\
it is best to be hidden, and of course build\n\
a hideout in a hidden place",
		"{D49B31}Exit", "");
}
Dialog:HelpEnd(playerid, response, listitem, inputtext[]) {
	IsSelecting[ playerid ] = 0;
	IsLoged[ playerid ] = 1;
	CancelSelectTextDraw( playerid );
}
Dialog:dgLogin(playerid, response, listitem, inputtext[]) {
	new tUser[ MAX_PLAYER_NAME ], tmp[20][30];
	
	if (response == 0) return 1;
	
	GetPlayerName( playerid, tUser, MAX_PLAYER_NAME );
	format( Query, 512, "SELECT * FROM Users WHERE username = '%s'", tUser );
	Result = db_query( SaveFiles, Query );
	
	for (new i = 0; i < 20; i++) {
		db_get_field( Result, i, tmp[i], 30 );
	}
	
	if (!strcmp( tmp[1], inputtext )) {
		IsSelecting[ playerid ] = 0;
		IsLoged[ playerid ] = 1;
		CancelSelectTextDraw( playerid );
		SetSpawnInfo( playerid, 0, Characters[ strval(tmp[ 2 ]) ], floatstr(tmp[ 3 ]), floatstr(tmp[ 4 ]), floatstr(tmp[ 5 ]), floatstr(tmp[ 6 ]), 0, 0, 0, 0, 0, 0 );
		TogglePlayerSpectating( playerid, 0 );
		SetPlayerHealth( playerid, floatstr(tmp[ 7 ]) );
		SetPlayerArmour( playerid, floatstr(tmp[ 8 ]) );
		TextDrawHideForPlayer( playerid, tdLogButton );
		TextDrawHideForPlayer( playerid, tdAdmin );
		TextDrawHideForPlayer( playerid, tdAdminMMBox );
		TextDrawHideForPlayer( playerid, tdServerName );
		TextDrawHideForPlayer( playerid, tdWelcomeBox );
		{
			TextDrawShowForPlayer( playerid, tdSname );
			TextDrawShowForPlayer( playerid, tdPSbox );
			TextDrawShowForPlayer( playerid, tdTime );
			PlayerTextDrawShow( playerid, ptdPSbox[ playerid ] );
			PlayerTextDrawShow( playerid, ptdLevel[ playerid ] );
		}
		
		Player[ playerid ][ xp ] = strval(tmp[ 9 ]);
		Player[ playerid ][ level ] = strval(tmp[ 10 ]);
		Player[ playerid ][ crafting ] = strval(tmp[ 11 ]);
		Player[ playerid ][ mechanic ] = strval(tmp[ 12 ]);
		Player[ playerid ][ thief ] = strval(tmp[ 13 ]);
		Player[ playerid ][ gas ] = strval(tmp[ 14 ]);
		Player[ playerid ][ mats ] = strval(tmp[ 15 ]);
		Player[ playerid ][ food ] = strval(tmp[ 16 ]);
		Player[ playerid ][ advradio ] = strval(tmp[ 17 ]);
		Player[ playerid ][ skillpts ] = strval(tmp[ 18 ]);
		
		GivePlayerMoney( playerid, strval(tmp[ 19 ]) );
		db_free_result(Result);
		format( Query, 512, "SELECT * FROM Weapons WHERE username = '%s'", tUser );
		Result = db_query( SaveFiles, Query );
		
		for (new i = 0; i < 13; i++) {
			db_get_field( Result, i, tmp[ 0 ], 30 );
			db_get_field( Result, 13+i, tmp[ 1 ], 30 );
			GivePlayerWeapon( playerid, strval(tmp[ 0 ]), strval(tmp[ 1 ]) );
		}
		
	}else{
		Dialog_Show( playerid, dgLogin, DIALOG_STYLE_PASSWORD, "{D49B31}Login",
		"{D49B31}Wrong password{FFFFFF}!\n\nPlease enter your password:",
		"{D49B31}Login", "Cancel");
	}
	db_free_result(Result);
	return 1;
}