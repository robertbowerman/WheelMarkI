/* Stator Coil Outer Cover 

The flat bed of the Mendelmax 3 is 250 mm wide x 315 mm long x 197mm high.

We want 48 of these coil covers
3mm gap between prints

315 is within 103.2*2+3*2=212.4
 
This file prints 9 * 3 = 27 inner covers.  We need 48 of them, so 
Print this lot twice, allows a few (i.e. 6) spares.


Two nickel plated brass inserts of M3 size from RS Components (part number 278-534) are inserted into each of these 48 parts. The fixing hole diameter is 4mm.  Body outside diameter is 4.22mm, Body Depth is 4.78mm, and the spec sheet finishes by saying Minimum thickness of material 6.7mm.  
*/

include </Users/relativity2.scad>;

bottomPegIn = 1.0; //Securing of bottom of this strip into the bottom of stator tin
topPenIn = 3.0; // thickness of top layer of biscuit tin
insertHoleDiameter = 4.00;
coverThickness = 6.7; //due to inserts


coverLength = 103.2 + bottomPegIn + topPenIn; // same length as inner cover, plus 1mm at bottom to stick in and 3mm at top to rise up to meet the screwed on lid
echo("cover length", coverLength);

coverWidth = 10.0; // narrower than the sawn 12 x 12 steel to allow wires out
holeFromEnd = 15.57; 
interHoleXGap = coverLength - (holeFromEnd * 2);
holeDiameter = insertHoleDiameter;

//Label bottom and top, number them 
difference(){
translated((coverLength+3)*x,[0,1,2])     // lots of covers 3 in a column 
translated(4*15*y, [0,1]) // lots of covers 9 in a , so 3 spare
difference(){
translated(15*y, [0,1,2,3]) // lots of covers 9 in a , so 3 spare
    difference(){
        color("green") box([coverLength, coverWidth, coverThickness], anchor=[-1,-1,-1]); // the cover itself
        
        translate([holeFromEnd+bottomPegIn,0,0]) // move hole from top
        translated(interHoleXGap*x, [0,1]) 
        translate([0,coverWidth/2,0])         
        //translate([0,coverWidth/2-holeDiameter,0]) //first one created is further from X=0
        rod(d=holeDiameter, h=20, $fn=20, anchor=[0,0,0]);
      }
    translate([holeFromEnd+bottomPegIn+10,coverWidth/2,0]) 
  rod(d=holeDiameter, h=20, $fn=20, anchor=[0,0,0]);
  }
  translate([holeFromEnd+bottomPegIn+20,coverWidth/2,0]) 
  rod(d=holeDiameter, h=20, $fn=20, anchor=[0,0,0]);
  }
  