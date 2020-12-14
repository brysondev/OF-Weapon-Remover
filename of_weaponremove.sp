#include <sourcemod>
#include <sdktools>
#include <sdkhooks>

#define PLUGIN_AUTHOR "bryson"
#define PLUGIN_VERSION "1.0.0"

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo = 
{
	name = "Open Fortress Weapon Remover", 
	author = PLUGIN_AUTHOR, 
	description = "Fixes the game lo", 
	version = PLUGIN_VERSION, 
	url = "brysonscorner.info"
};

public void OnPluginStart()
{
    for(int i = 1; i <= MaxClients; i++)
    {
        if(IsClientInGame(i))
        {
            OnClientPutInServer(i);
        }
    }
}

public void OnClientPutInServer(int client) {
	SDKHook(client, SDKHook_WeaponCanUse, BlockPickup);
}

public Action BlockPickup(int client, int weapon) {
	char weaponClass[64];
	GetEntityClassname(weapon, weaponClass, sizeof(weaponClass));
    if (StrEqual(weaponClass, "tf_weapon_pistol_akimbo")) 
    {
		AcceptEntityInput(weapon, "Kill");
		return Plugin_Handled;
    }
	return Plugin_Continue;
}