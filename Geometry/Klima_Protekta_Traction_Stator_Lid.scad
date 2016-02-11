// Klima_Protecta_Traction_Stator_Lid

/* The purpose of the part: is to make the high voltage traction electrics waterproof and also free from dust.  The coils and switching semiconductors are thus hermetically sealed with the 'biscuit tin' shaped stator.  This lid part is just like the lid on a biscuit tin.  The lid is part of the stator, and part of what makes it waterproof. 

Features:

0) Buttery smooth surface to avoid friction if the stator touches the rotor. 
1) Flat cylinder with rounded edges. 
2) Holes to screw lid onto Stator Body with - with countersunk holes. 16 of them.  Note that the lid itself is not holding the weight of the car, but it is holding the electromagnets in (which want to stick onto the permanents).  This em pull is much less than it might be because its pulling equally on both ends.  A bit of asymmetry in constuction however could put more force on one end rather than the other. 
4) Channel for waterproof seal - runs inside of screws and outside of electromagnets. 
5) Window to let light out - circular
6) Window to let light in - to match grey's disk



Later
a) Print in nylon as that is stronger and provides a lower friction surface.  For now it is PLA. 
b) Have the lid snap on, where the snaps are on living hinges, rather than screw on.  This would make it much easier and faster to get the lid on and off. 
*/

include </Users/Robert/GitHub/KlimaProtekta/Traction/Geometry/Klima_Protekta_Traction_Dimensions.scad>;

// Feature 1: Flat cylinder with rounded edges.  

statorDiameter = 250; //which just fits on the glass bed X axis of MendelMax 2, maybe use 249?

roundedEdgeRadius = 3;
flatBottomOfLidRadius = statorDiameter/2;  //glass of X is 250mm
flatTopOfLidRadius = flatBottomOfLidRadius - roundedEdgeRadius;

lidVerticalEdge = 7; //mm
difference(){
union(){
   color("Aqua"){
    translate([0,0,lidVerticalEdge]) rotate_extrude(convexity = 10, $fn = 100) translate([flatTopOfLidRadius, 0, 0]) circle(r = roundedEdgeRadius, $fn = 100);
    translate([0,0,lidVerticalEdge-roundedEdgeRadius])cylinder(h = roundedEdgeRadius * 2, r1 = flatTopOfLidRadius, r2 = flatTopOfLidRadius, center = false, $fn = 100);   //false so that z ranges from 0 to h, not -h/2 to h/2  
    cylinder(h = lidVerticalEdge, r1 = flatBottomOfLidRadius, r2 = flatBottomOfLidRadius, center = false, $fn = 100);    
    } // end of colour
} // end of union

// Feature 2: Holes to screw lid onto Stator Body with

bolt3MHeadDiameter = 5.78; //mm   , derived from 5.54 + 0.24 = 7.78
bolt3MHeadLength = 2.25; //mm , measures at exactly 2.0, plus allowance to avoid scuffing.  
bolt3MBodyDiameter = 3.0; //this is diameter of hold to comfortably fit screw which is actually 2.76mm (allowing 0.24mm in diameter for easy fit). 
bolt3MBodyLength = 50.0;
numberOfLidScrews = 16; // quantity

color("DarkMagenta"){
for(screwCount = [0 : 1 : numberOfLidScrews-1]){
    // bottom of screw goes down 1mm to ensure clean cut out. 
    rotate(screwCount * 360/numberOfLidScrews, [0,0,1]) translate([flatBottomOfLidRadius-roundedEdgeRadius-(5.25/2),0,-1]) union(){
    translate([0,0,lidVerticalEdge + roundedEdgeRadius - bolt3MHeadLength])cylinder(h = bolt3MHeadLength * 1.5, r1 = bolt3MHeadDiameter/2, r2 = bolt3MHeadDiameter/2, center = false, $fn = 20);  //room for head of screw, like a countersink
    cylinder(h = lidVerticalEdge * 1.5, r1 = bolt3MBodyDiameter/2, r2 = bolt3MBodyDiameter/2, center = false, $fn = 20);     //room for body of the screw going all the way through
} // end union
} // end for
} // end colour

// Feature NN: Window for Light in

lightSourceDiameter = 5; 
//flatBottomOfLidRadius-roundedEdgeRadius-(5.25/2)
translate([0, 105.25-2.5, -1]) cylinder(h = lidVerticalEdge * 2, r1 = lightSourceDiameter/2, r2 = lightSourceDiameter/2, center = false, $fn = 50);  

numberOfLightDetectors = 9 ;
lightSensorDiameter = 5;
for(lightDetectorCount = [0 : 1 : numberOfLightDetectors -1]){
    
    translate([0, 105.25-2.5-6-(lightDetectorCount*lightSensorDiameter), -1]) cylinder(h = lidVerticalEdge * 2, r1 = lightSensorDiameter/2, r2 = lightSensorDiameter/2, center = false, $fn = 50);  
    
} // end for light detectors



} // end difference
