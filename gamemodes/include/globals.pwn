//
// TextDraws
//
//Forward declarations

forward DKick( playerid );

// Login and Register

new Text:tdWelcomeBox, Text:tdServerName;
new Text:tdSignButton, Text:tdAdmin, Text:tdAdminMBox;
new NewUserPassword[ MAX_PLAYERS ][ 24 ], NewUserCharacter[ MAX_PLAYERS ], NewUserCharacterName[ MAX_PLAYERS ][ 24 ];

new PlayerText:ptdCharacterDesc[ MAX_PLAYERS ], PlayerText:ptdCharacter[ MAX_PLAYERS ];
new Text:tdNextCharacter, Text:tdPrevCharacter, Text:tdUseCharacter, Text:tdCCinfo;
new Text:tdSname, Text:tdPSbox, PlayerText:ptdPSbox[ MAX_PLAYERS ], PlayerText:ptdLevel[ MAX_PLAYERS ];

// User variables

new IsSelecting[ MAX_PLAYERS ], SelectingCharacter[ MAX_PLAYERS ];
new Characters[ 20 ] = { 60, 2, 133, 206, 7, 223, 48, 128, 162, 248, 234, 28, 109, 289, 272, 298, 299, 292, 293, 240 };
new CharDesc[20][196] = {"Money: $3500~n~Weapon: None~n~Other: None~n~Crafting: Level 2~n~Mechanic: Level 2~n~Thief: Level 1",
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
{461.4857,3028.5811,500.00},
{461.4857,3028.5811,500.00},
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
	advradio
};
new Player[ MAX_PLAYERS ][ pData ];

// Gloabal functions

public DKick( playerid ) {
	Kick( playerid );
	return 1;
}