extends Button


func _on_Button_with_snakes_mouse_entered():
	$"Zmei/AnimationPlayer".play("Движение змей")
func _on_Button_with_snakes_mouse_exited():
	$"Zmei/AnimationPlayer".stop()
