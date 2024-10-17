varying vec2 v_vTexcoord;
varying vec3 v_vPosition;
uniform vec2 u_Texel;

void main() {
	vec4 colour = vec4(0.0);
	vec2 neighbours[4];
	neighbours[0] = vec2(u_Texel.x, 0.0);
	neighbours[1] = vec2(0.0, u_Texel.y);
	neighbours[2] = vec2(-u_Texel.x, 0.0);
	neighbours[3] = vec2(0.0, -u_Texel.y);
		
	for (int i = 0; i < 4; ++i) {
		vec4 pixel = texture2D(gm_BaseTexture, v_vTexcoord + neighbours[i]);
		colour.a = pixel.a;
		if (colour.a == 1.0)
			break;
	}
	colour.a *= 1.0 - floor(texture2D(gm_BaseTexture, v_vTexcoord).a);
	gl_FragColor = vec4(colour.rgb * colour.a, colour.a);
}
