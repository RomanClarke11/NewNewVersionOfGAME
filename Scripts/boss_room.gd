extends Node2D
var PlayerHealth = Inventory.health
var musicPlaying = true

func playMusic():
	if musicPlaying == false:
		%music.play()
		musicPlaying = true
		



func _ready():
	if PlayerHealth == 5:
		%Player/Camera2D/Heart2.play("5")
	elif PlayerHealth == 4:
		%Player/Camera2D/Heart2.play("4")
	elif PlayerHealth == 3:
		%Player/Camera2D/Heart2.play("3")
	elif PlayerHealth == 2:
		%Player/Camera2D/Heart2.play("2")
	elif PlayerHealth == 1:
		%Player/Camera2D/Heart2.play("1")
	elif PlayerHealth == 0:
		%Player/Camera2D/Heart2.play("0")
		
func _process(delta):
	if Inventory.playerHit == true:
		%Player/Camera2D/Blood.visible = true
		%Player/Camera2D/Blood.play("default")
		PlayerHealth -= 1
		Inventory.playerHit = false
		await get_tree().create_timer(0.5).timeout
		%Player/Camera2D/Blood.visible = false
		
	if PlayerHealth == 5:
		%Player/Camera2D/Heart2.play("5")
	elif PlayerHealth == 4:
		%Player/Camera2D/Heart2.play("4")
	elif PlayerHealth == 3:
		%Player/Camera2D/Heart2.play("3")
	elif PlayerHealth == 2:
		%Player/Camera2D/Heart2.play("2")
	elif PlayerHealth == 1:
		%Player/Camera2D/Heart2.play("1")
	elif PlayerHealth == 0:
		%Player/Camera2D/Heart2.play("0")
		get_tree().change_scene_to_file("res://Scenes/death_level.tscn")


func _on_audio_stream_player_2d_finished():
	musicPlaying = false
