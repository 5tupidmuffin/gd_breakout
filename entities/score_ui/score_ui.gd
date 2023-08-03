extends Node2D
class_name ScoreUI


@export var lives: int = 3
@export var score: int = 0

@onready var score_label: Label = $Background/Score
@onready var lives_label: Label = $Background/Lives


func _ready() -> void:
	update_score(score)
	update_lives(lives)


func update_score(new_score: int) -> void:
	score_label.set_text(str(new_score))


func update_lives(new_lives: int) -> void:
	lives_label.set_text(str(new_lives))


func _on_game_decrement_live() -> void:
	lives -= 1
	update_lives(lives)


func _on_game_increment_score(increment_by: int) -> void:
	score += increment_by
	update_score(score)
