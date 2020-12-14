# OF-Weapon-Remover
### *Removes weapon of choice from being picked up*

Edit the function in the `.sp` file and compile to remove weapons of your choice. By default it removes dualies.

```c++
public Action BlockPickup(int client, int weapon) {
  ...
    if (StrEqual(weaponClass, "tf_weapon_pistol_akimbo")) // Replace me with weapon you want removed lole
  ...
```
You need `<sdktools>` and `<sdkhooks>` to compile.
