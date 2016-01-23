/* Magnetic Circuit parts 

See https://github.com/davidson16807/relativity.scad/wiki/box 


*/
include </Users/relativity2.scad>;
statorMainRodDiameter = 6.30;
statorMainRodLength = 100.0;
rotorLongBarHeight = 2.93;
rotorLongBarWidth = 10.11;
rotorLongBarLength = 120.0; 
statorSidePadHeight = 14.0;
statorSidePadWidth = rotorLongBarHeight; //2.93;
statorSidePadLength = rotorLongBarWidth; //10.11;
statorMainPadHeight = 12.17;

rotorLongBar();
translate([0, 20, 0])statorMainPad();
translate([0, 40, 0])statorSidePad();
translate([0, 60, 0])statorMainRod();
translate([0, 80, 0])rotorMagnet();

module rotorLongBar(){
    box([rotorLongBarLength, rotorLongBarWidth, rotorLongBarHeight], anchor = [-1,-1,-1]);
}

module statorMainPad(){
    box(statorMainPadHeight, anchor = [-1,-1,-1]);
}

module statorSidePad(){
    box([statorSidePadWidth, statorSidePadLength, statorSidePadHeight], anchor = [-1,-1,-1]);
}

module statorMainRod(){
    rotate(90,[0,1,0])rod([statorMainRodDiameter,statorMainRodDiameter,statorMainRodLength],anchor = [1,-1,0], $fn=100);
}

module rotorMagnet(){
    box([10,10,10],anchor = [0,-1,-1]);
}