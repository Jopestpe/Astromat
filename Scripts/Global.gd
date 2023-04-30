extends Node

var _EstaTelaCheia = false

func _ready():
	var Pedido = HTTPRequest.new()
	add_child(Pedido)
	Pedido.request_completed.connect(self._pedido_Sucesso)
	var _PedidoErro = Pedido.request("https://gitlab.com/jopestpe/V/-/raw/main/Astromat.txt")
	if OS.has_feature("SharedArrayBuffer"):
		print("SharedArrayBuffer is supported")
	else:
		print("SharedArrayBuffer is not supported")
			
func _pedido_Sucesso(_result, _response_code, _headers, _body):
	var Texto = _body.get_string_from_utf8()
	if Texto == "1":
		JavaScriptBridge.eval("location.reload(true);")

func _input(_event):
	if Input.is_action_just_pressed("TelaCheia"):
		if _EstaTelaCheia == false:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			_EstaTelaCheia = true
		elif _EstaTelaCheia == true:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			_EstaTelaCheia = false
	if Input.is_action_just_pressed("Voltar"):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		_EstaTelaCheia = false
