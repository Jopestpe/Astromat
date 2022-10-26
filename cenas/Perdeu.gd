extends Control
var control
var cena
var cepo
func _ready():
	var enemies = get_tree().get_nodes_in_group("Asteroides")
	for ast in enemies:
		ast.queue_free()
	cena = get_tree().get_current_scene()
func _process(delta):
	$Asteroid.rotation += 1 * delta
func _on_Button_pressed():
	control = get_tree().change_scene("res://cenas/Jogo.tscn")
func vempo():
	cena.perdeu()
	show()
	cepo = cena.po()
	$perpo.text = str(cepo)
