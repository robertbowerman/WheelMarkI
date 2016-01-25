include </Users/relativity2.scad>;
use <MagneticCircuitJigStockSupport.scad>;

//Dimensions are not inherited in a pretty way as this is one time use code. 

translated(100*y,[0,1])stockSupport();

translate([57,-57-30/2,0])box([114,114,7]);  //main flat plate

translate([0,-10,-14])box([114,7,30], anchor = [-1,0,0]);