extends CharacterBody2D

signal health_depleted

const speed = 600
var current_dir = 'none'
var health = 100.0

	
func _physics_process(delta):
	player_movement(delta)
	
	const DAMAGE_RATE = 10.0	
	var overlapping_mobs = %hurtBox.get_overlapping_bodies()


	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			health_depleted.emit()
	
	
func player_movement(delta):
	
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()
	
	if Input.is_action_pressed('ui_right'):
		current_dir = 'right'
		velocity.x = speed
		velocity.y = 0
		
	elif Input.is_action_pressed('ui_left'):
		current_dir = 'left'
		velocity.x = -speed
		velocity.y = 0
		
	elif Input.is_action_pressed('ui_up'):
		current_dir = 'up'
		velocity.x = 0
		velocity.y = -speed
		
	elif Input.is_action_pressed('ui_down'):
		current_dir = 'down'
		velocity.x = 0
		velocity.y = speed
		
	else:
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()
	
	




	
#func player_action():
	#if Input.is_action_pressed('ui_')
	
