public OnPlayerConnect(playerid)
{
	TogglePlayerSpectating( playerid, 1 );
	SelectTextDraw( playerid, 0xD49B31FF );
	IsSelecting[ playerid ] = 1;
	TextDrawShowForPlayer( playerid, tdWelcomeBox );
	TextDrawShowForPlayer( playerid, tdServerName );
	TextDrawShowForPlayer( playerid, tdAdmin );
	TextDrawShowForPlayer( playerid, tdAdminMBox );
	TextDrawShowForPlayer( playerid, tdSignButton );
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
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
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
		Player[ killerid ][ xp ] += 50;
		GivePlayerMoney( playerid, GetPlayerMoney( playerid ) );
		Player[ killerid ][ gas ] += Player[ playerid ][ gas ];
		Player[ killerid ][ mats ] += Player[ playerid ][ mats ];
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
	new msg[32], xplen;
	format( msg, 32, "Level %i", Player[ playerid ][ level ] );
	PlayerTextDrawSetString( playerid, ptdLevel[ playerid ], msg);
	xplen = 440+((Player[ playerid ][ xp ]/100)*90);
	PlayerTextDrawTextSize( playerid, ptdPSbox[ playerid ], xplen, 5 );
	return 1;
}