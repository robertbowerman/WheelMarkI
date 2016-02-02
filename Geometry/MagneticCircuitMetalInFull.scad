/* Magnetic Circuit in full.

Remember that the OpenSCAD Relativity Library commands of align and anchor are unavailable as we are using modules, not rod, box and ball.  

This one circuit is 1/48 of a wheel.  So 32kW for car, is 8kw per wheel, is 167 watts per coil.  by comparison  a cheap food blender has a 400 watts motor. A vitamix food blender has a 1.4kW motor (ac brushed) about the size of your fist.
*/

use </Users/relativity2.scad>;
use <MagneticCircuitMetalComponents.scad>;
use <MagneticCircuitMetalComponentsInNylonHoles.scad>;
include <MagneticCircuitJigforMetalCuttingWithDimensionsREADME.scad>;

// We have to ensure that the permanent magnet is fully snug in its hole in one direction, and the pads are fully snug in their holes in the other direction. Will be done by hold in covers.
// Note magnets are a tad narrower than the long rotor bar - this will be taken into account in creating their holes in nylon

function magneticCircuitInnerRadius() = 123.5; 
echo("Width for 3D Print on X Axis", 2*magneticCircuitInnerRadius()-5-3+2);

for (circuit = [0:47]) //:47
    rotate(360/48*circuit, [1,0,0]) 
    translate([0,0,-magneticCircuitInnerRadius()]) //this dimension found by trial and error, but it works exactly */
    magneticCircuit();

module magneticCircuit(){
    translate([0,-rotorLongBarWidth()/2,0]){
    
rotorMagneticCircuit();

// Feature: hold in nylon andwiching the true are gap, allabove permanent magnets
//translated((rotorLongBarSawnLength()-rotorMagnetHeight())*x, [0,1])
//translated((trueAirGap()+holdInNylonLayerThickness())*z,[0,1])
//translate([120,0,0])
translate([rotorLongBarSawnLength()/2,0,0])
mirrored([1,0,0])
{
    translate([-rotorLongBarSawnLength()/2,0,0])
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

module rotorMagneticCircuit(){
//module rotorMagneticCircuit(rotorLongBarWidth(), rotorLongBarHeight(), rotorLongBarLength()){
rotorLongBarInNylon(); // Remember Opposites attract
    
translate([rotorLongBarSawnLength()-rotorMagnetHeight(),(rotorLongBarWidth()-rotorMagnetHeight())/2,rotorLongBarHeight()]) 
    rotorMagnetInNylon(); // this way the nylon box on the xy plane is below the z axis, which is what we want.  This is the magnet further from the origin   
    
translate([0, (rotorLongBarWidth()+rotorMagnetHeight())/2, rotorLongBarHeight()+rotorMagnetHeight()]) rotate(180,[1,0,0]) rotorMagnetInNylonRight(); // this is the magnet nearer the origin
    //translate([0,rotorLongBarWidth(),rrotorLongBarHeight()]) rotate(180,[1,0,0]) rotorMagnet();
}


module statorMagneticCircuit(){ 
translate([rotorLongBarSawnLength()/2,0,0])  
mirrored([1,0,0])
{
    
//where a part is going to be held, rammed down, firmly in place by the Stator Cover or the Rotor Cover, it does not need 0.3mm to just fit in, that dimension of air hole made by nylon should be zero.     
translate([-rotorLongBarSawnLength()/2,0,0]) union(){
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
