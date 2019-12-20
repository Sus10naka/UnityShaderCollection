Shader "Custom/shader"
{
    Properties
    {
        _MainTex ("MainTex", 2D) = "gray"{}
    }

    CGINCLUDE
    #include "UnityCG.cginc"

    float circle(float2 st)
    {
        float d = distance(float2(0.5, 0.5), st);
        float a = abs(sin(_Time.y)) * 0.2; // 閾値
        return step(a, d);
    }


    float4 frag(v2f_img i) : SV_Target
    {
        float n = 5*(sin(_Time.y));
        float2 st = frac(i.uv * n);
        return circle(st);
    }

    ENDCG

    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag
            ENDCG
        }
    }
}
