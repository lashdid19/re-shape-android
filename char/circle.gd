extends KinematicBody2D

var velocity = Vector2(0,0)
const SPEED = 300
var JUMPFORCE = -800
const GRAVITY = 40
export var alive = true

signal die(body);

func _physics_process(delta):
	var MobileControl = get_node("../../MobileControl")
	
	$TextureRect.visible = false
	if alive :
		$TextureRect.visible = true
		if Input.is_action_pressed("right") or MobileControl.rightButton:
			velocity.x = SPEED
		elif Input.is_action_pressed("left") or MobileControl.leftButton:
			velocity.x = -SPEED

		if is_on_floor() and $JumpTime.time_left > 0 :
			$JumpTime.stop()

		if Input.is_action_just_pressed("jump") or MobileControl.upButton and $JumpTime.time_left == 0:
			$JumpTime.start()
			JUMPFORCE = -800
			velocity.y += JUMPFORCE

		$CPUParticles2D.gravity.x = -velocity.x / 6
		if velocity.y == 40 :
			$CPUParticles2D.gravity.y = 0
		else :
			$CPUParticles2D.gravity.y = -velocity.y / 10
		
		velocity = move_and_slide(velocity, Vector2.UP)
		
		velocity.y += GRAVITY
		
		velocity.x = lerp(velocity.x, 0, 0.2)

func die() :
	emit_signal("die", $".")

func _on_JumpTime_timeout():
	JUMPFORCE = false

func _on_triangle_die(_body):
	alive = true

func _on_square_die(_body):
	alive = true
