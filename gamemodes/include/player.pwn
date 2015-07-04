public OnPlayerConnect(playerid)
{
	SetWorldTime(Time[0]);
	new tUser[ MAX_PLAYER_NAME ];
	TogglePlayerSpectating( playerid, 1 );
	SelectTextDraw( playerid, 0xD49B31FF );
	IsSelecting[ playerid ] = 1;
	TextDrawShowForPlayer( playerid, tdWelcomeBox );
	TextDrawShowForPlayer( playerid, tdServerName );
	TextDrawShowForPlayer( playerid, tdAdmin );
	GetPlayerName( playerid, tUser, MAX_PLAYER_NAME );
	format( Query, 512, "SELECT * FROM Users WHERE username = '%s'", tUser );
	Result = db_query( SaveFiles, Query );
	if (db_num_rows(Result) > 0) {
		TextDrawShowForPlayer( playerid, tdAdminMMBox );
		TextDrawShowForPlayer( playerid, tdLogButton );
	}else{
		TextDrawShowForPlayer( playerid, tdAdminMBox );
		TextDrawShowForPlayer( playerid, tdSignButton );
	}
	{
		ptdCharacter[ playerid ] = CreatePlayerTextDraw( playerid, 400, 115, "_");
		PlayerTextDrawColor( playerid, ptdCharacter[ playerid ], 0xFFFFFFFF);
		PlayerTextDrawFont( playerid, ptdCharacter[ playerid ], TEXT_DRAW_FONT_MODEL_PREVIEW );
		PlayerTextDrawTextSize( playerid, ptdCharacter[ playerid ], 220, 220 );
		PlayerTextDrawSetShadow( playerid, ptdCharacter[ playerid ], 0 );
		PlayerTextDrawBackgroundColor( playerid, ptdCharacter[ playerid ], 0x00000000 );
		PlayerTextDrawSetPreviewModel( playerid, ptdCharacter[ playerid ], 60);
		
		ptdCharacterDesc[ playerid ] = CreatePlayerTextDraw( playerid, 400, 340, "Money: $2500~n~Weapon: None~n~Gas: None~n~Crafting: Level 2~n~Mechanic: Level 2~n~Thief: Level 1" );
		PlayerTextDrawTextSize( playerid, ptdCharacterDesc[ playerid ], 620, 190 );
		PlayerTextDrawBackgroundColor( playerid, ptdCharacterDesc[ playerid ], 0x00000010 );
		
		ptdPSbox[ playerid ] = CreatePlayerTextDraw( playerid, 440, 433.75, "_" );
		PlayerTextDrawUseBox( playerid, ptdPSbox[ playerid ], 1 );
		PlayerTextDrawBoxColor( playerid, ptdPSbox[ playerid ], 0xD49B31FF);
		PlayerTextDrawLetterSize( playerid, ptdPSbox[ playerid ], 0, 0.16875);
		PlayerTextDrawTextSize( playerid, ptdPSbox[ playerid ], 441, 5);
		
		ptdLevel[ playerid ] = CreatePlayerTextDraw( playerid, 630, 410, "Level 1" );
		PlayerTextDrawColor( playerid, ptdLevel[ playerid ], 0xD49B31FF);
		PlayerTextDrawAlignment( playerid, ptdLevel[ playerid ], 3 );
		PlayerTextDrawFont( playerid, ptdLevel[ playerid ], 3 );
		PlayerTextDrawLetterSize( playerid, ptdLevel[ playerid ], 0.6, 1.2 );
		PlayerTextDrawSetShadow( playerid, ptdLevel[ playerid ], 1);
		PlayerTextDrawBackgroundColor( playerid, ptdLevel[ playerid ], 0x00000050 );
	}
	db_free_result(Result);
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	if (IsLoged[ playerid ] == 0) return 1;
	IsLoged[ playerid ] = 0;
	IsSelecting[ playerid ] = 0;
	new Float:tPos[3], Float:tAngle, Float:tHealth[2], tMoney, tUser[ MAX_PLAYER_NAME ];
	GetPlayerPos( playerid, tPos[0], tPos[1], tPos[2] );
	GetPlayerFacingAngle( playerid, tAngle );
	GetPlayerHealth( playerid, tHealth[0] );
	GetPlayerArmour( playerid, tHealth[1] );
	GetPlayerName( playerid, tUser, MAX_PLAYER_NAME );
	tMoney = GetPlayerMoney( playerid );
	format( Query, 512, "UPDATE Users SET x = '%f', y = '%f', z = '%f', angle = '%f', health = '%f', armor = '%f', xp = %i, lvl = %i, crafting = %i, mechanic = %i, thief = %i, gas = %i, mats = %i, food = %i, advradio = %i, skillpts = %i, money = %i WHERE username = '%s'",
tPos[0], tPos[1], tPos[2], tAngle, tHealth[0], tHealth[1], Player[ playerid ][ xp ], Player[ playerid ][ level ],
Player[ playerid ][ crafting ], Player[ playerid ][ mechanic ], Player[ playerid ][ thief ],
Player[ playerid ][ gas ], Player[ playerid ][ mats ], Player[ playerid ][ food ], Player[ playerid ][ advradio ],
Player[ playerid ][ skillpts ], tMoney, tUser );
	db_query( SaveFiles, Query );
	
	new weapons[13][2];
 
	for (new i = 0; i < 13; i++) {
		GetPlayerWeaponData( playerid, i, weapons[i][0], weapons[i][1] );
	}
	format( Query, 512, "UPDATE Weapons SET w1 = %i, w2 = %i, w3 = %i, w4 = %i, w5 = %i, w6 = %i, w7 = %i, w8 = %i, w9 = %i, w10 = %i, w11 = %i, w12 = %i, w13 = %i WHERE username = '%s'",
	weapons[0][0], weapons[1][0], weapons[2][0], weapons[3][0], weapons[4][0], weapons[5][0], weapons[6][0], weapons[7][0], weapons[8][0], weapons[9][0], weapons[10][0], weapons[11][0], weapons[12][0], tUser
	);
	db_query( SaveFiles, Query );
	format( Query, 512, "UPDATE Weapons SET a1 = %i, a2 = %i, a3 = %i, a4 = %i, a5 = %i, a6 = %i, a7 = %i, a8 = %i, a9 = %i, a10 = %i, a11 = %i, a12 = %i, a13 = %i WHERE username = '%s'",
	weapons[0][1], weapons[1][1], weapons[2][1], weapons[3][1], weapons[4][1], weapons[5][1], weapons[6][1], weapons[7][1], weapons[8][1], weapons[9][1], weapons[10][1], weapons[11][1], weapons[12][1], tUser
	);
	db_query( SaveFiles, Query );
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	new rand = random(4);
	
	if (killerid != INVALID_PLAYER_ID) {
		Player[ killerid ][ xp ] += 20;
		GivePlayerMoney( playerid, GetPlayerMoney( playerid ) );
		Player[ killerid ][ gas ] += Player[ playerid ][ gas ];
		Player[ killerid ][ mats ] += Player[ playerid ][ mats ];
		GameTextForPlayer( killerid, "~b~h~h~+20", 500, 3 );
	}
	Player[ playerid ][ gas ] = 0;
	Player[ playerid ][ mats ] = 0;
	
	SpawnPlayer( playerid );
	SetPlayerPos( playerid, RndSpawn[ rand ][ 0 ], RndSpawn[ rand ][ 1 ], RndSpawn[ rand ][ 2 ]);
	SetPlayerHealth( playerid, 100.00 );
	ResetPlayerMoney( playerid );
	ResetPlayerWeapons( playerid );
	
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	new msg[32], Float:xplen;
	if (IsLoged[ playerid ] == 0) return 1;
	if (Player[ playerid ][ xp ] > 100*Player[ playerid ][ level ]) {
		Player[ playerid ][ level ]++;
		Player[ playerid ][ xp ] = 0;
		Player[ playerid ][ skillpts ]++;
		GameTextForPlayer( playerid, "~w~Level up!", 3000, 5 );
	}
	format( msg, 32, "Level %i", Player[ playerid ][ level ] );
	PlayerTextDrawSetString( playerid, ptdLevel[ playerid ], msg);
	xplen = (((Player[ playerid ][ xp ]*100)/(100*Player[ playerid ][ level ]))*190)/100;
	PlayerTextDrawTextSize( playerid, ptdPSbox[ playerid ], 440+xplen, 5 );
	PlayerTextDrawShow( playerid, ptdPSbox[ playerid ] );
	return 1;
}