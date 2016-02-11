/*stator main body. This is the biscuit tin with the electomagnets around the wall of the tin and the electronics at the base.  The rotor and the tin lid are separate files.   This file is the main plastic body of the hub motor.  The hard work of the magnetic circuit is subtracted from this tin. 
*/

include </Users/relativity2.scad>;
use <MagneticCircuitMetalInFull.scad>;
use <MagneticCircuitMetalComponents.scad>;
use <MagneticCircuitMetalComponentsInNylonHoles.scad>;
use <MagneticCircuitJigforMetalCuttingWithDimensionsREADME.scad>;

// magneticCircuitInnerRadius()  comes from MagneticCircuitMetalInFull

function numberOfMagneticCircuitsPerWheel() = 48.0;
function anglePerHalfMagneticCircuit() = 360 / numberOfMagneticCircuitsPerWheel() / 2;
echo("anglePerHalfMagneticCircuit()", anglePerHalfMagneticCircuit());
function statorEdgeMetalLengthPerMagneticCircuit() = statorMainPadSawnWidth() + holdInNylonLayerThickness();
function statorMainBodyInnerRadiusToMetalCentre() = 0.5*statorEdgeMetalLengthPerMagneticCircuit() / tan(anglePerHalfMagneticCircuit());
echo("statorMainBodyInnerRadiusToMetalCentre()", statorMainBodyInnerRadiusToMetalCentre());
function statorMainBodyInnerRadiusToMetalCorner() =0.5*statorEdgeMetalLengthPerMagneticCircuit() / sin(anglePerHalfMagneticCircuit());
echo("statorMainBodyInnerRadiusToMetalCorner()", statorMainBodyInnerRadiusToMetalCorner());

function statorMainBodyOuterDiameter() = 2 * ( statorMainBodyInnerRadiusToMetalCentre()); //+ statorMainPadHeight() + holdInNylonLayerThickness());
function statorMainRimDiameter() = 250;
function statorMainBodyInnerDiameter() = 170;
function statorMainBodyOuterHeight() = statorMainRodSawnLength() + 2 * (statorMainPadHeight() // + 2*holdInNylonLayerThickness() + trueAirGap() 
+ statorSidePadHeight() + justFitSize());  // this adds to 130.8
echo("Biscuit tin wall outer height before rims", statorMainBodyOuterHeight());



function statorMainBodyInnerHeight() = 110;


    
    rotate(90,[0,1,0])
    for (circuit = [0:0]) //:47
    rotate(360/48*circuit, [1,0,0]) 
    translate([0,0,-statorMainBodyInnerRadiusToMetalCentre()]) //this dimension was previously found by trial and error, but it works OK.  Its since been replaced by one that is computed from first principles
    translate([0,0, -(rotorMagnetHeight() + holdInNylonLayerThickness() + rotorLongBarHeight() + trueAirGap()) ])
    translate([0,-rotorLongBarWidth()/2,0])  // to get stator in right place. 
    statorMagneticCircuit();
    
    
    differed("hole","body") {  // to create empty space of the biscuit tin interior
        
    // Feature: The wall of the main biscuit tin    
    translate([0,0, 2*holdInNylonLayerThickness() + trueAirGap() + statorSidePadHeight() + justFitSize()])    
    color("Aqua", 0.6)  
    rod([statorMainBodyOuterDiameter(),statorMainBodyOuterDiameter(),statorMainBodyOuterHeight()],
       anchor = [0,0,1], $fn=100, $class="body");    
        
    // rim that holds side pads in place
    // rod( rod([statorMainBodyOuterDiameter()+,statorMainBodyOuterDiameter(),statorMainBodyOuterHeight()]    
        
    // Feature: The hollow space inside the biscuit tin
    color("blue", 0.4)
    translate([0,0,10])
    rod(d=2*(statorMainBodyInnerRadiusToMetalCentre() - statorMainPadHeight()) - 5,
     //   (rotorMagnetHeight() + holdInNylonLayerThickness() + rotorLongBarHeight() + trueAirGap())),
        h=statorMainBodyInnerHeight(),
    //rod([2*statorMainBodyInnerRadiusToMetalCentre() - statorMainPadHeight(), 2*statorMainBodyInnerRadiusToMetalCentre() - statorMainPadHeight(),statorMainBodyInnerHeight()],
       anchor = [0,0,1], $fn=100, $class="hole");    
        
        

       
  
} // end differed