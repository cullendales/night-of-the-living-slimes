extends CharacterBody2D

@onready var player = get_node('/root/Game/Player')

var health = 1

func _ready():
	%Slime.play_walk()

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300
	move_and_slide()

func take_damage():
	health -= 1
	%Slime.play_hurt()
	
	
	if health == 0:
		queue_free()
		
		const SMOKE_SCENE = preload("res://images/smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
