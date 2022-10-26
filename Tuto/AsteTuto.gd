extends StaticBody2D
var cena
var meunum 
var res
func _ready():
	cena = get_tree().get_current_scene()
	$Label.text = '14'
func _process(delta):
	$AnimatedSprite.rotation += 1 * delta
func mn():
	res = cena.res()
	var al = randi()%5+1
	if al == 1:
		meunum = res
	else:
		meunum = randi()%101+1
func dano():
	cena.er()
	
	cena.vida()
	cena.conta()
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
