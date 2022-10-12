extends Node

remote func update_movement(dir):
	var node_name:String = String(get_tree().get_rpc_sender_id())
	if has_node(node_name):
		var node = get_node(node_name)
		node.direction = dir



remote func use_skill(skill_pressed, target):
	var node_name:String = String(get_tree().get_rpc_sender_id())
	if has_node(node_name):
		var node = get_node(node_name)
		node.get_node('Skills').get_child(skill_pressed).use_skill(target)


func _process(delta):
	var bullet_data:Array

	bullet_data.clear()

	for bullet in $Bullets.get_children():
		bullet_data.append(bullet.position)
		
	rpc_unreliable('update_bullets', bullet_data)
