extends CharacterBody2D


@export var speed = 600
var attacking = false
@onready var animation_tree = $AnimationTree
@onready var state_machine: AnimationNodeStateMachinePlayback = $AnimationTree.get("parameters/playback")
#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("Light Attack") and not attacking:
		#attacking = true
		#%AnimatedSprite2D.play("Light Attack")
	#elif event.is_action_pressed("Heavy Attack") and not attacking:
		#attacking = true
		#%AnimatedSprite2D.play("Heavy Attack")$AnimationTree
func _physics_process(delta: float) -> void:
	
	var direction = Input.get_vector("move left", "move right", "move up", "move down").normalized()
	velocity = direction * speed
	update_blend(direction)
	movement()
	move_and_slide()
	
func update_blend(value):
	if value == Vector2.ZERO:
		return
	animation_tree.set("parameters/idle/blend_position", value)
	animation_tree.set("parameters/walk/blend_position", value)
	
func movement():
	if is_zero_approx(velocity.length()):
		state_machine.travel("idle")
	else:
		state_machine.travel("walk")
	#if velocity.x < 0:
		#print(velocity.x)
		#%AnimatedSprite2D.play("Walk_Left")
	#elif velocity.x > 0:
		#%AnimatedSprite2D.play("Walk_Right")
	#elif velocity.y > 0:
		#%AnimatedSprite2D.play("Walk_Down")
	#elif velocity.y < 0: 
		#%AnimatedSprite2D.play("Walk_Up")
	#else:
		#%AnimatedSprite2D.play("Idle_Down")
	#
	

		
