/* Magnetic Circuit parts 

See https://github.com/davidson16807/relativity.scad/wiki/box 
This file shows the parts as purchased and as sawn.  There is nothing here about nylon holes to put them in, that comes later. 
Make all the sawn lengths run in the X direction.  The parts are shown here just neatly layed out so that you can see them, not because they are used this way. 
*/
include </Users/relativity2.scad>;
include <MagneticCircuitJigforMetalCuttingwithDimensionsREADME.scad>;

echo(statorMainRodDiameter()); //tests include, use working OK

rotorLongBar();
translate([0, 20, 0])statorMainPad();
translate([0, 40, 0])statorSidePad();
translate([0, 60, 0])statorMainRod();
translate([0, 80, 0])rotorMagnet();

module rotorLongBar(){
    color("blue")  //even though this bar is no permanentlhy magnetised at purchase, it always sits with this orientation so is likely to become quite magnetised over time. 
    box([rotorLongBarSawnLength()/2, rotorLongBarWidth(), rotorLongBarHeight()], anchor = [-1,-1,-1]);
    color("red") //Red is north pole.  
    translate([rotorLongBarSawnLength()/2,0,0])
    box([rotorLongBarSawnLength()/2, rotorLongBarWidth(), rotorLongBarHeight()], anchor = [-1,-1,-1]);
}

module statorMainPad(){
    color("SandyBrown")
    box([statorMainPadSawnLength(), statorMainPadWidth(), statorMainPadHeight()], anchor = [-1,-1,-1]);
}

module statorSidePad(){
    color("SandyBrown")
    box([statorSidePadSawnLength(), statorSidePadWidth(), statorSidePadHeight()], anchor = [-1,-1,-1]);
}

module statorMainRod(){
    color("SandyBrown")
    rotate(90,[0,1,0])
    rod([statorMainRodDiameter(),statorMainRodDiameter(),statorMainRodSawnLength()],anchor = [1,-1,-1], $fn=50);
}

module rotorMagnet(){
    color("blue")box([rotorMagnetHeight(),rotorMagnetHeight(),rotorMagnetHeight()/2],anchor = [-1,-1,-1]);
    translate([0, 0, rotorMagnetHeight()/2])
    color("red")box([rotorMagnetHeight(),rotorMagnetHeight(),rotorMagnetHeight()/2],anchor = [-1,-1,-1]); 
    
   /* Note: The 'colored' function is in the relativity documentation but not in the relativity code - Tell Davidson Bug.
    // also I couldnt get differed to work, but perhaps I was using it wrong.  
    colored("blue", "southPole")
    colored("red", "northPole")
    box([rotorMagnetHeight,rotorMagnetHeight,rotorMagnetHeight/2],anchor = [-1,-1,-1], $class=southPole);
    //align([0,0,1])
    translate([0, 0, rotorMagnetHeight/2])
    color("red")box([rotorMagnetHeight,rotorMagnetHeight,rotorMagnetHeight/2],anchor = [-1,-1,-1], $class=northPole); //-1,-1,-1]);
    */ 
}