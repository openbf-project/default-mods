Effect("ColorControl")
{
	Enable(1);
	GammaBrightness(0.460000);
	GammaContrast(0.480000);
}

Effect("Godray")
{
	OffsetAngle(0);
	DustVelocity(0, -0.100000, 0);
}

Effect("FogCloud")
{
	Enable(0);
	Texture("fluffy");
	Range(90, 120);
	Color(168, 172, 180, 128);
	Velocity(5, 0);
	Rotation(0.100000);
	Height(16);
	ParticleSize(28);
	ParticleDensity(60);
}

SunFlare()
{
	Angle(120, 180);
	Color(255, 255, 255);
	Size(5);
	FlareOutSize(20);
	NumFlareOuts(40);
	InitialFlareOutAlpha(70);
	HaloInnerRing(0, 255, 255, 255, 255);
	HaloMiddleRing(8, 252, 190, 50, 200);
	HaloOutterRing(30, 52, 43, 74, 0);
	SpikeColor(230, 230, 0, 128);
	SpikeSize(20);
}

Effect("Blur")
{
	Enable(1);
	Mode(1);
	ConstantBlend(0.300000);
	DownSizeFactor(0.250000);
}

