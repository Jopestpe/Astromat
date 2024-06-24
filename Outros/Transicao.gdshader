shader_type canvas_item;

uniform float Diametro : hint_range(0.0,2.0);
uniform float Largura;
uniform float Altura;
uniform float Posicao_Y : hint_range(0.0,2.0);
uniform float Posicao_X : hint_range(0.0,2.0);
uniform float Centro: hint_range(0.0,2.0);

void fragment(){
	float Raio = Largura / Altura;
	float Distancia = distance(vec2(Posicao_X,Posicao_Y),vec2(mix(Centro,UV.x,Raio),UV.y));
	COLOR.a = step(Diametro,Distancia);
}