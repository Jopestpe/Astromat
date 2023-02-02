extends KinematicBody2D
var Disparo = preload("res://Cenas/Disparo.tscn")
var Carregado = true
var Velocidade_Disparo = 700
var Velocidade_Nave = 15 * 1000
var Mover = Vector2()

func _input(_event):
	if Input.is_action_pressed('DISPARAR') and not Global.Toque:
		Disparar()

func Disparar():
	if Carregado:
		$SomDisparo.play()
		var Intancia_Disparo = Disparo.instance()
		Intancia_Disparo.rotation_degrees = rotation_degrees 
		Intancia_Disparo.apply_impulse(Vector2(),Vector2(Velocidade_Disparo,0).rotated(rotation))
		Intancia_Disparo.global_position = global_position
		get_parent().add_child(Intancia_Disparo)
		Carregado = false
		$Recarregar.start()		
		
func _physics_process(_delta):
	if not Global.Toque:
		look_at(get_global_mouse_position())
	if position.x > get_viewport_rect().size.x:
			position.x = 0
	if position.x < 0:
			position.x = get_viewport_rect().size.x
	if position.y > get_viewport_rect().size.y:
			position.y = 0
	if position.y < 0:
			position.y = get_viewport_rect().size.y
	Mover = Vector2()
	if Input.is_action_pressed("DIREITA"):
		Mover.x += 1
	if Input.is_action_pressed("ESQUERDA"):
		Mover.x -= 1
	if Input.is_action_pressed("ATRAS"):
		Mover.y += 1
	if Input.is_action_pressed("FRENTE"):
		Mover.y -= 1
	Mover = (Mover * Velocidade_Nave) * _delta
	Mover = move_and_slide(Mover)
	
func Recarregado():
	Carregado = true


	
