extends TextureButton

func _on_Play_Button_pressed():
	get_tree().change_scene("res://Scenes/Level 1.tscn")

func _on_Credits_Button_pressed():
	get_tree().change_scene("res://Scenes/Credits.tscn")
