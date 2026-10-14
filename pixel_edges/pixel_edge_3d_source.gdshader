shader_type spatial;

uniform sampler2D DEPTH_TEXTURE : hint_depth_texture, filter_linear_mipmap;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_nearest;
uniform sampler2D NORMAL_TEXTURE : hint_normal_roughness_texture, filter_nearest;

render_mode unshaded, fog_disabled;

float get_linear_depth(vec2 s_uv, sampler2D depth_texture, mat4 inv_projection_matrix){
	float depth = texture(depth_texture, s_uv).x;
	vec3 ndc = vec3(s_uv * 2.0 -1.0, depth);
	vec4 view = inv_projection_matrix * vec4(ndc, 1.0);
	view.xyz /= view.w;
	return -view.z;
}

vec3 get_normal(vec2 uv, sampler2D normal_texture){
	vec3 normal = texture(normal_texture, uv).rgb;
	normal = normal * 2.0 - 1.0;
	return normal;
}

void vertex() {
	POSITION = vec4(VERTEX.xy, 1.0, 1.0);
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 texel_size = 1.0 / VIEWPORT_SIZE.xy;
	
	vec2 four_way_offsets[4];
	four_way_offsets[0] = SCREEN_UV + vec2(-1.0, 0.0) * texel_size;
	four_way_offsets[1] = SCREEN_UV + vec2(1.0, 0.0) * texel_size;
	four_way_offsets[2] = SCREEN_UV + vec2(0.0, -1.0) * texel_size;
	four_way_offsets[3] = SCREEN_UV + vec2(0.0, 1.0) * texel_size;
	
	float depth = get_linear_depth(SCREEN_UV, DEPTH_TEXTURE, INV_PROJECTION_MATRIX);
	float depth_left = get_linear_depth(four_way_offsets[0], DEPTH_TEXTURE, INV_PROJECTION_MATRIX);
	float depth_right = get_linear_depth(four_way_offsets[1], DEPTH_TEXTURE, INV_PROJECTION_MATRIX);
	float depth_up = get_linear_depth(four_way_offsets[2], DEPTH_TEXTURE, INV_PROJECTION_MATRIX);
	float depth_down = get_linear_depth(four_way_offsets[3], DEPTH_TEXTURE, INV_PROJECTION_MATRIX);
	
	float depth_diff = (depth_left - depth) + (depth_right - depth) + (depth_up - depth) + (depth_down - depth);
	
	// DEPTH TEST
    //ALBEDO = vec3(10.0) * depth_diff;

	

}




//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
