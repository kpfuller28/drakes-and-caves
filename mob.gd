extends CharacterBody2D
@export var max_health = 10
@export var speed = 300
@onready var player = get_node("/root/Game/Player")
func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction.normalized() * speed
	move_and_slide()
