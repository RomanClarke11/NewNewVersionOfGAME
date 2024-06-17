extends CharacterBody2D
var LaserReady = true 
var StompReady = true 
var helath = 30
@onready var player = get_node("/root/bossRoom/Player")
signal Shoot
var shooting = false
const credit = "res://Scenes/credit.tscn"

func _physics_process(_delta):
	if Inventory.bossHealth == 0:
		%sprite.play("boom")
		%sprite.scale.x = 0.893
		%sprite.scale.y = 0.798
		await get_tree().create_timer(1.0).timeout
		queue_free()
		get_tree().change_scene_to_file(credit)
	
	var PlayerPosition = player.global_position
	var direction = global_position.direction_to(player.global_position)
	while shooting == false:
		if PlayerPosition > global_position:
			%sprite.scale.x = 0.338
			velocity = direction * 150.0
			move_and_slide()
		elif PlayerPosition < global_position:
			%sprite.scale.x = -0.326
			velocity = direction * 150.0
			move_and_slide()
		break


func _on_hurt_box_body_entered(body):
	pass


func _on_stopm_area_body_entered(body):
	if body.has_method("pickUpGold"):
		if StompReady == true:
			StompReady = false
			%duckCoolDown.start()
			spawnDuck()


func laser():
	if LaserReady == true:
		shooting = true
		%sprite/laserPoint.look_at(player.global_position)
		%sprite.play("laserCharge")
		await get_tree().create_timer(1.0).timeout
		emit_signal("Shoot")
		await get_tree().create_timer(1.0).timeout
		%laserCoolDown.start()
		%sprite.play("a")
		LaserReady = false
		shooting = false

func _on_laser_cool_down_timeout():
	%laserCoolDown.stop()
	LaserReady = true
	laser()


func spawnDuck():
	const BULLET = preload("res://Scenes/boss_duck.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = global_position
	call_deferred("add_child", new_bullet)

func _on_duck_cool_down_timeout():
	StompReady = true 
	%duckCoolDown.stop()
