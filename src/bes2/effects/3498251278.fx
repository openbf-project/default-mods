ParticleEmitter("Flare")
{
	MaxParticles(-1, -1);
	StartDelay(0, 0);
	BurstDelay(0.500000, 0.500000);
	BurstCount(1, 1);
	MaxLodDist(50);
	MinLodDist(10);
	SoundName("com_amb_steam_slow");
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
			PositionY(1, 3);
			PositionZ(0, 0);
		}

		Offset()
		{
			PositionX(-3, 3);
			PositionY(0, 0);
			PositionZ(-3, 3);
		}

		PositionScale(0, 0);
		VelocityScale(0.300000, 1);
		InheritVelocityFactor(0, 0);
		Size(0, 1, 1.500000);
		Red(0, 255, 255);
		Green(0, 255, 255);
		Blue(0, 255, 255);
		Alpha(0, 0, 0);
		StartRotation(0, 0, 360);
		RotationVelocity(0, -40, 40);
		FadeInTime(0);
	}

	Transformer()
	{
		LifeTime(4);
		Position()
		{
			LifeTime(1);
		}

		Size(0)
		{
			LifeTime(4);
			Scale(5);
		}

		Color(0)
		{
			LifeTime(0.400000);
			Reach(255, 255, 255, 80);
			Next()
			{
				LifeTime(3.600000);
				Reach(255, 255, 255, 0);
			}

		}

	}

	GEOMETRY()
	{
		BlendMode("ADDITIVE");
		Type("PARTICLE");
		Texture("thicksmoke2");
	}

}

