extends Sprite
var collided = false
signal collected;

func _on_Area2D_body_entered(body):
	if body.is_in_group("char") and not collided:
		$collected.play()
		emit_signal("collected")
		$Sprite.visible = false
		$CPUParticles2D.emitting = true
		$Timer.start()

func _on_Area2D_body_exited(body):
	if body.is_in_group("char") :
		collided = true

func _on_Timer_timeout():
	queue_free()
