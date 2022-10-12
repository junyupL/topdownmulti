extends Skill

func _init():
	cooldown = 3.0

func use_skill(target):
	if !.use_skill(target):
		return
	var bi = BULLET.instance()
	var bi2 = BULLET.instance()
	var bi3 = BULLET.instance()
	var bi4 = BULLET.instance()
	var bi5 = BULLET.instance()

	var rotation = (target - get_parent().get_parent().position).normalized()
	var rotation2 = rotated_vector(rotation, 0.5)
	var rotation3 = rotated_vector(rotation, 1)
	var rotation4 = rotated_vector(rotation, -0.5)
	var rotation5 = rotated_vector(rotation, -1)
	
	var pos = get_parent().get_parent().position + rotation * 40;
	var pos2 = get_parent().get_parent().position + rotation2 * 40;
	var pos3 = get_parent().get_parent().position + rotation3 * 40;
	var pos4 = get_parent().get_parent().position + rotation4 * 40;
	var pos5 = get_parent().get_parent().position + rotation5 * 40;

	bi.direction = rotation
	bi.speed = 50.0
	bi2.direction = rotation2
	bi2.speed = 50.0
	bi3.direction = rotation3
	bi3.speed = 50.0
	bi4.direction = rotation4
	bi4.speed = 50.0
	bi5.direction = rotation5
	bi5.speed = 50.0
	var bullets_node = get_parent().get_parent().get_parent().get_node('Bullets')


	bi.position = pos
	bi2.position = pos
	bi3.position = pos
	bi4.position = pos
	bi5.position = pos




	bullets_node.add_child(bi)
	bullets_node.add_child(bi2)
	bullets_node.add_child(bi3)
	bullets_node.add_child(bi4)
	bullets_node.add_child(bi5)
