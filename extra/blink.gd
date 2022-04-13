extends TextureRect

func _on_circle_die(body):
	$dead.play()
	$AnimationPlayer.play("blink")
	body.queue_free()

func _on_square_die(body):
	$dead.play()
	$AnimationPlayer.play("blink")
	body.queue_free()

func _on_triangle_die(body):
	$dead.play()
	$AnimationPlayer.play("blink")
	body.queue_free()

func _on_boss_end():
	$dead.play()
	$AnimationPlayer.play("longer_blink")
