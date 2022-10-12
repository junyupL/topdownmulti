extends KinematicBody2D
class_name Player

var multiplier: float = 1
var knockback: Vector2 = Vector2()

var direction := Vector2(0, 0)
var speed: float = 30
var rune_count

func _physics_process(delta):
	direction = direction.normalized()
	move_and_slide(direction * speed + knockback * multiplier)
	knockback *= 0.8
	rpc_unreliable('update_position', position)

#var radius:float



func take_damage(damage:float, _knockback:float, pos:Vector2):
	multiplier += damage
	knockback += (position - pos).normalized() * _knockback


func init_rune(runes):
	rune_count = runes
	
