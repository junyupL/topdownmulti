extends KinematicBody2D
class_name Bullet
# Member variables
var damage:float = 0.2
#var radius:float = 10
var direction : Vector2 = Vector2(0, 0)
var speed : float = 2.0
var knockback:float = 50
var add_at_death:Bullet

func _ready():
	pass
	#$CollisionShape2D.shape.radius = radius
func _physics_process(delta):
	move_and_slide(direction * speed)

	if get_slide_count() > 0:
		for i in range(get_slide_count()):
			var cc := get_slide_collision(i)
			if cc and cc.collider is Player:
				var player := cc.collider as Player
				player.take_damage(damage, knockback, position)
	
		queue_free()

	if $Timer.time_left == 0:
		queue_free()
