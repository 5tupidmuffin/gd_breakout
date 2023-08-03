extends Node2D
class_name Game

signal increment_score(increment_by: int)
signal decrement_live()

@onready var dead_zone: StaticBody2D = $DeadZone
@onready var ball_spawn_point: BallSpawnPoint = $BallSpawnPoint


func _ready() -> void:
	ball_spawn_point.spawn_ball()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()


func _on_ball_collided(ball_ref: Ball, collided_with: Object) -> void:
	if collided_with is Brick:
		emit_signal("increment_score", collided_with.get_score_point())
		collided_with.die()
	if collided_with is DeadZone:
		emit_signal("decrement_live")
		ball_ref.die()
		ball_spawn_point.spawn_ball()
