/* Magnetic Circuit in full.  This very geometry is used to difference out the holes in the body of the rotor and stator. 
The metal components are arranged snug up against each other within the rotor and stator, and then they are positioned within nylon holes that fit snuggly but still allow assemble.  

Remember that the OpenSCAD Relativity Library commands of align and anchor are unavailable as we are using our own modules, not the relativity principles of rod, box and ball.  

This one circuit is 1/48 of a wheel.  So 32kW for car, is 8kw per wheel, is 167 watts per coil.  By comparison  a cheap food blender has a 400 watts motor. A vitamix food blender has a 1.4kW motor (ac brushed) about the size of your fist.
We have to ensure that the permanent magnet is fully snug in its hole in one direction (where it is inserted, pointing twoards the tyre), and the pads are fully snug in their holes in the other direction (pointing towwards the wheel hub). Will be done by hold in covers.

Note magnets are a tad narrower than the long rotor bar - this is taken into account in creating their holes in nylon
*/

use </Users/relativity2.scad>;
use <MagneticCircuitMetalComponents.scad>;
use <MagneticCircuitMetalComponentsInNylonHoles.scad>;
include <MagneticCircuitJigforMetalCuttingWithDimensionsREADME.scad>;  //this file doesn't create any visuals, so OK to include. 

// Correction for the two long cuts being integer mm. rotorLongBarSawnLength() 

function rotorLongBarEffectiveLength() = 
 2 * statorMainPadLength() +  statorMainRodSawnLength() - 2 * (trueAirGap() + 2 * holdInNylonLayerThickness()); //what about 0.3mm nylon. think 
 echo("Rotor Long Bar Effective Length", rotorLongBarEffectiveLength());
 echo("Shift to +X", (rotorLongBarEffectiveLength() - rotorLongBarSawnLength())/2);

function magneticCircuitInnerRadius() = 123.5; //123.5; 
echo("Width for 3D Print on X Axis approx", 2*magneticCircuitInnerRadius()-5-3+2);

for (circuit = [0:0]) //:47
    rotate(360/48*circuit, [1,0,0]) 
    //translate([0,0,-magneticCircuitInnerRadius()]) //this dimension found by trial and error, but it works exactly */
    magneticCircuit();


/* ***********************  Magnetic Circuit Module *********************** */
module magneticCircuit(){
    
translate([0,-rotorLongBarWidth()/2,0]){
    
rotorMagneticCircuit();
        
// Sensitive to X-axis-direction length of magnetic circuit, because of the way mirror works. first and second occurrence in this file.  For positioning the liliac air gap parts that aren't part of rotor or stator. 
// Near to origin the rotor long bar is just the 0.3mm air gap off the end of the permanent magnet. 
translate([(rotorLongBarEffectiveLength()/2),0,0])
mirrored([1,0,0])
{
    translate([-rotorLongBarEffectiveLength()/2,0,0])
color("thistle",0.5){ // hold in nylon to top. These are for visual effect, not part of prints, so not precise Y axis.
    translate([-trueAirGap()-holdInNylonLayerThickness(),(rotorLongBarWidth()-rotorMagnetHeight())/2,rotorMagnetHeight()+rotorLongBarHeight()+trueAirGap()+holdInNylonLayerThickness()])
        box([rotorMagnetHeight()+trueAirGap()+holdInNylonLayerThickness(),rotorMagnetHeight(),holdInNylonLayerThickness()], anchor = [-1,-1,-1]); //higher 
    translate([0,(rotorLongBarWidth()-rotorMagnetHeight())/2,rotorMagnetHeight()+rotorLongBarHeight()]) // lower
        box([rotorMagnetHeight(),rotorMagnetHeight(),holdInNylonLayerThickness()], anchor = [-1,-1,-1]); 

// Feature: hold in nylon sandwiching the true are gap, all to the side of permanent magnets
// hold in nylon to side.  These are for visual effect, not part of prints, so not precise Y axis.
//translated(trueAirGap()*-x,[0,1])
translate([0,(rotorLongBarWidth()-rotorMagnetHeight())/2,rotorLongBarHeight()+rotorMagnetHeight()/2]) //one closer to magnet
   box([holdInNylonLayerThickness(), rotorMagnetHeight(), holdInNylonLayerThickness()+rotorMagnetHeight()/2], anchor = [1,-1,-1]);
translate([-(trueAirGap()+holdInNylonLayerThickness()),(rotorLongBarWidth()-rotorMagnetHeight())/2,rotorLongBarHeight()+rotorMagnetHeight()/2]) // one further from magnet
    box([holdInNylonLayerThickness(), rotorMagnetHeight(), trueAirGap() + holdInNylonLayerThickness()*2 + rotorMagnetHeight()/2], anchor = [1,-1,-1]);
    
//Here is another thistle box to show that the gap between main pads, when in full circle is 0.4mm  
  translate([6,-1.50,21.55])  //by trial and error
    box([5, holdInNylonLayerThickness(),  5], anchor = [1,-1,-1]);
}// end thistle color
} // end mirrored
        

statorMagneticCircuit();  // use of module 
}// end translate
}// end module magneticCircuit

