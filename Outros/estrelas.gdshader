shader_type canvas_item;

uniform sampler2D sampler2D_estrela;

void fragment() {
    float velocidade = 0.1;
    vec2 novaUV = vec2(fract(UV.x - TIME * velocidade), UV.y);
    vec4 cor_estrela = texture(sampler2D_estrela, novaUV);

    COLOR = cor_estrela;
}