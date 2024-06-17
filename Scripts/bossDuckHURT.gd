extends Area2D

func EnemyTakeDamage():
	get_parent().queue_free()
