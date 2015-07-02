/****************************************************************************

	Crisis script - v0.1
	
	Script made by Ilija Ištuk
	
	
	Copyright 2015 Ilija Ištuk

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.

****************************************************************************/

#include <a_samp>
#include <izcmd>
#include <sscanf2>
#include <foreach>
#include <dialogs>
#include "include\globals.pwn"
#include "include\player.pwn"
#include "include\interaction.pwn"
#include "include\vehicle.pwn"
#include "include\Stream.pwn"
#include "include\checkpoints.pwn"
#include "include\objects.pwn"

main()
{
	print("====================================");
	print("                                    ");
	print("            World crisis            ");
	print("                                    ");
	print("       Scripted by Ilija Istuk      ");
	print("                                    ");
	print("====================================");
	print("                                    ");
}

public OnGameModeInit()
{
	SetGameModeText("World crisis");
	AddStaticVehicle(470,10.5082,4.0090,3.0878,359.9962,0,0);
	{
		tdWelcomeBox = TextDrawCreate( 380.00, 0, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~" );
		TextDrawUseBox( tdWelcomeBox, 1 );
		TextDrawBoxColor( tdWelcomeBox, 0x00000050);
		TextDrawTextSize( tdWelcomeBox, 640, 480);
		
		tdServerName = TextDrawCreate( 510.00, 60, "World ~w~crisis" );
		TextDrawColor( tdServerName, 0xD49B31FF);
		TextDrawAlignment( tdServerName, 2 );
		TextDrawFont( tdServerName, 3 );
		TextDrawLetterSize( tdServerName, 0.8, 1.8 );
		TextDrawSetShadow( tdServerName, 1);
		TextDrawBackgroundColor( tdServerName, 0x00000050 );
		
		tdAdmin = TextDrawCreate( 400 , 170, "_" );
		TextDrawColor( tdAdmin, 0xFFFFFFFF);
		TextDrawFont( tdAdmin, TEXT_DRAW_FONT_MODEL_PREVIEW );
		TextDrawTextSize( tdAdmin, 220, 220 );
		TextDrawBackgroundColor( tdAdmin, 0x00000000 );
		TextDrawSetShadow( tdAdmin, 0 );
		TextDrawSetPreviewModel( tdAdmin, 164);
		
		tdAdminMBox = TextDrawCreate( 400 , 110, "Hi there! I am one of the moderators on this server and I want to welcome you. Once you register I'll explain you the basics." );
		TextDrawTextSize( tdAdminMBox, 620, 190 );
		TextDrawBackgroundColor( tdAdminMBox, 0x00000010 );
		
		tdSignButton = TextDrawCreate( 510.00, 400, "Register" );
		TextDrawColor( tdSignButton, 0xFFFFFFFF);
		TextDrawAlignment( tdSignButton, 2 );
		TextDrawFont( tdSignButton, 3 );
		TextDrawSetSelectable( tdSignButton, 1 );
		TextDrawTextSize( tdSignButton, 25.0, 80.0 );
		TextDrawSetShadow( tdSignButton, 1 );
		TextDrawBackgroundColor( tdSignButton, 0x00000050 );
	}
	
	{
		tdPrevCharacter = TextDrawCreate( 420.00, 420, "<" );
		TextDrawColor( tdPrevCharacter, 0xFFFFFFFF);
		TextDrawAlignment( tdPrevCharacter, 2 );
		TextDrawFont( tdPrevCharacter, 3 );
		TextDrawSetSelectable( tdPrevCharacter, 1 );
		TextDrawTextSize( tdPrevCharacter, 20.0, 20.0 );
		TextDrawSetShadow( tdPrevCharacter, 1 );
		TextDrawBackgroundColor( tdPrevCharacter, 0x00000050 );
		
		tdNextCharacter = TextDrawCreate( 600.00, 420, ">" );
		TextDrawColor( tdNextCharacter, 0xFFFFFFFF);
		TextDrawAlignment( tdNextCharacter, 2 );
		TextDrawFont( tdNextCharacter, 3 );
		TextDrawSetSelectable( tdNextCharacter, 1 );
		TextDrawTextSize( tdNextCharacter, 20.0, 20.0 );
		TextDrawSetShadow( tdNextCharacter, 1 );
		TextDrawBackgroundColor( tdNextCharacter, 0x00000050 );
		
		tdUseCharacter = TextDrawCreate( 510.00, 420, "Select" );
		TextDrawColor( tdUseCharacter, 0xFFFFFFFF);
		TextDrawAlignment( tdUseCharacter, 2 );
		TextDrawFont( tdUseCharacter, 3 );
		TextDrawSetSelectable( tdUseCharacter, 1 );
		TextDrawTextSize( tdUseCharacter, 25.0, 80.0 );
		TextDrawSetShadow( tdUseCharacter, 1 );
		TextDrawBackgroundColor( tdUseCharacter, 0x00000050 );
		
		tdCCinfo = TextDrawCreate( 510 , 100, "Choose your character" );
		TextDrawTextSize( tdCCinfo, 620, 190 );
		TextDrawAlignment( tdCCinfo, 2 );
		TextDrawBackgroundColor( tdCCinfo, 0x00000010 );
		TextDrawSetShadow( tdCCinfo, 0 );
		TextDrawSetShadow( tdUseCharacter, 1 );
		TextDrawBackgroundColor( tdUseCharacter, 0x00000050 );
		
		tdSname = TextDrawCreate( 80, 430, "World ~w~crisis" );
		TextDrawColor( tdSname, 0xD49B31FF);
		TextDrawAlignment( tdSname, 2 );
		TextDrawFont( tdSname, 3 );
		TextDrawLetterSize( tdSname, 0.6, 1.2 );
		TextDrawSetShadow( tdSname, 1);
		TextDrawBackgroundColor( tdSname, 0x00000050 );
		
		tdPSbox = TextDrawCreate( 438.75, 432.5, "_" );
		TextDrawUseBox( tdPSbox, 1 );
		TextDrawBoxColor( tdPSbox, 0x000000FF);
		TextDrawLetterSize( tdPSbox, 0, 0.3375);
		TextDrawTextSize( tdPSbox, 631.1, 5);
	}
	return 1;
}

public OnGameModeExit()
{
	return 1;
}