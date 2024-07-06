shader_type canvas_item;

#include "libraries/math.gdshaderinc"

uniform float t = 0.0;

uniform vec2 scale = vec2(2, 0.1);
uniform float outline_width = 0.015;


void fragment() {
	vec4 c = vec4(0.2, 0.2, 0.2, 1);
	c = mix(c, vec4(1, 0, 0, 1), step(UV.x, map(t, 0, 1, outline_width / scale.x, 1. - outline_width / scale.x)));
	c = mix(c, vec4(0, 0, 0, 1), float(UV.x < outline_width / scale.x || UV.x > 1. - outline_width / scale.x ||
										UV.y < outline_width / scale.y || UV.y > 1. - outline_width / scale.y));
										
	c = mix(vec4(0, 0, 0, 0), c, step(t, 0.999));
	
	COLOR = c;
}