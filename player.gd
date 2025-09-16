extends CharacterBody2D

@export var speed = 600
var attacking = false
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Light Attack") and not attacking:
		attacking = true
		%AnimatedSprite2D.play("Light Attack")
	elif event.is_action_pressed("Heavy Attack") and not attacking:
		attacking = true
		%AnimatedSprite2D.play("Heavy Attack")

func _physics_process(delta: float) -> void:
	
	
		
	var direction = Input.get_vector("move left", "move right", "move up", "move down")
	velocity = direction.normalized() * speed
	move_and_slide()
	
	if not attacking:
		if velocity.x < 0:
			%AnimatedSprite2D.flip_h = true
		elif velocity.x > 0:
			%AnimatedSprite2D.flip_h = false
		if velocity.length() > 0.0:
			%AnimatedSprite2D.play("Walk")
		else:
			%AnimatedSprite2D.play("Idle")
	
	
func _on_animated_sprite_2d_animation_finished() -> void:
	if attacking:
		attacking = false
		
