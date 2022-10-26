extends Control
var control
func _ready():
	var enemies = get_tree().get_nodes_in_group("Asteroides")
	for ast in enemies:
		ast.queue_free()
	pass
func _on_Button_pressed():
	control = get_tree().change_scene("res://cenas/Jogo.tscn")
#func _on_Button2_pressed():
	#get_tree().quit()
func _on_Button3_pressed():
	control = get_tree().change_scene("res://cenas/sobre.tscn")
func _on_Button4_pressed():
	control = get_tree().change_scene("res://Tuto/Tutorial.tscn")
