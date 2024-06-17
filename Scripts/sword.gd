extends Area2D
var hittingBoss = false


func _ready():
	%Timer.start()


func _on_timer_timeout():
	%Timer.stop()
	queue_free()


func _on_area_entered(area):
	if area.has_method("EnemyTakeDamage"):
		area.EnemyTakeDamage()
	elif area.has_method("isboss"):
		hitBoss()
		queue_free()

func Sword():
	pass

func hitBoss():
	Inventory.bossHealth -= 1
