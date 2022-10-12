extends Skill

func _init():
	cooldown = 1

func use_skill(target : Vector2):
	if !.use_skill(target):
		return

	var bi = BULLET.instance()

	var rotation = (target - get_parent().get_parent().position).normalized()
	var pos = get_parent().get_parent().position + rotation * 70;

	bi.position = pos
	bi.direction = rotation
	bi.speed = 10.0

	get_parent().get_parent().get_parent().get_node('Bullets').add_child(bi)
