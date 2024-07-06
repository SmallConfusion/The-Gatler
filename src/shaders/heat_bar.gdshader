shader_type canvas_item;

uniform float t = 0;

uniform sampler2D gradient : source_color;

uniform bool red = false;

const float min_d = 0.3;
const float max_d = 0.8;

const float outline_size = 0.03;


void fragment() {
	vec2 uv = UV * 2. - 1.;
	
	vec3 col;
	
	if (red) {
		col = texture(gradient, vec2(1, 0)).rgb;
	} else {
		col = texture(gradient, vec2(t, 0)).rgb;
	}
	
	
	float d = length(uv);
	
	float a = atan(uv.y/uv.x) / TAU;
	a += 0.5 * step(uv.x, 0);
	
	COLOR.rgb = col;
	
	COLOR = mix(COLOR, vec4(0.2, 0.2, 0.2, 1), step(a + 0.25, t));
	COLOR = mix(COLOR, vec4(0, 0, 0, 1), float(d > max_d && d < max_d + outline_size || d < min_d && d > min_d - outline_size));
	
	COLOR.a = float(d > min_d - outline_size && d < max_d + outline_size);
}