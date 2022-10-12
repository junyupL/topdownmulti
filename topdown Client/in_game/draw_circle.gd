extends Node2D
class_name DrawCircle


export var color: Color
export var radius: float

remote func update_position(pos):
	position = pos

func _process(delta):
	update()


func _draw():
	draw_circle(Vector2(), radius, color)
