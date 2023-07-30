extends Node2D
class_name BallSpawnPoint

signal ball_collided(ball_ref, collided_obj)
#signal ball_collided(ball_ref: Ball, collided_obj: Object)


@export var paddle: Paddle
@export var spawn_freeze: int = 3
@export var paddle_distance: int = 100

@onready var timer: Timer = $Timer

var ball_ref: Ball = null


func spawn_ball() -> void:
	var ball_scene: PackedScene = load("res://entities/ball/ball.tscn")
	var ball: Ball = ball_scene.instantiate()
	ball_ref = ball
	ball.direction = Vector2.ZERO
	ball.global_position = paddle.global_position + Vector2(0, -paddle_distance)
	ball.connect("collided", _on_ball_collision)
	add_sibling(ball)
	timer.start(spawn_freeze)


func _on_timer_timeout() -> void:
	ball_ref.direction = Vector2(0, 1)


func _on_ball_collision(ball_ref: Ball, collided_wth: Object) -> void:
	emit_signal("ball_collided", ball_ref, collided_wth)
