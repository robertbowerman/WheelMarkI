/* Magnetic Circuit in full */

include </Users/relativity2.scad>;
use <MagneticCircuitMetalComponents.scad>;

//fred = rotorLongBarWidth();
//echo(rotorLongBarWidth());
//echo(statorMainRodDiameter());

rotorMagneticCircuit(10, 3, 120);
statorMagneticCircuit();

module rotorMagneticCircuit(rotorLongBarWidth, rotorLongBarHeight, rotorLongBarLength){
//translate([0,0,10])rotate(90,[0,1,0])
rotorLongBar();
translate([0,rotorLongBarWidth,rotorLongBarWidth+rotorLongBarHeight])rotate(180,[1,0,0])rotorMagnet();
translate([rotorLongBarLength-rotorLongBarWidth,0,rotorLongBarHeight])rotorMagnet();
}

module statorMagneticCircuit(){
    
}
