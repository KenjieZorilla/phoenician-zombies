#region

sprite_index = sprAK;

if mouse_x > x {
    image_xscale = 3;
	image_yscale = 3;
}
if mouse_x < x {
	image_xscale = 3;
	image_yscale = -3;
}
// Update the mouse angle based on the position
mouse_angle -= angle_difference(mouse_angle, point_direction(x, y, mouse_x, mouse_y)) * 0.5;

// Set the image angle
image_angle = mouse_angle

// Set target position (assuming moving towards the mouse)
x = objPlayer.x+5; 
y = objPlayer.y+20;


#endregion
#region

var _shoot = gun.fullauto ? mouse_check_button(mb_left) : mouse_check_button_pressed(mb_left);
var _ammo = gun.ammo[bullet_index];

if (canshoot > 0) {
    canshoot--;
} else if (_shoot) {
    canshoot = _ammo.firerate;
    _ammo.firerate = lerp(_ammo.firerate, _ammo.rate_end, _ammo.rate_mult);
    Shoot();
    
    var _delay = gun.burst_delay;
    repeat (gun.burst_number - 1) {
        call_later(_delay, time_source_units_frames, Shoot);
        _delay += gun.burst_delay;
    }
}

if (!mouse_check_button(mb_left)) {
    _ammo.firerate = lerp(_ammo.firerate, _ammo.rate_start, _ammo.rate_mult);
}

#endregion
