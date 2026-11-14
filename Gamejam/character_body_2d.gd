extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -900

var doublejump := false
var dash := false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else: 
		doublejump = false
	
	# Handle jump.
	if Input.is_action_just_pressed("Jump") and (is_on_floor()or !doublejump):
		velocity.y = JUMP_VELOCITY
		if !is_on_floor():
			doublejump = true
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction:
		if dash: 
			$"..". position.x += 5
		else:
			velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	
	if Input.is_action_just_pressed("Pogo") and is_on_wall():
		velocity.y = JUMP_VELOCITY*2
	move_and_slide()
