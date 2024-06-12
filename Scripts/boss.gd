extends CharacterBody2D
var LaserReady = true 
var StompReady = true 
@onready var player = get_node("/root/bossRoom/Player")
signal Shoot

func _physics_process(delta):
	var PlayerPosition = player.global_position
	var direction = global_position.direction_to(player.global_position)
	if PlayerPosition > global_position:
		%sprite.scale.x = 0.338
		velocity = direction * 150.0
		move_and_slide()
	elif PlayerPosition < global_position:
		%sprite.scale.x = -0.326
		velocity = direction * 150.0
		move_and_slide()

func _on_hurt_box_body_entered(body):
	if body.has_method("takeDamage"):
		body.takeDamage()


func _on_stopm_area_body_entered(body):
	pass # Replace with function body.


func laser():
	if LaserReady == true:
		emit_signal("Shoot")
		%sprite.play("laserCharge")
		await get_tree().create_timer(1.5).timeout
		%laserCoolDown.start()
		LaserReady = false

func _on_laser_cool_down_timeout():
	%laserCoolDown.stop()
	LaserReady = true
	laser()
	
