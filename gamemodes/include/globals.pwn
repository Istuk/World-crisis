//
// TextDraws
//
//Forward declarations

forward DKick( playerid );
forward TimeAdvance( playerid );
forward SaveWorldTime();

// Login and Register

new Text:tdWelcomeBox, Text:tdServerName;
new Text:tdSignButton, Text:tdLogButton, Text:tdAdmin, Text:tdAdminMBox, Text:tdAdminMMBox;
new NewUserPassword[ MAX_PLAYERS ][ 24 ];

new PlayerText:ptdCharacterDesc[ MAX_PLAYERS ], PlayerText:ptdCharacter[ MAX_PLAYERS ];
new Text:tdNextCharacter, Text:tdPrevCharacter, Text:tdUseCharacter, Text:tdCCinfo;
new Text:tdSname, Text:tdPSbox, PlayerText:ptdPSbox[ MAX_PLAYERS ], PlayerText:ptdLevel[ MAX_PLAYERS ];

// User variables

new IsSelecting[ MAX_PLAYERS ], SelectingCharacter[ MAX_PLAYERS ], IsLoged[ MAX_PLAYERS ];
new Characters[ 20 ] = { 60, 2, 133, 206, 7, 223, 48, 128, 162, 248, 234, 28, 109, 289, 272, 298, 299, 292, 293, 240 };
new CharDesc[20][196] = {"Money: $3500~n~Weapon: None~n~Other: 20kg of food~n~Crafting: Level 2~n~Mechanic: Level 2~n~Thief: Level 1",
"Money: $2000~n~Weapon: Knife~n~Other: None~n~Crafting: Level 1~n~Mechanic: Level 2~n~Thief: Level 2",
"Money: $2000~n~Weapon: Baseball bat~n~Other: None~n~Crafting: Level 3~n~Mechanic: Level 1~n~Thief: Level 1",
"Money: $500~n~Weapon: Knife~n~Other: 30L of gas~n~Crafting: Level 1~n~Mechanic: Level 3~n~Thief: Level 1",
"Money: $0~n~Weapon: None~n~Other: 200L of gas~n~Crafting: Level 1~n~Mechanic: Level 1~n~Thief: Level 4",
"Money: $8000~n~Weapon: None~n~Other: None~n~Crafting: Level 1~n~Mechanic: Level 1~n~Thief: Level 1",
"Money: $500~n~Weapon: 9mm~n~Other: None~n~Crafting: Level 1~n~Mechanic: Level 2~n~Thief: Level 1",
"Money: $50~n~Weapon: Country rifle~n~Other: None~n~Crafting: Level 4~n~Mechanic: Level 2~n~Thief: Level 1",
"Money: $0~n~Weapon: Shovel~n~Other: None~n~Crafting: Level 1~n~Mechanic: Level 1~n~Thief: Level 10",
"Money: $1500~n~Weapon: None~n~Other: 100L of gas~n~Crafting: Level 1~n~Mechanic: Level 1~n~Thief: Level 1",
"Money: $250~n~Weapon: Shotgun~n~Other: None~n~Crafting: Level 2~n~Mechanic: Level 2~n~Thief: Level 1",
"Money: $1500~n~Weapon: 9mm~n~Other: None~n~Crafting: Levle 1~n~Mechanic: Level 1~n~Thief: Level 2",
"Money: $3500~n~Weapon: None~n~Other: 30L~n~Crafting: Level 1~n~Mechanic: Level 1~n~Thief: Level 1",
"Money: $15~n~Weapon: None~n~Other: 300 Materials~n~Crafting: Level 4~n~Mechanic: Level 2~n~Thief: Level 1",
"Money: $3500~n~Weapon: None~n~Other: 100 Materials~n~Crafting: Level 1~n~Mechanic: Level 1~n~Thief: Level 1",
"Money: $3000~n~Weapon: Sniper rifle~n~Other: None~n~Crafting: Level 1~n~Mechanic: Level 1~n~Thief: Level 1",
"Money: $1500~n~Weapon: Desert eagle~n~Other: None~n~Crafting: Level 1~n~Mechanic: Level 2~n~Thief: Level 1",
"Money: $200~n~Weapon: None~n~Other: None~n~Crafting: Level 2~n~Mechanic: Level 5~n~Thief: Level 1",
"Money: $40~n~Weapon: 9mm~n~Other: 250 Materials~n~Crafting: Level 2~n~Mechanic: Level 1~n~Thief: Level 2",
"Money: $500~n~Weapon: Sniper rifle~n~Other: None~n~Crafting: Level 1~n~Mechanic: Level 1~n~Thief: Level 2"
};
new Float:RndSpawn[4][3] = {
{-550.5784,882.8760,500.00},
{-2121.6631,2352.7500,500.00},
{-550.5784,882.8760,500.00},
{-2121.6631,2352.7500,500.00}
};
enum pData {
	xp,
	level,
	crafting,
	mechanic,
	thief,
	gas,
	mats,
	food,
	advradio,
	skillpts
};
new Player[ MAX_PLAYERS ][ pData ];

// Global variables

new Time[2] = {0, 0}, Text:tdTime;
new Query[512], DB:SaveFiles, DBResult:Result;

// Gloabal functions

public DKick( playerid ) {
	Kick( playerid );
	return 1;
}
public TimeAdvance( ) {
	new newtime[10];
	
	if ( Time[1] == 59 ) {
		Time[1] = 0;
		if ( Time[0] == 23 ) Time[0] = 0; else Time[0]++;
		SetWorldTime( Time[0] );
	}else Time[1]++;
	
	if ( Time[1] < 10 ) {
		if ( Time[0] < 10 ) {
			format( newtime, 10, "0%i:0%i", Time[0], Time[1] );
		}else{
			format( newtime, 10, "%i:0%i", Time[0], Time[1] );
		}
	}else{
		if ( Time[0] < 10 ) {
			format( newtime, 10, "0%i:%i", Time[0], Time[1] );
		}else{
			format( newtime, 10, "%i:%i", Time[0], Time[1] );
		}
	}
	TextDrawSetString( tdTime, newtime );
}
public SaveWorldTime() {
	format(Query, 512, "UPDATE ServerInfo SET data = '%i' WHERE name = 'hours'", Time[0] );
	db_query( SaveFiles, Query );
	format(Query, 512, "UPDATE ServerInfo SET data = '%i' WHERE name = 'min'", Time[1] );
	db_query( SaveFiles, Query );
}