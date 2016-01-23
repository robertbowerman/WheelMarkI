/* Magnetic Circuit parts 

See https://github.com/davidson16807/relativity.scad/wiki/box 


*/
include </Users/relativity2.scad>;

rotorLongBar();
translate([0, 20, 0])statorMainPad();
translate([0, 40, 0])statorSidePad();
translate([0, 60, 0])statorMainRod();
translate([0, 80, 0])rotorMagnet();

function statorMainRodDiameter() = 6.30;
function statorMainRodLength() = 100.0;
function rotorLongBarHeight() = 2.93;
function rotorLongBarWidth() = 10.11;
function rotorLongBarLength() = 120.0; 
function statorSidePadHeight() = 14.0;
function statorSidePadWidth() = rotorLongBarHeight(); //2.93;
function statorSidePadLength() = rotorLongBarWidth(); //10.11;
function statorMainPadHeight() = 12.17;
function rotorMagnetHeight() = 10.0; 

echo(statorMainRodDiameter());

module rotorLongBar(){
    color("blue")
    box([rotorLongBarLength()/2, rotorLongBarWidth(), rotorLongBarHeight()], anchor = [-1,-1,-1]);
    color("red")
    translate([rotorLongBarLength()/2,0,0])
    box([rotorLongBarLength()/2, rotorLongBarWidth(), rotorLongBarHeight()], anchor = [-1,-1,-1]);
}

module statorMainPad(){
    color("SandyBrown")
    box(statorMainPadHeight(), anchor = [-1,-1,-1]);
}

module statorSidePad(){
    color("SandyBrown")
    box([statorSidePadWidth(), statorSidePadLength(), statorSidePadHeight()], anchor = [-1,-1,-1]);
}

module statorMainRod(){
    color("SandyBrown")
    rotate(90,[0,1,0])
    rod([statorMainRodDiameter(),statorMainRodDiameter(),statorMainRodLength()],anchor = [1,-1,-1], $fn=50);
}

module rotorMagnet(){
   /* 
    colored("blue", "southPole")
    colored("red", "northPole")
    box([rotorMagnetHeight,rotorMagnetHeight,rotorMagnetHeight/2],anchor = [-1,-1,-1], $class=southPole);
    //align([0,0,1])
    translate([0, 0, rotorMagnetHeight/2])
    color("red")box([rotorMagnetHeight,rotorMagnetHeight,rotorMagnetHeight/2],anchor = [-1,-1,-1], $class=northPole); //-1,-1,-1]);
    */
    
    color("blue")box([rotorMagnetHeight(),rotorMagnetHeight(),rotorMagnetHeight()/2],anchor = [-1,-1,-1]);
    translate([0, 0, rotorMagnetHeight()/2])
    color("red")box([rotorMagnetHeight(),rotorMagnetHeight(),rotorMagnetHeight()/2],anchor = [-1,-1,-1]); //-1,-1,-1]);
    
}