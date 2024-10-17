// Input keys for movement
rightKey = keyboard_check(vk_right) or keyboard_check(ord("D"));
leftKey = keyboard_check(vk_left) or keyboard_check(ord("A"));
upKey = keyboard_check(vk_up) or keyboard_check(ord("W"));
downKey = keyboard_check(vk_down) or keyboard_check(ord("S"));
spaceKey = keyboard_check_pressed(vk_space);  // Dodge roll button
rClk = mouse_check_button_pressed(mb_right);

// Cooldown management
if (cooldownTimer > 0) {
    cooldownTimer -= 1;  // Decrease cooldown timer if rolling is on cooldown
}

// Check if player is currently rolling
if (rolling) {
    // Continue rolling in the same direction
    xspd = lengthdir_x(rollSpeed, direction);  // Maintain roll direction
    yspd = lengthdir_y(rollSpeed, direction);
    
    x += xspd;
    y += yspd;

    rollTimer -= 1;  // Decrease the roll timer
    
    if (rollTimer <= 0) {
        // Roll is over
        rolling = false;
        invincible = false;  // End invincibility
        cooldownTimer = rollCooldown;  // Start cooldown
    }
    
} else {
    // Handle input for normal movement when not rolling
    xspd = (rightKey - leftKey) * moveSpeed;
    yspd = (downKey - upKey) * moveSpeed;

    // Move the player
    x += xspd;
    y += yspd;

    // Check for dodge roll initiation
    if (spaceKey && cooldownTimer <= 0) {
        // Initiate the roll
        rolling = true;
        invincible = true;  // Start invincibility
        rollTimer = rollDuration;  // Set the duration of the roll

        // Set the roll direction based on player input
        if (rightKey) {
            direction = 0;
        } else if (leftKey) {
            direction = 180;
        } else if (upKey) {
            direction = 90;
        } else if (downKey) {
            direction = 270;
        } else {
            // Default to the current direction if no input
            direction = direction;  // Maintain current direction
        }
    }
} 

if mouse_x > x {
    image_xscale = 5;

}
if mouse_x < x {
	image_xscale = -5;

}

if(rClk){
	image_index +=1
}