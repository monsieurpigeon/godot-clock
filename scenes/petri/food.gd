extends Area2D
signal is_eaten

func _on_area_entered(area: Area2D) -> void:
	area.update_life(5)
	is_eaten.emit()
	queue_free()
