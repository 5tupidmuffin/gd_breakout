extends CharacterBody2D
class_name Ball


signal collided(self_ref, collided_with)
#signal collided(self: Ball, collided_with: Object)


@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
const WHITE := Color("cccccc")
const SPEED := 8.0
var direction := Vector2(0, 1)


func _draw() -> void:
	draw_circle(
		Vector2.ZERO,
		collision_shape_2d.shape.radius,
		WHITE
	)


func _physics_process(delta: float) -> void:
	# reflection logic based on https://www.youtube.com/watch?v=RS0y2C2C0mc
	var collision := move_and_collide(direction * SPEED)
	if collision:
		var reflection_vector := get_reflection_vector(collision)
		direction = reflection_vector
		var colliding_obj := collision.get_collider()
		emit_signal("collided", self, colliding_obj)


func get_reflection_vector(collision: KinematicCollision2D) -> Vector2:
	var reflection_vector := direction.bounce(collision.get_normal())
	return minor_deviation(reflection_vector)


func minor_deviation(reflected_vector: Vector2) -> Vector2:
	var rng := RandomNumberGenerator.new()
	var x := rng.randf_range(-0.2, 0.2)
	var y := rng.randf_range(-0.2, 0.2)
	var modified_vector := reflected_vector + Vector2(x, y)
	return modified_vector.normalized()
