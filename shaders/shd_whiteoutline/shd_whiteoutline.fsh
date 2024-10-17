varying vec2 v_vTexcoord;
varying vec3 v_vPosition;
uniform vec2 u_Texel;
uniform float u_Alpha;

void main() {
	vec4 colour = vec4(1.0, 1.0, 1.0, 1.0);
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
	colour.a *= u_Alpha;
	gl_FragColor = colour;
}
