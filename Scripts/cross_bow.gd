extends Area2D
@onready var player = get_node("/root/boss_room/Player")


func _physics_process(_delta):
		look_at(player.global_position)
#shoots the bullet 
func shoot():
	const BULLET = preload("res://Scenes/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.get_parent().add_child(new_bullet)
	%WeaponPivot/AnimatedSprite2D.play("default")
	

func _on_timer_timeout():
	shoot()

func damage():
	queue_free()
