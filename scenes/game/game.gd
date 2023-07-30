extends Node2D
class_name Game


@onready var dead_zone: StaticBody2D = $DeadZone
@onready var spawn_point: SpawnPoint = $SpawnPoint


func _ready() -> void:
	spawn_point.spawn_ball()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()


func _on_ball_collided(ball_ref: Ball, collided_with: Object) -> void:
	if collided_with is DeadZone:
		ball_ref.queue_free()
		spawn_point.spawn_ball()
