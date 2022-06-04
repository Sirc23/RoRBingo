//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 mask_TCoord;
varying vec2 mask_TSpace;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    mask_TCoord = in_TextureCoord;
    mask_TSpace = in_Position.xy;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 mask_TCoord;
varying vec2 mask_TSpace;

uniform vec2 screenSize;

uniform sampler2D gradient;

float calcComponent(float I, float M) {

    float NI = 1. - I;
    float NM = 1. - M;
    
    float R = 1. - (NM * NI);
    
    float inter = (NI * M) + R;
    float result = inter * I;
    
    return clamp(result,0.,1.);
}

void main()
{
    vec4 tex_intermediate = vec4(0,0,0,0) ;
    vec4 tex_result = vec4(0,0,0,0) ;
    
    vec2 screenPos = vec2(mask_TSpace[0] / screenSize[0], mask_TSpace[1] / screenSize[1]);
    
    vec4 tex_mask = texture2D(gm_BaseTexture, mask_TCoord);
    vec4 tex_image = texture2D(gradient, screenPos);
    
    tex_intermediate.r = calcComponent(tex_image.r, tex_mask.r);
    tex_intermediate.g = calcComponent(tex_image.g, tex_mask.g);
    tex_intermediate.b = calcComponent(tex_image.b, tex_mask.b);
    tex_intermediate.a = 1.;
    
    //tex_intermediate = tex_mask;
    
    tex_result.r = calcComponent(tex_intermediate.r, tex_mask.r);
    tex_result.g = calcComponent(tex_intermediate.g, tex_mask.g);
    tex_result.b = calcComponent(tex_intermediate.b, tex_mask.b);
    tex_result.a = 1.;

//    gl_FragColor = vec4((mask_TCoord[0] - 0.9) * 16., mask_TCoord[1] * 32., 0.0, 1.);
    gl_FragColor = tex_result;

}

