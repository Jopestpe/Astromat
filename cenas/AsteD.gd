extends StaticBody2D
var cena
var meunum 
var res
func _ready():
	cena = get_tree().get_current_scene()
	mn()
	$Label.text = str(meunum)
func _process(delta):
	$AnimatedSprite.rotation += 1 * delta
	position.x -= 150 * delta
func mn():
	res = cena.res()
	var al = randi()%5+1
	if al == 1:
		meunum = res
	else:
		meunum = randi()%101+1
func dano():
	res = cena.res()
	if res == meunum:
		$AudioStreamPlayer2D.play()
		$AnimatedSprite.play('destroi')
		$Timer.start()
	else:
		cena.er()
		cena.vida()
		cena.conta()
func _on_Area2D_body_entered(body):
	var ti = body.nome()
	if ti == 'tiro'or'nave':
		body.dano()
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
	cena.pontuar()
	cena.conta()
func qfr():
	queue_free()
