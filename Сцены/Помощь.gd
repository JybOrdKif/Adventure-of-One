extends Node2D


func _ready():
	$"Button_Quit/Текст кнопки32".text = "Выйти"
	$"Button_Quit/Текст кнопки32".visible = true
	$"Button_Quit/Текст кнопки24".visible = false

func _on_Button_Quit_pressed():
	get_tree().change_scene("res://Сцены/Меню.tscn")
