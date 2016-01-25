/* Magnetic Circuit in full */

include </Users/relativity2.scad>;
use <MagneticCircuitMetalComponentsInNylonHoles.scad>;
include <MagneticCircuitJigforMetalCuttingWithDimensionsREADME.scad>;

// Somehow we have to ensure that the permanent magnet is fully snug in its hole in one direction, and the pads are fully snug in their holes in the other direction. Probably needs springs.!!!!!!!! 

rotorMagneticCircuit();
statorMagneticCircuit();

module rotorMagneticCircuit(){
//module rotorMagneticCircuit(rotorLongBarWidth(), rotorLongBarHeight(), rotorLongBarLength()){
rotorLongBarInNylon(); // Remember Opposites attract
translate([0,rotorLongBarWidth(),rotorLongBarWidth()+rotorLongBarHeight()])rotate(180,[1,0,0])rotorMagnetInNylon();
translate([rotorLongBarSawnLength()-rotorLongBarWidth(),0,rotorLongBarHeight()])rotorMagnetInNylon();
}

module statorMagneticCircuit(){ ////WIPPPP especially the 20s
    translate([0,rotorLongBarWidth(),rotorLongBarWidth()+rotorLongBarHeight()+20]) statorMainPadInNylon();
    translate([rotorLongBarSawnLength()-rotorLongBarWidth(),0,rotorLongBarHeight()+20])statorMainPadInNylon();
}
