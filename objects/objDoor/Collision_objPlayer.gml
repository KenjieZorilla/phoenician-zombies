/// @description Insert description here
// You can write your code in this editor


var target = Room1;
if(room == Room1) { 
	target = TestRoom
} else if(room == TestRoom) {
	target = TestRoom2
} else if(room == TestRoom2) {
	target = Room1
}

TransitionStart(target, sqFadeOut, sqFadeIn)