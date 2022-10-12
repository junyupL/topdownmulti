extends Node2D


remote func update_bullets(bullet_data:Array) -> void:
	
	while bullet_data.size() > $Bullets.get_child_count():
		var bullet = DrawCircle.new()
		bullet.color = Color(0.5, 0.5, 0.5)
		$Bullets.add_child(bullet)
	
	for i in $Bullets.get_child_count():
		if i < bullet_data.size():
			$Bullets.get_child(i).radius = 10.0
			$Bullets.get_child(i).position = bullet_data[i]
		else:
			$Bullets.get_child(i).radius = 0.0
		




func _process(delta):
	var direction := Vector2()
	
	if Input.is_action_pressed("ui_left"):
		direction.x-=1
		
	if Input.is_action_pressed("ui_right"):
		direction.x+=1
		
	if Input.is_action_pressed("ui_up"):
		direction.y-=1
	if Input.is_action_pressed("ui_down"):
		direction.y+=1
	
	
	rpc_id(1, 'update_movement', direction)
	
	
	if Input.is_action_just_pressed("skill0"):
		rpc_id(1, 'use_skill', 0, get_global_mouse_position())
	
	if Input.is_action_just_pressed("skill1"):
		rpc_id(1, 'use_skill', 1, get_global_mouse_position())
		
	if Input.is_action_just_pressed("skill2"):
		rpc_id(1, 'use_skill', 2, get_global_mouse_position())
