extends Marker2D
@onready var player = get_node("/root/bossRoom/Player")


func _physics_process(_delta):
	pass

func shoot():
	const BULLET = preload("res://Scenes/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %laserPoint.global_position
	new_bullet.global_rotation = %laserPoint.global_rotation
	%laserPoint.get_parent().add_child(new_bullet)



func _on_boss_shoot():
	shoot()
