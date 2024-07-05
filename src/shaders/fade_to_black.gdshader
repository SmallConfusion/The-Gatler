shader_type canvas_item;

void fragment() {
	// map from 1 to 0 to color.rgb to 0
	COLOR.rgb = COLOR.rgb * (1. - UV.y);
}