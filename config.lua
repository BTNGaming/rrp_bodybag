Config  =   {}

-- KEY LIST --

Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

--[[
	
	If you are still having issues, or you have questions/comments, 
	Visit the thread on the FiveM Forums @ https://https://forum.fivem.net/t/release-bodybag-for-pd-ems/
	Continuing Development by BTNGaming & Deviljin112
	Your ideas, are our creations!

]]--

--[[

    If you want to use Command set Use_Command to TRUE and Use_Keybind to FALSE
    If you want to use Automatic System where bag is applied on death set Use_Command to FALSE and Use_Keybind to FALSE
    If you want to use Keybind System set Use_Command to FALSE and Use_Keybind to TRUE

	To change command name see top of Client.lua

	To add more jobs or remove a job, simply go to line 61 or 121 in client.lua
	Then to add the following line inside the brackets after Config.job_2:
	
	"or PlayerData.job.name == Config.job_3"
	
	to add 4th job after config.job_3 add 
	"or PlayerData.job.name == Config.job_4"
	without the ""

	To remove a job simply do the opposite of the above and remove
	"or PlayerData.job.name == Config.job_2"
	From inside of the brackets

	REMEMBER when adding a new job make sure to uncomment it below and add its name below
	You can add unlimited amount of jobs simply add another Config.job_
	and follow steps above

]]--

-- ESX or not
Config.use_esx = true

-- Command or ( Automatic / Keybind = False )
Config.use_command = true

-- Automatic or Keybind
Config.use_keybind = false

-- What key to be used (list of all available keys above)
Config.keybind = Keys["L"]

-- Job Restriction ( ESX ONLY )
Config.restrict_job = true

-- If above is true, set job names here (to add more see above)
Config.job_1 = "police"
Config.job_2 = "ambulance"
-- Config.job_3 = ( Needs to be coded in. INSTRUCTIONS ON LINE 24+ )
-- Config.job_4 = ( Needs to be coded in. INSTRUCTIONS ON LINE 24+ )

-- Update Frequency for Automatic Bag Spawn
Config.freq_bag_on = 1000

-- Update Frequency for Automatic Bag De-Spawn (Player Revived / Respawned)
Config.freq_bag_off = 1000

-- Bag Model
Config.bag_model = "xm_prop_body_bag"
Config.bag_hash = `xm_prop_body_bag`