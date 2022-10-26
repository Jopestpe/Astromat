extends KinematicBody2D
var tiro = preload("res://cenas/Tiro.tscn")
var tt = true
var ca = 0.5
var tela
var cena
var vida 
var control
var dan=true
func _ready():
	tela = get_viewport_rect().size
	position = tela / 2
	cena = get_tree().get_current_scene()
func _process(_delta):
	look_at(get_global_mouse_position())
	if Input.is_action_pressed('tiro') and tt:
		$AudioStreamPlayer2D.play()
		var tiroi = tiro.instance()
		tiroi.position=position
		tiroi.rotation=rotation
		tiroi.apply_impulse(Vector2(),Vector2(1000,0).rotated(rotation)) 
		get_tree().get_root().add_child(tiroi)
		tt = false
		$ttiro2.start()
	if position.x > tela.x:
			position.x = 0
	if position.x < 0:
			position.x = tela.x
	if position.y > tela.y:
			position.y = 0
	if position.y < 0:
			position.y = tela.y
func _physics_process(_delta):
	var m = Vector2()
	if Input.is_action_pressed('ui_right'):
		m.x += 1
	if Input.is_action_pressed('ui_left'):
		m.x -= 1
	if Input.is_action_pressed('ui_down'):
		m.y += 1
	if Input.is_action_pressed('ui_up'):
		m.y -= 1
	m = m * 300
	m = move_and_slide(m)
	vida = cena.vi()
	if vida == 0:
		queue_free()
		control = get_tree().change_scene("res://Tuto/Tutorial.tscn")
func dano():
	$AudioStreamPlayer2D2.play()
	vida = cena.vi()
	vida-=1
	cena.vida()
	if dan:
		$danotimer2.start()
		$AnimatedSprite.play('dano')
func destroir():
	pass
func nome():
	var nome='nave'
	return nome
func _on_Timer_timeout():
	tt = true
func vi():
	pass
func _on_danotimer2_timeout():
	$AnimatedSprite.play('norm')
