extends Area2D
const BANK = "res://Scenes/bank.tscn"

func _on_body_entered(body):
	if body.has_method("pickUpGold"):
		get_tree().change_scene_to_file(BANK)
