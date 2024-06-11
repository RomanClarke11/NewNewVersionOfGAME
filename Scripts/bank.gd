extends ColorRect
var musicPlaying = true
var gold 
var bankGold
func playMusic():
	if musicPlaying == false:
		%music.play()
		musicPlaying = true


func _ready():
	%ColorRect/startScreen.visible = true
	%ColorRect/input.visible = false
	%ColorRect/withdraw.visible = false

func _process(delta):
	var gold = Inventory.gold
	var bankGold = Inventory.bankGold
	%ColorRect/gold.text = str(gold)
	%ColorRect/bankGold.text = str(bankGold)
	if Input.is_action_just_pressed("esc"):
		%ColorRect/startScreen.visible = true 
		%ColorRect/withdraw.visible = false
		%ColorRect/input.visible = false


func _on_button_pressed():
	%ColorRect/withdraw.visible = true
	%ColorRect/startScreen.visible = false

	
func _on_button_2_pressed():
	%ColorRect/input.visible = true
	%ColorRect/withdraw.visible = false
	%ColorRect/startScreen.visible = false


func _on_g_pressed():
	if Inventory.bankGold >= 1:
		Inventory.bankGold -= 1
		Inventory.gold += 1


func _on_five_g_pressed():
	if Inventory.bankGold >= 10:
		Inventory.bankGold -= 10
		Inventory.gold += 10


func _on_fifty_g_pressed():
	if Inventory.bankGold >= 50:
		Inventory.bankGold -= 50
		Inventory.gold += 50


func _on_all_pressed():
	Inventory.gold += Inventory.bankGold
	Inventory.bankGold = 0


func _on_g_in_pressed():
	if Inventory.gold >= 1:
		Inventory.gold -= 1
		Inventory.bankGold += 1


func _on_five_g_in_pressed():
	if Inventory.gold >= 10:
		Inventory.gold -= 10
		Inventory.bankGold += 10


func _on_fifty_in_pressed():
	if Inventory.gold >= 50:
		Inventory.gold -= 50
		Inventory.bankGold += 50


func _on_all_in_pressed():
	Inventory.bankGold += Inventory.gold
	Inventory.gold = 0


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_level.tscn")


func _on_audio_stream_player_2d_finished():
	musicPlaying = false
