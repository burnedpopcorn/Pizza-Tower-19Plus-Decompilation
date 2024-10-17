//
// Simple passthrough fragment shader
//
varying vec3 v_vPosition;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_Player;
uniform float u_Radius;
uniform vec4 u_Blend;

void main()
{
	float d = distance(u_Player, v_vPosition.xy);
	vec4 colour = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	colour.a *= float(d > u_Radius);
	// round substitute
	colour.rgb *= float(u_Radius != floor(d));
	gl_FragColor = u_Blend * colour;
}
