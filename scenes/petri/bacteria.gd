extends Area2D

signal food_seen(value, index)

var life := 100
@onready var sprite = $Sprite2D
@onready var health_label = $HealthLabel
@onready var eyes = [$Sprite2D/Eye1, $Sprite2D/Eye2, $Sprite2D/Eye3, $Sprite2D/Eye4, $Sprite2D/Eye5, $Sprite2D/Eye6, $Sprite2D/Eye7]

func _process(delta: float) -> void:
	if Input.is_action_pressed('turn_left'):
		sprite.rotate(-delta)
	if Input.is_action_pressed('turn_right'):
		sprite.rotate(delta)
	if Input.is_action_pressed("move_forward"):
		translate(Vector2(0, -1).rotated(sprite.rotation))
	if Input.is_action_pressed("move_back"):
		translate(Vector2(0, 1).rotated(sprite.rotation))
	var index = 0
	for eye in eyes:
		if eye.is_colliding():
			food_seen.emit(true, index)
		else:
			food_seen.emit(false, index)
		index += 1

func update_life(value: int):
	life += value
	health_label.text ="%s" % life
