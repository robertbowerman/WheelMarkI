/*stator main body. This is the biscuit tin with the electomagnets around the wall of the tin and the electronics at the base.  The rotor and the tin lid are separate files.   This file is the main plastic body of the hub motor.  The hard work of the magnetic circuit is subtracted from this tin. 
*/

include </Users/relativity2.scad>;
use <MagneticCircuitMetalInFull.scad>;
use <MagneticCircuitMetalComponents.scad>;
use <MagneticCircuitMetalComponentsInNylonHoles.scad>;
use <MagneticCircuitJigforMetalCuttingWithDimensionsREADME.scad>;

function statorMainBodyOuterDiameter() = 2* magneticCircuitInnerRadius()-20;
function statorMainRimDiameter() = 250;
function statorMainBodyInnerDiameter() = 180;
function statorMainBodyOuterHeight() = 120;
function statorMainBodyInnerHeight() = 110;

differed("hole","body") {
    color("Aqua")
    rod([statorMainBodyOuterDiameter(),statorMainBodyOuterDiameter(),statorMainBodyOuterHeight()],
       anchor = [0,0,1], $fn=300, $class="body");
       
    color("blue")
    translate([0,0,1])
    rod([statorMainBodyInnerDiameter(),statorMainBodyInnerDiameter(),statorMainBodyInnerHeight()],
       anchor = [0,0,1], $fn=300, $class="hole");   
}
       
    rotate(90,[0,1,0])
    for (circuit = [0:47]) //:47
    rotate(360/48*circuit, [1,0,0]) 
    translate([0,0,-magneticCircuitInnerRadius()]) //this dimension found by trial and error, but it works exactly
    statorMagneticCircuit();