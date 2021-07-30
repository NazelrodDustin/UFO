//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec2 v_vTexpos;

uniform sampler2D u_uPlaidTex;
uniform float u_uTexWidth;
uniform float u_uTexHeight;


float mathMod(float n1, float n2){
	int div = int(n1 / n2);
	float rem = float(int(n1)) - (float(div) * n2);
	return rem;
}


void main(){
	
	float xPoint = (mathMod(v_vTexpos.x, u_uTexWidth)) / u_uTexWidth;
	float yPoint = (mathMod(v_vTexpos.y, u_uTexHeight)) / u_uTexHeight;
	
	
	vec4 color = texture2D(gm_BaseTexture, v_vTexcoord);
	vec4 finalColor = texture2D(u_uPlaidTex, vec2(xPoint, yPoint));
	if (color.a < 1.0){
		finalColor = vec4(0.0, 0.0, 0.0, 0.0);
	}
	
    gl_FragColor = finalColor;
}
