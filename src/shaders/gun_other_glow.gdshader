shader_type canvas_item;

#include "libraries/math.gdshaderinc"

global uniform float gun_heat;

uniform float y_pos = 0.;

void fragment() {
	COLOR = map4(vec4(y_pos) * gun_heat * gun_heat * 2., vec4(0), vec4(1), COLOR, vec4(1, COLOR.g, COLOR.b, COLOR.a));
}