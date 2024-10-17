//
// Pattern shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 u_SprRect;
uniform vec4 u_PatRect;
uniform vec4 u_TexelScl;
uniform vec2 u_SprOffset;

uniform sampler2D s_Pattern;

void main()
{
    vec2 pixPos = vec2(v_vTexcoord.x - u_SprRect[0], v_vTexcoord.y - u_SprRect[1]) / u_TexelScl.zw;
	
    vec2 patSize = vec2(u_PatRect[2] - u_PatRect[0], u_PatRect[3] - u_PatRect[1]) / u_TexelScl.xy;
	
    vec2 patcoord = vec2(mod(pixPos.x + u_SprOffset[0], patSize.x), mod(pixPos.y + u_SprOffset[1], patSize.y)) * u_TexelScl.xy + u_PatRect.xy;
	
    vec4 sprcol = texture2D(gm_BaseTexture, v_vTexcoord);
    vec4 patcol = texture2D(s_Pattern, patcoord);
    
    if(sprcol.rgb != floor(sprcol.rgb))
        sprcol = patcol;
    
    gl_FragColor = v_vColour * sprcol;
}
