shader_type spatial;

uniform sampler2D DEPTH_TEXTURE : hint_depth_texture, filter_linear_mipmap;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_nearest;
uniform sampler2D NORMAL_TEXTURE : hint_normal_roughness_texture, filter_nearest;

render_mode unshaded, fog_disabled;

void vertex() {
	POSITION = vec4(VERTEX.xy, 1.0, 1.0);
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
	
	
	// DEPTH TEST
	/*
	float depth = texture(DEPTH_TEXTURE, SCREEN_UV).x;
	ALBEDO = vec3(10.0) * depth;
	*/

}

float get_linear_depth(vec2 s_UV, sampler2D depth_texture, mat4 inv_projection_matrix){
	float depth = texture(depth_texture, s_UV).x;
	vec3 ndc = vec3(s_UV * 2.0 -1.0, depth);
	vec4 view = inv_projection_matrix * vec4(ndc, 1.0);
	view.xyz /= view.w;
	return -view.z;
}


//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
