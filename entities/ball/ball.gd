extends RigidBody2D
class_name Ball


@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
const WHITE := Color("cccccc")


func _draw() -> void:
	draw_circle(
		Vector2.ZERO,
		collision_shape_2d.shape.radius,
		WHITE
	)
