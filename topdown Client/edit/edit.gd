extends Node

var c_lo_name: String
var rune_points: int = 20
const RUNES := 0
const SKILLS = 1
var lo_names := {}

var skill_pos = 0


func _ready():
	
	var file := File.new()

	# Open existing file
	file.open("res://loadout.sav", File.READ)

	var loadout := []


	while(!file.eof_reached()):
		var string_array := file.get_line().split(" ")
		var normal_array := []
		for word in string_array:
			normal_array.push_back(word)
		loadout.push_back(normal_array)
	#loadout, which is just the txt file organized, is done here
	#now time to organize loadout
	var c_lo_name: String = loadout[0][0]

	for lo_index in range(1, loadout.size(), 2):
		lo_names[loadout[lo_index][0]] = [{}, ["", "", ""]]
		var rune_count = lo_names[loadout[lo_index][0]][RUNES]
		var skills = lo_names[loadout[lo_index][0]][SKILLS]

		#runes
		for i in range(1, loadout[lo_index].size(), 2):
			rune_count[loadout[lo_index][i]] = int(loadout[lo_index][i+1])


		skills[0] = loadout[lo_index + 1][0]
		skills[1] = loadout[lo_index + 1][1]
		skills[2] = loadout[lo_index + 1][2]

	for lo_name in lo_names:
		$Loadouts.add_item(lo_name)
		
		


	#select current loadout
	for i in range($Loadouts.get_item_count()):
		if $Loadouts.get_item_text(i) == c_lo_name:
			$Loadouts.select(i)
	lo_name_change(c_lo_name)



func lo_name_change(changed_name:String):
	rune_points = 20
	c_lo_name = changed_name
	
	var rune_count = lo_names[c_lo_name][RUNES]
	for rune in $runes.get_children():
		rune.text = rune.name + ": " + String(rune_count[rune.name])
		rune_points -= rune.rune_cost * rune_count[rune.name]


	$runes.text = "runes - rune points: " + String(rune_points)
	_on_Skill0_pressed()
func _on_back_pressed():
	##saving
	var file = File.new()
	file.open("res://loadout.sav", File.WRITE)
	file.store_string(c_lo_name)
	for lo_name in lo_names:
		file.store_string("\n") 
		var rune_count = lo_names[lo_name][RUNES]
		var skills = lo_names[lo_name][SKILLS]
		
		
		var data = ["", ""]
	
		data[0] += lo_name
		#runes 
		for rune in rune_count:
			data[0] += " " + rune
			data[0] += " " + String(rune_count[rune])
		
		data[1] = skills[0] + " " + skills[1] + " " + skills[2]
		
		file.store_line(data[0])
		file.store_string(data[1])
		
	file.close()
	
	get_tree().change_scene('res://menu/start_menu.tscn')





func _on_Skill0_pressed():
	$Skill0.pressed = true
	$Skill1.pressed = false
	$Skill2.pressed = false
	skill_pos = 0
	var skills = lo_names[c_lo_name][SKILLS]
	
	var index
	for i in range($Skills.get_item_count()):
		if $Skills.get_item_text(i) == skills[skill_pos]:
			index = i
	$Skills.select(index)


func _on_Skill1_pressed():
	$Skill0.pressed = false
	$Skill1.pressed = true
	$Skill2.pressed = false
	skill_pos = 1
	var skills = lo_names[c_lo_name][SKILLS]
	
	var index
	for i in range($Skills.get_item_count()):
		if $Skills.get_item_text(i) == skills[skill_pos]:
			index = i
	$Skills.select(index)


func _on_Skill2_pressed():
	$Skill0.pressed = false
	$Skill1.pressed = false
	$Skill2.pressed = true
	skill_pos = 2
	var skills = lo_names[c_lo_name][SKILLS]
	
	var index
	for i in range($Skills.get_item_count()):
		if $Skills.get_item_text(i) == skills[skill_pos]:
			index = i
	$Skills.select(index)
