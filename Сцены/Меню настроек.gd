extends Node2D

onready var sl = get_node("/root/Slojnost")

func _ready():
	$"Ползунок сложности".value = (int(sl.text)- 1)*50
	
	$"Button_Quit/Текст кнопки32".text = "Выйти"
	$"Button_Quit/Текст кнопки32".visible = true
	$"Button_Quit/Текст кнопки24".visible = false
func _process(delta):
	sl.text = str($"Ползунок сложности".value/50 + 1)

func _on_Button_Quit_pressed():
	#print(sl.text)
	get_tree().change_scene("res://Сцены/Меню.tscn")
