extends Area2D

onready var raio = $CollisionShape2D.shape.radius
var toque = false
var Velocidade_Nave = 15 * 1000
var dispara = false
var dedos = {}
var distancia = Vector2(0,0)

func _on_TextureRect_gui_input(event):
	if (event is InputEventMouseButton && event.pressed && event.button_index == 1):
		var _Voltar = get_tree().change_scene("res://Cenas/Inicial.tscn")
		
func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			dedos[event.index] = event.position
		if dedos.size() <= 1:
			dispara = false
		elif dedos.size() > 1:
			dispara = true
		distancia = dedos[0].distance_to($Circulo_Grande.global_position)
		if not toque:
			if distancia < raio:
				toque = true
		else:
			$Circulo_Pequeno.position = Vector2(0,0)
			toque = false
		
func _physics_process(_delta):
	if toque:
		$Circulo_Pequeno.global_position = get_global_mouse_position()				
		$Circulo_Pequeno.position = $Circulo_Grande.position + \
		($Circulo_Pequeno.position - $Circulo_Grande.position).limit_length(float(raio))
		var Mover = Vector2(0,0)
		Mover.x = $Circulo_Pequeno.position.x / raio
		Mover.y = $Circulo_Pequeno.position.y / raio
		if get_parent().get_parent().name == "Espaco":
			if get_parent().get_parent().has_node("Nave"):
				get_parent().get_parent().get_node("Nave").look_at(Mover)
				Mover = (Mover * Velocidade_Nave) * _delta
				get_parent().get_parent().get_node("Nave").move_and_slide(Mover)
				get_parent().get_parent().get_node("Nave").look_at(
					get_parent().get_parent().get_node("Nave").global_position + Mover)
		if dispara:
			if get_parent().get_parent().name == "Espaco":
				if get_parent().get_parent().has_node("Nave"):
					get_parent().get_parent().get_node("Nave").Disparar()

