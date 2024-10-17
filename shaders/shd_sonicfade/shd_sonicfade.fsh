varying vec2 v_vTexcoord;
//varying vec4 v_vColour;
uniform float u_step;

#define step_zero 7.
void main()
{
	vec4 newColour = texture2D(gm_BaseTexture, v_vTexcoord);
	vec3 factor = vec3(clamp(u_step, 0., step_zero), 
		clamp(u_step - step_zero, 0., step_zero), 
		clamp(u_step - step_zero * 2., 0., step_zero));
	newColour.rgb -= factor.rgb * (1. / step_zero);
	gl_FragColor = clamp(newColour, 0., 1.);
}
