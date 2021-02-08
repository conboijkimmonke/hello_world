extends KinematicBody2D

const FLOOR= Vector2 (0,-1)
const GRAVITY = 10
const SPEED = 300
const JUMP_HEIGHT = 600
var motion = Vector2()
var on_ground = false

func _physics_process(_delta: float) -> void:
	motion.y += GRAVITY
	
	motion = move_and_slide(motion, FLOOR) 
	
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
		$AnimatedSprite.play("Run") 
		
	elif Input.is_action_pressed("ui_left") :
		motion.x= -SPEED
		$AnimatedSprite.play("Run")
		
	else:
		motion.x = SPEED - SPEED
	$AnimatedSprite.play("deafult")
	
	if is_on_floor():
		 if Input.is_action_pressed("ui_up"):
			 if on_ground == true:
			   motion.y = -JUMP_HEIGHT
			   on_ground = false
	if is_on_floor():
		on_ground = true
	else:
		on_ground = false
	
	

 
   