/* Note the wriggle room between the exact fit of the 100mm rod versus the 121mm long bar is taken up by very careful fine adjustment (in the 3d printed plastic and in the 3D openscad model) to how the long bar fits relative to the permanent magnets.  One important design principle is that the cuts are exact integer mm.
*/
/* ***********************  Rotor Magnetic Circuit Module *********************** */
module rotorMagneticCircuit(){   //The rotor has two permies and a long bar, i.e. 3 parts in it (plus wire).  
    
// this uses a small offset of 0.02 to even up for exactly 100mm rod.     
translate([((rotorLongBarEffectiveLength() - rotorLongBarSawnLength())/2) + 0.02,0,0])
rotorLongBarInNylon(); // Remember Opposites attract, that governs the direction of what is touching what. 
    
// Sensitive to X length of magnetic circuit, because of the way mirror works. third occurrence in this file.  To get the magnet furthest from the origin in the right X direction position.  
    
translate([rotorLongBarEffectiveLength()-rotorMagnetHeight(),( rotorLongBarWidth()-rotorMagnetHeight())/2,rotorLongBarHeight()]) 
    rotorMagnetInNylon(); // this way the nylon box on the xy plane is below the z axis, which is what we want.  This is the magnet further from the origin   
    
translate([0, (rotorLongBarWidth()+rotorMagnetHeight())/2, rotorLongBarHeight()+rotorMagnetHeight()]) rotate(180,[1,0,0]) rotorMagnetInNylonRight(); // this is the magnet nearer the origin
    //translate([0,rotorLongBarWidth(),rrotorLongBarHeight()]) rotate(180,[1,0,0]) rotorMagnet();
}

/* *********************** Stator Magnetic Circuit Module *********************** */
module statorMagneticCircuit(){ 
// Sensitive to X length of magnetic circuit, because of the way mirror works. fourth occurrence in this file.     
translate([rotorLongBarEffectiveLength()/2,0,0])  
mirrored([1,0,0])
{
    
//where a part is going to be held, rammed down, firmly in place by the Stator Cover or the Rotor Cover, it does not need 0.3mm to just fit in, that dimension of air hole made by nylon should be zero.     
// Sensitive to X length of magnetic circuit, because of the way mirror works. fifth occurrence in this file..     
translate([-rotorLongBarEffectiveLength()/2,0,0]) union(){
translate([-(2*holdInNylonLayerThickness()+trueAirGap()), 
    -(statorMainPadSawnWidth()-rotorLongBarWidth())/2,
    rotorLongBarHeight()+rotorMagnetHeight()+2*holdInNylonLayerThickness()+trueAirGap()]) 
    statorMainPadInNylon(); //sawn width of 12mm runs is in Y axis of this assembly
    
translate([-(2*holdInNylonLayerThickness()+trueAirGap()),0,rotorLongBarHeight()+rotorMagnetHeight()/2])
    rotate(270,[0,1,0])
    statorSidePadInNylon(); //side pad is exactly above long bar.  Need to better align !!!!! WIP
    }// end union
}// end mirrored
    
translate([statorMainPadLength()-(2*holdInNylonLayerThickness()+trueAirGap()),
        (rotorLongBarWidth()-statorMainRodCoilDiameter())/2,
        rotorLongBarHeight()+rotorMagnetHeight()+2*holdInNylonLayerThickness()+trueAirGap()+statorMainPadHeight()-statorMainRodCoilDiameter()])
    statorMainRodInNylon();
// Note that in the OpenSCAD visualisation it appears that the main rod is descedning down in the +Z direction into the space in the more +Z direction than the main pad.  Don't worry, that is only air that is in that space.  If you look closely you see that the copper coil does not descend into this +Z space. 
 
// add copper coils is done in basic metal bits 
  
}
