/* Magnetic Circuit parts in Nylon Holes

See https://github.com/davidson16807/relativity.scad/wiki/box 


*/
include </Users/relativity2.scad>;
use <MagneticCircuitMetalComponents.scad>;  //this brings in dimensions
echo(statorMainRodDiameter()); // tests include and use

rotorLongBarInNylon();
translate([0, 20, 0])statorMainPad();
translate([0, 40, 0])statorSidePad();
translate([0, 60, 0])statorMainRod();
translate([0, 80, 0])rotorMagnetInNylon();

module rotorLongBarInNylon(){
    rotorLongBar();
    translate([-justFitSize()/2, -justFitSize()/2, -justFitSize()/2]) color("yellow",0.5)
    box([rotorLongBarSawnLength() + justFitSize(), rotorLongBarWidth() + justFitSize(), rotorLongBarHeight() + justFitSize()], anchor = [-1,-1,-1]);
}

module statorMainPadInNylon(){  
    statorMainPad()
    translate([-justFitSize()/2, -justFitSize()/2, -justFitSize()/2]) color("yellow",0.5)
    box([statorMainPadSawnLength() + justFitSize(), statorMainPadWidth() + justFitSize(), statorMainPadHeight() + justFitSize()], anchor = [-1,-1,-1]);
}

module statorSidePadInNylon(){
    statorSidePad()
    translate([-justFitSize()/2, -justFitSize()/2, -justFitSize()/2]) color("yellow",0.5)
    box([statorSidePadSawnLength() + justFitSize(), statorSidePadWidth() + justFitSize(), statorSidePadHeight() + justFitSize()], anchor = [-1,-1,-1]);
}

module statorMainRodInNylon(){
    statorMainRod();
    translate([-justFitSize()/2, -justFitSize()/2, -justFitSize()/2]) color("yellow",0.5)
    rod([statorMainRodDiameter() + justFitSize(), statorMainRodDiameter() + justFitSize(), statorMainRodSawnLength() + justFitSize()],anchor = [1,-1,-1], $fn=50);

    
    //color("SandyBrown")
   // rotate(90,[0,1,0])
    //rod([statorMainRodDiameter(),statorMainRodDiameter(),statorMainRodLength()],anchor = [1,-1,-1], $fn=50);
}

module rotorMagnetInNylon(){
    rotorMagnet();
       translate([-justFitSize()/2, -justFitSize()/2, -justFitSize()/2]) color("yellow",0.5)
    box([rotorMagnetHeight() + justFitSize(), rotorMagnetHeight() + justFitSize(), rotorMagnetHeight() + justFitSize()], anchor = [-1,-1,-1]);   
}