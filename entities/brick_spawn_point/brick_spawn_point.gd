extends Node2D
class_name BrickSpawnPoint


@export var row_count: int = 8
@export var column_count: int = 17
@export var column_margin: float = 5
@export var row_margin: float = 4


func _ready() -> void:
	spawn_bricks()


func spawn_bricks() -> void:
	var brick_scene: PackedScene = preload("res://entities/brick/brick.tscn")
	var dummy_brick: Brick = brick_scene.instantiate()
	add_child(dummy_brick)
	var brick_size := dummy_brick.get_size()
	var spawn_point := Vector2.ZERO
	for row in row_count:
		for column in column_count:
			var brick: Brick = brick_scene.instantiate()
			brick.set_global_position(spawn_point)
			add_child(brick)
			spawn_point += Vector2(column_margin + brick_size.x, 0)
		spawn_point.x = 0
		spawn_point += Vector2(0, row_margin + brick_size.y)
	dummy_brick.queue_free()
