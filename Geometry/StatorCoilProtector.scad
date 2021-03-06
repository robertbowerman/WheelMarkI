/* Stator Coil Protector Cover = inner cover

The flat bed of the Mendelmax 3 250 mm wide x 315 mm long x 197mm high.

We want 48 of these coil protectors
3mm gap between prints

315 is within 103.2*2+3*2=212.4
 
This file prints 9 * 3 = 27 inner covers.  We need 48 of them, so 
Print this lot twice, allows a few (i.e. 6) spares.

*/

include </Users/relativity2.scad>;
use <MagneticCircuitJigforMetalCuttingwithDimensionsREADME.scad>;

function coverLength() = statorMainRodSawnLength() + 2 * (statorMainPadHeight() + statorSidePadHeight()) - justFitSize();
function coverWidth() = statorMainPadSawnWidth() - justFitSize(); // same as sawn 12 x 12 sawn steel
function coverThickness() = goodMinimumThicknessForRigidStrength(); // good 
holeFromEnd = statorMainPadHeight() + statorSidePadHeight() + enamelledCopperWire20SWGDiameter(); // 12.17 + 3, nicely placed for wire
interHoleXGap = coverLength() - (holeFromEnd * 2);
holeDiameter = enamelledCopperWire20SWGDiameter() + justFitSize();

translated((coverLength() + 5) *x,[0:2])     // lots of covers 3 in a column 
translated(15*y, [0:8]) // lots of covers 9 in a , so 3 spare
innerCover();

/* ****************************** Module innerCover() ** is the Stator Coil Protector ****************************** */
module innerCover() {
    difference() {
        box([coverLength(), coverWidth(), coverThickness()], anchor=[-1,-1,-1]); // the cover itself
        union() {
            translate([holeFromEnd,0,0]) // move hole from top
            translated(interHoleXGap*x, [0,1]) 
            translate([0,coverWidth()/2,0])
            mirrored([0,1,0]) {      //creates two, for left & right sides of cover
                translate([0,coverWidth()/2-holeDiameter,0]) //first one created is further from X=0
                rod(d=holeDiameter, h=20, $fn=20, anchor=[-1,-1,0])
                align([-1,0,0])
                box([holeDiameter,holeDiameter,20], anchor=[-1,-1,0]);
            } // end mirrored
        } // end union
    } // end diference
} // end inner cover module