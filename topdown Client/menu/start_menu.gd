extends Node



func _on_Edit_pressed():
	get_tree().change_scene("res://edit/edit.tscn")


func _on_Play_pressed():
	var file := File.new()

	# Open loadout file
	file.open("res://loadout.sav", File.READ)

	var loadout = []


	while(!file.eof_reached()):
		var string_array = file.get_line().split(" ")
		var normal_array = []
		for word in string_array:
			normal_array.push_back(word)
		loadout.push_back(normal_array)
	#loadout, which is just the txt file organized, is done here
	#now time to organize loadout
	var c_lo_name = loadout[0][0]
	var selected_lo_index:int
	
	for lo_index in range(1, loadout.size(), 2):
		if loadout[lo_index][0] == c_lo_name:
			selected_lo_index = lo_index
			break;
	
	#runes
	for i in range(1, loadout[selected_lo_index].size(), 2):
		global.rune_count[loadout[selected_lo_index][i]] = int(loadout[selected_lo_index][i+1])
	
	#skills
	global.skills[0] = loadout[selected_lo_index + 1][0]
	global.skills[1] = loadout[selected_lo_index + 1][1]
	global.skills[2] = loadout[selected_lo_index + 1][2]
	
	
	
	
	
	global.server_IP = get_child(0).text
	global.port = int(get_child(1).text)
	get_tree().change_scene("res://lobby/lobby.tscn")


