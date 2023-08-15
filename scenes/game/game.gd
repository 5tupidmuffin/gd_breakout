extends Node2D
class_name Game

signal increment_score(increment_by: int)
signal decrement_live()

@onready var dead_zone: StaticBody2D = $DeadZone
@onready var ball_spawn_point: BallSpawnPoint = $BallSpawnPoint
@onready var brick_spawn_point: BrickSpawnPoint = $BrickSpawnPoint
@onready var score_ui: ScoreUI = $ScoreUI
@onready var game_over: Node2D = $GameOver

var brick_count: int


func _ready() -> void:
	ball_spawn_point.spawn_ball()
	update_brick_count()
	game_over.hide()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()


func _on_ball_collided(ball_ref: Ball, collided_with: Object) -> void:
	if collided_with is Brick:
		emit_signal("increment_score", collided_with.get_score_point())
		collided_with.die()
		update_brick_count()
	if collided_with is DeadZone:
		emit_signal("decrement_live")
		ball_ref.die()
		ball_spawn_point.spawn_ball()
	check_for_end()


func update_brick_count() -> void:
	brick_count = brick_spawn_point.get_bricks_count()


func get_remaining_lives() -> int:
	return score_ui.lives


func show_pop_up() -> void:
	get_tree().paused = true  # R for restart doesn't work
	game_over.show()


func check_for_end() -> bool:
	if brick_count == 0 or get_remaining_lives() == 0:
		show_pop_up()
		return true
	return false
