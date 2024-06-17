extends Area2D

func _ready():
	await get_tree().create_timer(1.0).timeout
	queue_free()


func _on_body_entered(body):
	if body.has_method("takeDamage"):
		body.takeDamage()
		queue_free()
	
