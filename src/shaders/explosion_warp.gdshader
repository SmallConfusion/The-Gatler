shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture;
uniform float t = 0.;

void fragment() {
	vec2 uv = UV * 2. - 1.;
	
	float d = length(uv);
	
	float x = sin(d * 10. + t * -10.) * 0.02 * sin(t * PI);
	
	vec2 offset = vec2(x, x) * uv * max(1.-d, 0);
	
	COLOR = texture(screen_texture, SCREEN_UV + offset);
}