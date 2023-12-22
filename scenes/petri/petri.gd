extends Node2D

@export var food_scene: PackedScene
@onready var eyes := [$Eye1, $Eye2, $Eye3, $Eye4, $Eye5, $Eye6, $Eye7]

func spawn_food() -> void:
	var food = food_scene.instantiate()
	var size = get_viewport().size
	food.position = Vector2(randf_range(0, size.x), randf_range(0, size.y))
	food.is_eaten.connect(_on_food_is_eaten)
	add_child(food)

func _ready() -> void:
	spawn_food()

func _on_food_is_eaten() -> void:
	spawn_food()


func _on_bacteria_food_seen(value: Variant, index: int) -> void:
	if value:
		eyes[index].color = Color(0, 0, 1)
	else:
		eyes[index].color = Color(0, 0, 0)
