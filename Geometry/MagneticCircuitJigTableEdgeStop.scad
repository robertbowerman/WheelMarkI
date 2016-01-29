/* MagneticCircuitJigTableEdgeStop.scad
Magnetic Circuit Jig for Cutting Iron. Table Edge Guides.

These two posts go vertically down from the jig in order to keep it snug against the edge of the table. 

They are printed separately so that the main body of the jig can be printed without fancy support structured, printed flat on the print bed.

Assembly: These pegs slide in vertically with the head towards the sky (to stop them dropping through.  

*/
include </Users/relativity2.scad>;

pegBodyHeight = 42.0; //mm plenty of vertical guidance
pegBodyWidth = 25.0; //mm to make it good and strong mounting
pegBodyDepth = 4.5; //mm 
pegHead = 4.5;

tableEdgeStop();

module tableEdgeStop(){
translated(pegBodyHeight*y, [0,1])
box([pegBodyWidth+2*pegHead,pegBodyDepth+pegHead,pegHead], anchor = [0,1,-1])
align([0,1,1])
box([pegBodyWidth,pegBodyDepth,pegBodyHeight], anchor = [0,1,-1]);
}
