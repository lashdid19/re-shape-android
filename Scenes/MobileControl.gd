extends Node2D

export var rightButton = false
export var leftButton = false
export var upButton = false

func _on_right_pressed():
	rightButton = true
	print("right pressed")

func _on_right_released():
	rightButton = false

func _on_left_pressed():
	leftButton = true

func _on_left_released():
	leftButton = false

func _on_up_pressed():
	upButton = true

func _on_up_released():
	upButton = false

func _on_restart_pressed():
	get_tree().reload_current_scene()
