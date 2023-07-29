extends Node2D


@onready var dead_zone: StaticBody2D = $DeadZone
@onready var spawn_point: Node2D = $SpawnPoint


func _ready() -> void:
	spawn_ball()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()


func spawn_ball() -> void:
	var ball_scene := load("res://entities/ball/ball.tscn")
	var new_ball: Ball = ball_scene.instantiate()
	new_ball.connect("collided", _on_ball_collided)
	new_ball.global_position = spawn_point.global_position
	add_child(new_ball)


func _on_ball_collided(ball_ref: Ball, collided_with: Object) -> void:
	if collided_with is DeadZone:
		ball_ref.queue_free()
		spawn_ball()
