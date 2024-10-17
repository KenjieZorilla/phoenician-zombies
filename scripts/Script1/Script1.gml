function Shoot(){
	with objGun {
		//play sound
		//audio_play_sound(gun.sound, 10, false, random_range(0.8,1), 0, random_range(0.8,1));
		inaccuracy = 5
		var _dist = sprite_get_width(gun.sprite) - sprite_get_xoffset(gun.sprite);
		for (var i = 0; i<gun.spread_number; i++){
			var _angle = image_angle+(i*gun.spread_angle)-((gun.spread_number-1)*(gun.spread_angle/2));
			instance_create_depth(x+lengthdir_x(_dist, image_angle), y+lengthdir_y(_dist, image_angle), depth - 1, objBullet,{
				image_angle: _angle + random_range(inaccuracy, inaccuracy),
				sprite_index: gun.ammo[bullet_index].sprite,
				spd: gun.ammo[bullet_index].spd
			});
		}
		
		//x-=gun.kick*image_yscale;
		
		if(bullet_index < array_length(gun.ammo)-1) {bullet_index++;}
		else{bullet_index = 0 }
	}
}