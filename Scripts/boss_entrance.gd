extends Node2D
const bossRoom = "res://Scenes/boss_room.tscn"
const mainLevel = "res://Scenes/main_level.tscn"

func _on_portal_body_entered(body):
	get_tree().change_scene_to_file(bossRoom)


func _on_portal_2_body_entered(body):
	get_tree().change_scene_to_file(mainLevel)
