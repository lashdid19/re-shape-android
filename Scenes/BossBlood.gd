extends TextureRect

func _on_boss_button_hit_boss():
	margin_right -= 115
	if margin_right < 100 :
		queue_free()
