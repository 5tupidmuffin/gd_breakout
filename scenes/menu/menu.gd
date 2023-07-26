extends Node2D


func _ready() -> void:
	RenderingServer.set_default_clear_color(Color.BLACK)


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game/game.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
