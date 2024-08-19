extends CharacterBody2D

var speed = 100
var dashS = 300
var Dashing = 0
var yDir = 0
var xDir = 0
var DashY = 0
var DashX = 0
func _physics_process(delta):
	velocity = Vector2()
	if Input.is_action_pressed("left") and Dashing == 0:
		velocity.x -= speed
		xDir = -1
	if Input.is_action_just_released("left"):
		xDir = 0
	if Input.is_action_pressed("right") and Dashing == 0:
		velocity.x += speed
		xDir = 1
	if Input.is_action_just_released("right"):
		xDir = 0

	if Input.is_action_pressed("up") and Dashing == 0:
		velocity.y -= speed
		yDir = -1
	if Input.is_action_just_released("up"):
		yDir = 0


	if Input.is_action_pressed("down") and Dashing == 0:
		velocity.y += speed
		yDir = 1
	if Input.is_action_just_released("down"):
		yDir = 0
#pls fix this entire dashing section it sucks MASSIVE balls
#needs deceleration instead of instant stop
	if Input.is_action_just_pressed("the_spell_called_dash"):
		$DashTimer.start()
		Dashing = 1
		DashY = yDir
		DashX = xDir
	if $DashTimer.time_left !=0:
		velocity.x += DashX*dashS
		velocity.y += DashY*dashS
	if $DashTimer.is_stopped() and Dashing ==1:
		velocity.x = 0
		velocity.y = 0
		Dashing = 0
	if Input.is_action_pressed("attack"):
		$Label.text = "Attacking"
	move_and_slide()
	look_at(get_global_mouse_position())
