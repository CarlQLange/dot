" Vim syntax file
string UIName = "UI Name";
string UIType = "slider";
float UIMin = 0.0;
float UIMax = 1.0;
float UIStep = 0.01;
> = 0.0f;<Up><Up><Up><Up><Up><Up>
string UIName = "UI Name";
string UIType = "slider";
float UIMin = 0.0;
float UIMax = 1.0;
float UIStep = 0.01;
> = 0.0f;<Up><Up><Up><Up><Up><Up>
string UIName = "UI Name";
> = { 0.0f, 0.0f};<Up><Up>
string UIName = "UI Name";
> = { 0.0f, 0.0f, 0.0f};<Up><Up>
string UIName = "UI Name";
> = { 0.0f, 0.0f, 0.0f, 0.0f};<Up><Up>
string UIName = "Color Name";
string UIType = "Color";
> = {1.0f, 1.0f, 1.0f};<Up><Up><Up>
string UIName = "Color Name";
string UIType = "Color";
> = {1.0f, 1.0f, 1.0f, 1.0f};<Up><Up><Up>
string UIName = "Direction";
string UIObject = "DirectionalLight";
string Space = "World";
> = {0.717f, 1.0f, 0.717f};<Up><Up><Up><Up>
string UIName = "Direction";
string UIObject = "DirectionalLight";
string Space = "World";
> = {0.717f, 1.0f, 0.717f, 0.0f};<Up><Up><Up><Up>
string UIName = "Position";
string UIObject = "PointLight";
string Space = "World";
> = {10.0f, 10.0f, 10.0f};<Up><Up><Up><Up>
string UIName = "Position";
string UIObject = "PointLight";
string Space = "World";
> = {10.0f, 10.0f, 10.0f, 1.0f};<Up><Up><Up><Up>
float4x4 WvpXf : WorldViewProjection;
float4x4 WorldXf : World;
float4x4 ViewIXf : ViewInverse;
VertexShader = compile vs_2_0 namedVS();
ZEnable = true;
ZWriteEnable = false;
ZFunc = LessEqual;
CullMode = None;
AlphaBlendEnable = true;
SrcBlend = One;
DestBlend = One;
PixelShader = compile ps_2_a namedPS();
}<Up><Up><Up><Up><Up><Up><Up><Up><Up><Up>
struct appdata {
float3 Position	: POSITION;
float4 Normal	: NORMAL;
float4 Tangent	: TANGENT0;
float4 Binormal	: BINORMAL0;
float4 UV		: TEXCOORD0;
};<Up><Up><Up><Up><Up><Up>
float4 HPosition	: POSITION;
float2 UV		: TEXCOORD0;
float3 LightVec	: TEXCOORD1;
float3 WorldNormal	: TEXCOORD2;
float3 WorldEyeVec	: TEXCOORD3;
float3 WorldTangent	: TEXCOORD4;
float3 WorldBinormal : TEXCOORD5;
};<Up><Up><Up><Up><Up><Up><Up><Up>
string Name = "default_color.dds";
string type = "2D";
>;

sampler2D NamedSampler = sampler_state
{
Texture = <NamedTexture>;
MinFilter = Linear;
MagFilter = Linear;
MipFilter = Linear;
AddressU = WRAP;
AddressV = WRAP;
};<Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up>

texture RTTMap1
<
string usage = "RenderTarget";
int width = RTT_SIZE;
int height = RTT_SIZE;
int levels = 1;
bool DepthBuffer = true;
string format = "X8R8G8B8";
>;

sampler RTTSamp1 = sampler_state
{
texture = <RTTMap1>;
AddressU  = CLAMP;
AddressV  = CLAMP;
AddressW  = CLAMP;
MIPFILTER = NONE;
MINFILTER = LINEAR;
MAGFILTER = LINEAR;
};<Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up>
{
float4 Position	: POSITION;
float4 Diffuse	: COLOR0;
float4 UV		: TEXCOORD0;
};

rttOut VS_Quad(
float3 Position : POSITION,
float3 TexCoord : TEXCOORD0
) {
rttOut OUT;
VS_OUTPUT OUT = (rttOut)0;
OUT.Position = float4(Position, 1);
OUT.UV = float4(TexCoord, 1); 
OUT.Diffuse = (1).xxxx; 
return (OUT);
}<Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up>
string rendertarget = "RTTMap1";
float cleardepth = 1.0f;
dword clearcolor = 0x0;
> {
cullmode = none;
ZEnable = true;
VertexShader = compile vs_1_1 namedVS();
PixelShader  = compile ps_2_0 namedPS();
}
pass ReadBuffer <
string geometry = "fullscreenquad";
> {
cullmode = none;
ZEnable = false;
ZWriteEnable = false;
AlphaBlendEnable = true;
SrcBlend = one;
DestBlend = one;
VertexShader = compile vs_1_1 VS_Quad();
PixelShader = compile ps_2_0 imageProcessPS(RTTSamp1);
}<Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up>

texture namedGenTex <
string function = "namedGenFunc";
int width = GEN_TEX_SIZE;
int height = GEN_TEX_SIZE;
>;

sampler2D namedGenSampler = sampler_state
{
Texture = <namedGenTex>;
MinFilter = LINEAR;
MagFilter = LINEAR;
MipFilter = LINEAR;
AddressU = WRAP;
AddressV = WRAP;
};

/* generate texture colors for the above */
float4 namedGenFunc(float2 Pos : POSITION,float2 texelSize : PSIZE) : COLOR
{
return float4(Pos.xy,1,1);
}<Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up>
<
string UIName =  "Ambient Color";
string UIType = "Color";
> = {0.1f, 0.1f, 0.1f};<Up><Up><Up><Up>

float3 LightDirD1 : DIRECTION
<
string UIName = "Light Direction 1";
string UIObject = "DirectionalLight";
string Space = "World";
> = {-0.7f, 1.0f, 0.7f};

float3 LightColorD1 : SPECULAR
<
string UIName =  "Dist Light Color 1";
string UIType = "Color";
> = {1.0f, 0.9f, 0.8f};<Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up>

float4 LightPosP1 : POSITION <
string UIName = "Light Pos 1";
string UIObject = "PointLight";
string Space = "World";
> = {10.0f, 10.0f, 10.0f, 1.0f};

float4 LightColorP1 : SPECULAR <
string UIName = "Light Color 1";
string UIType = "Color";
> = {1.0f, 1.0f, 1.0f, 1.0f};

float LightIntensityP1 <
string UIName = "Light Strength 1";
string UIType = "slider";
float UIMin = 0.0;
float UIMax = 10000.0;
float UIStep = 1.0;
> = 10.0f;<Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up><Up>