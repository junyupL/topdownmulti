extends Node
class_name Skill

const BULLET := preload("res://bullet/bullet.tscn")
var time_counter:float = 0
var cooldown:float

func rotated_vector(vec : Vector2, rad : float) -> Vector2:
	var ret : Vector2
	ret.x = vec.x * cos(rad) - vec.y * sin(rad)
	ret.y = vec.x * sin(rad) + vec.y * cos(rad)
	return ret

func _process(delta):
	time_counter += delta


func use_skill(target: Vector2) -> bool:
	if time_counter >= cooldown:
		time_counter = 0
		return true
	return false
