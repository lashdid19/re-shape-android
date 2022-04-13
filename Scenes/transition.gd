extends Control

export var scene = "res://Scenes/Level Demo.tscn"

func _input(event):
	if event.is_action_pressed("restart") :
		get_tree().reload_current_scene()

func _physics_process(_delta):
	if get_tree().get_nodes_in_group("char").size() == 0 :
		get_tree().reload_current_scene()

func _ready():
	$AnimationPlayer.play("open")

func _on_door_finish():
	$close.play()
	$AnimationPlayer.play("close")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "close" :
		get_tree().change_scene(scene)
		get_node("../").queue_free()
