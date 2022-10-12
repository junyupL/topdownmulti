extends Button

func _on_Button_pressed():
	print('button pressed')
	global.server_port = int($Port.text)
	get_tree().change_scene("res://lobby/lobby.tscn")
