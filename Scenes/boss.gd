extends Sprite

var life = 10
signal end

func _on_Area2D_body_entered(body):
	if body.is_in_group("char") and body.alive:
		body.die()

func _on_boss_button_hit_boss():
	life -= 1
	$blink.play("blink")
	$roar.play()
	if life == 0 :
		emit_signal("end")
		queue_free()
