ParticleEmitter("Flare")
{
	MaxParticles(-1, -1);
	StartDelay(0, 0);
	BurstDelay(0.050000, 0.050000);
	BurstCount(1, 1);
	MaxLodDist(50);
	MinLodDist(10);
	SoundName("com_amb_steam");
	Size(1, 1);
	Hue(255, 255);
	Saturation(255, 255);
	Value(255, 255);
	Alpha(255, 255);
	Spawner()
	{
		Spread()
		{
			PositionX(0, 0);
			PositionY(0, 0);
			PositionZ(1, 2);
		}

		Offset()
		{
			PositionX(0, 0);
			PositionY(0, 0);
			PositionZ(0, 0);
		}

		PositionScale(0, 0);
		VelocityScale(4, 4);
		InheritVelocityFactor(0, 0);
		Size(0, 0.200000, 0.300000);
		Red(0, 128, 128);
		Green(0, 128, 128);
		Blue(0, 128, 128);
		Alpha(0, 128, 255);
		StartRotation(0, 0, 360);
		RotationVelocity(0, 0, 0);
		FadeInTime(0);
	}

	Transformer()
	{
		LifeTime(0.500000);
		Position()
		{
			LifeTime(0.500000);
		}

		Size(0)
		{
			LifeTime(0.500000);
			Scale(5);
		}

		Color(0)
		{
			LifeTime(0.500000);
			Reach(100, 100, 100, 0);
		}

	}

	GEOMETRY()
	{
		BlendMode("ADDITIVE");
		Type("PARTICLE");
		Texture("thicksmoke2");
	}

}

