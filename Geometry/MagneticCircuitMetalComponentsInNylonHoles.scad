/* Magnetic Circuit parts in Nylon Holes

See https://github.com/davidson16807/relativity.scad/wiki/box 

We are putting 0.3mm clearance on all sides by default, but we could reduce this to 0.1mm in one direction for snug fit and 0.3mm in the other direction to let the air out.  Some places a hole can be provided to let the air out.
*/
include </Users/relativity2.scad>;
use <MagneticCircuitMetalComponents.scad>;  //this brings in dimensions
echo(statorMainRodDiameter()); // tests include and use

function infintessimallyThin() = 0.0001; //To stop shimmering on rendering coincident surfaces

circuitMetalInRow();
translate([0, 100, 0])rotorMagnetInNylon();

module circuitMetalInRow() {
rotorLongBarInNylon(); // 121mm
translate([0, rotorLongBarWidth() + 4, 0]) statorMainRodInNylon(); // 100mm
translate([0, rotorLongBarWidth() + statorMainRodDiameter() + 10, 0]) statorSidePadInNylon();  //14mm long
translate([0, rotorLongBarWidth() + statorMainRodDiameter() + statorSidePadWidth() + 15, 0]) statorSidePadInNylon();  //14mm long 
translate([0, rotorLongBarWidth() + statorMainRodDiameter() + 2*statorMainPadSawnWidth() + 20, 0]) statorMainPadInNylon();
translate([0, rotorLongBarWidth() + statorMainRodDiameter() + 3*statorMainPadSawnWidth() + 25, 0]) statorMainPadInNylon();
}

module rotorLongBarInNylon(){
    rotorLongBar();
    translate([-justFitSize()/2, -justFitSize()/2, 0]) color("yellow",0.3)
    box([rotorLongBarSawnLength() + justFitSize(), rotorLongBarWidth() + justFitSize(), rotorLongBarHeight()], anchor = [-1,-1,-1]);
}

module statorMainPadInNylon(){  
    statorMainPad();
    translate([-justFitSize()/2, -justFitSize()/2, 0]) color("yellow", 0.3)
    box([statorMainPadLength() + justFitSize(), statorMainPadSawnWidth() + justFitSize(), statorMainPadHeight()+infintessimallyThin()], anchor = [-1,-1,-1]);
}

module statorSidePadInNylon(){
    statorSidePad();
    translate([0, -justFitSize()/2, 0]) color("yellow",0.3)
    box([statorSidePadSawnLength(), statorSidePadWidth() + justFitSize(), statorSidePadHeight() + justFitSize()/2], anchor = [-1,-1,-1]);
}

module statorMainRodInNylon(){
    statorMainRod();   //this is the rod itself, which includes the copper coil surround
    translate([0, -justFitSize()/2, -justFitSize()/2]) color("yellow",0.3) //this is the air space
        rotate(90,[0,1,0])
        rod([statorMainRodCoilDiameter() + justFitSize(), statorMainRodCoilDiameter() + justFitSize(), statorMainRodSawnLength()],anchor = [1,-1,-1], $fn=50);

    
    //color("SandyBrown")
   // rotate(90,[0,1,0])
    //rod([statorMainRodDiameter(),statorMainRodDiameter(),statorMainRodLength()],anchor = [1,-1,-1], $fn=50);
}

module rotorMagnetInNylon(){
    rotorMagnet();
    /*       translate([-justFitSize()/2, -justFitSize()/2, -justFitSize()/2]) color("yellow",0.5)
    box([rotorMagnetHeight() + justFitSize(), rotorMagnetHeight() + justFitSize(), rotorMagnetHeight() + justFitSize()], anchor = [-1,-1,-1]);   for safety while mod it */
       translate([-justFitSize()/2, -justFitSize()/2, 0]) color("yellow",0.3)
    box([rotorMagnetHeight() + justFitSize()/2, rotorMagnetHeight() + justFitSize(), rotorMagnetHeight()], anchor = [-1,-1,-1]);   
}

module rotorMagnetInNylonRight(){
    rotorMagnet();
       translate([0, -justFitSize()/2, 0]) color("yellow", 0.3)
    box([rotorMagnetHeight() + justFitSize()/2, rotorMagnetHeight() + justFitSize(), rotorMagnetHeight()], anchor = [-1,-1,-1]); 
} // end module