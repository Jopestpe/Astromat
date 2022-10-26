extends Control
func _on_Button_pressed():
	get_tree().change_scene("res://cenas/Jogo.tscn")
func _on_Button2_pressed():
	get_tree().quit()
func _on_Button3_pressed():
	get_tree().change_scene("res://cenas/sobre.tscn")
