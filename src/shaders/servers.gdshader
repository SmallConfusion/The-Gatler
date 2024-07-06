shader_type canvas_item;

uniform sampler2D light_color : repeat_enable;

void fragment() {
	if (bvec4(true) == lessThanEqual(COLOR, vec4(0.02, 0.02, 0.02, 1))) {
		COLOR = texture(light_color, UV + vec2(TIME * 2., TIME));
	}
}