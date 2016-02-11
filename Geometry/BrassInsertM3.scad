/* Inserts

RS Pro Brass Insert, M3 Thread Size.  Fixing hole diameter 4.0mm.  Body outside diameter 4.22mm.  Body depth 4.78mm.  Thickness of material, minimum 6.7mm.  Made of Brass. Brass is a metal alloy made of copper and zinc.  Brass provides low friction (which is useful here). It has a high malleability (useful here). Brass is not ferromagnetic. 
RS Stock No.278-534
A range of expansion inserts suitable for use with most plastic materials, using either through or blind holes. Knurled outer diameter with expansion slots prevent rotation or loosening due to vibration and ensures consistent self-locking pressure on the fixing screws.  
Use in drilled or moulded-in holes.  Install by simple press or hammer-in methods
*/

include </Users/relativity2.scad>;

function insertFixingHoleDiameter() = 4.0; // even though that is smaller than the 4.22 measured diamter it is the spec to really hold the insert in
function insertFixingHoleDepth() = 4.78 + 0.3; //not too deep incase it swallows up the hammered in part.  The aim is to use 0.1 of that for real, and 0.2 for differed.
function mountingCylinderDiameter() = 8.0; // should be ample to make it strong
function mountingCylinderDepth() = 6.7 + 0.3; // should be ample to make it strong.


insertM3();

module insertM3() {
    color("red") 
    differed("hole", "body") 
    rod(d=mountingCylinderDiameter(), h=mountingCylinderDepth(), anchor= [0,0,-1], $class="body", $fn = 50) // this anchor puts the rod above the Z axis
    align([0,0,1]) // note center=[0,0,0]
    translate([0.0,0.0,-insertFixingHoleDepth()+.01])  
    rod(d=insertFixingHoleDiameter(), h=insertFixingHoleDepth(), anchor= [0,0,-1], $class="hole", $fn = 50); // the hole we want
}