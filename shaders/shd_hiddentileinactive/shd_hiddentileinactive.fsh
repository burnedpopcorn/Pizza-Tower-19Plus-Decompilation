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
	gl_FragColor = u_Blend * texture2D( gm_BaseTexture, v_vTexcoord );
}
