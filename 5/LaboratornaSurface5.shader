Shader "Custom/LaboratornaSurface5"                                                      
{
        Properties {
        _MainTex ("Main Texture", 2D) = "white" {}
        _Color ("Color", Color) = (1, 1, 1, 1)
        _EmissionColor ("Emission Color", Color) = (0, 0, 0, 1)
        _EmissionStrength ("Emission Strength", Range(0, 1)) = 0.5
    }
    
    SubShader {
        Tags { "RenderType"="Opaque" }
        LOD 200
        
        CGPROGRAM
        #pragma surface surf Lambert
        
        sampler2D _MainTex;
        fixed4 _Color;
        fixed4 _EmissionColor;
        half _EmissionStrength;
        
        struct Input {
            float2 uv_MainTex;
        };
        
        void surf (Input IN, inout SurfaceOutput o) {
            fixed4 c = tex2D(_MainTex, IN.uv_MainTex) * _Color;
            o.Albedo = c.rgb;
            o.Emission = c.rgb * _EmissionColor.rgb * _EmissionStrength;
            o.Alpha = c.a;
        }
        ENDCG
    }  
    FallBack "Diffuse"
}