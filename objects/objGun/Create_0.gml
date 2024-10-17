bullet = {
	sprite: sprBullet,
	spd: 20,
	rate_start: 20,
	rate_end: 20,
	rate_mult: 0,
	firerate: 20
};

gun = {
	name: "AK",
	sprite: sprAK,
	ammo: [bullet],
	inaccurancy: 0,
	//sound: sfx.file
	spread_number: 1,
	spread_angle: 0,
	fullauto: true,
	burst_number: 3,
	burst_delay: 5,
};

canshoot = 0;
bullet_index = 0;