extends StaticBody2D
var cena
var meunum 
var res
func _ready():
	cena = get_tree().get_current_scene()
	$Label.text = '100'
func _process(delta):
	$AnimatedSprite.rotation += 1 * delta
func dano():
	$AudioStreamPlayer2D.play()
	$AnimatedSprite.play('destroi')
	$Timer.start()
func _on_Area2D_body_entered(body):
	var ti = body.nome()
	if ti == 'tiro'or'nave':
		body.dano()
		cena.colid()
	else:
		pass
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
func nome():
	var nome='aste'
	return nome
func _on_Timer_timeout():
	prox()
	qfr()
func prox():
	cena.tutofim()
	cena.pontuar()
	cena.conta()
func qfr():
	queue_free()
	
