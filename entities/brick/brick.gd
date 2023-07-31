extends StaticBody2D
class_name Brick


enum BrickColor { RED, ORANGE, GREEN, YELLOW }
@export var brick_color: BrickColor

@onready var color_rect: ColorRect = $ColorRect
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

const brick_colors := {
	BrickColor.RED: Color("#a31e0a"),
	BrickColor.ORANGE: Color("#c2850a"),
	BrickColor.GREEN: Color("#0a8533"),
	BrickColor.YELLOW: Color("#c2c229"),
}


func _ready() -> void:
	set_color(brick_color)
	color_rect.set_size(get_size())


func get_size() -> Vector2:
	return Vector2(
		collision_shape_2d.shape.size.x,
		collision_shape_2d.shape.size.y,
	)


func set_color(new_color: BrickColor) -> void:
	color_rect.set_color(brick_colors[new_color])
