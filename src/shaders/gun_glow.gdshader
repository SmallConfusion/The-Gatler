shader_type canvas_item;

#include "libraries/math.gdshaderinc"

global uniform float gun_heat;

void fragment() {
	COLOR = map4(vec4(1. - UV.y) * gun_heat * gun_heat * 2., vec4(0), vec4(1), COLOR, vec4(1, COLOR.g, COLOR.b, COLOR.a));
}