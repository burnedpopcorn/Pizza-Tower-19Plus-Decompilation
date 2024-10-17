//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 col = texture2D( gm_BaseTexture, v_vTexcoord );
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	if(col.rgb != vec3(0, 0, 0))
		gl_FragColor.rgb = v_vColour.rgb;
	else
		gl_FragColor.rgb = v_vColour.rgb * 0.25;
}
