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
	AddStaticVehicleEx(470, 0.00, 0.00, 0.00, 0.00, 0, 0, -1);
	return 1;
}

public OnGameModeExit()
{
	return 1;
}