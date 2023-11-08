/*
 File: initPlayerLocal.sqf
 Author:
 Description: Run locally on the client when loading into the mission.
*/

// Random Shit
setGroupIconsVisible [false,false];
player enableFatigue false;
disableSerialization;
enableEnvironment false;
player disableConversation true;
enableSentences false;
enableRadio false;
enableSaving [false, false];
0 fadeRadio 0;
setTerrainGrid 50;
0 setFog 0;
player setUnitTrait ["Medic",true];
player setCustomAimCoef 0.0;
player switchCamera "EXTERNAL";

[] call CQC_fnc_initPlayer;

sleep 2;
[ "",
  "Welcome to <a color='#B000FF'>Batmans CQC</a><br/>
  <br/>
  <a color='#16ba3f'># Keys:</a><br/>
  <a color='#00DFFF'>•</a> Return Spawn: <a color='#56BDD6'> CTRL + T</a><br/>
  <a color='#00DFFF'>•</a> Switch Arena: <a color='#56BDD6'> SHIFT + T</a><br/>    
  <a color='#00DFFF'>•</a> Vehicle Menu: <a color='#56BDD6'> SHIFT + 2</a><br/> 
  <a color='#00DFFF'>•</a> Spawn Signs: <a color='#56BDD6'> Scroll Wheel</a><br/>
  <a color='#00DFFF'>•</a> Ear Plugs: <a color='#56BDD6'> SHIFT + O</a><br/>  
  <br/> 
  <a color='#16ba3f'># Information:</a><br/>    
  <a color='#00DFFF'>•</a> Discord: <a href='https://discord.gg/NZB6Dj5' color='#56BDD6'> Discord.gg/XNZB6Dj5</a><br/>
  <br/>
  Thanks for joining and enjoy your stay,<br/> <a color='#B000FF'>CQC</a> Batman", 
  "" , 
  30 
] call CQC_fnc_notificationSystem;