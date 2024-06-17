extends AnimatedSprite2D
const startScreen = "res://Scenes/start_menu.tscn"
var musicPlaying = true

func playMusic():
	if musicPlaying == false:
		%music.play()
		musicPlaying = true



func _on_animation_finished():
	get_tree().change_scene_to_file(startScreen)


func _on_audio_stream_player_2d_finished():
	musicPlaying = false
