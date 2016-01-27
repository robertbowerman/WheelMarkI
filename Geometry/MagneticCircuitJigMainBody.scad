include </Users/relativity2.scad>;
use <MagneticCircuitJigStockSupport.scad>;

//Dimensions are not inherited in a pretty way as this is one time use code. 

translated(100*y,[0,1])stockSupport();

difference(){
translate([51,-50-30/2,0])box([120,114,7]);  //main big flat squarish plate
    translate([6,-17,0])box([96, 4, 10], anchor = [-1,-1,0]); // hole for sawblade
}

translate([0,-10,-7])box([114,5,15], anchor = [-1,0,0]); // edge of table

translate([-5,-20,0])box([3,100,7], anchor = [-1,1,-1]);//side stay

translate([105,-20,0])box([3,100,7], anchor = [-1,1,-1]); // side stay

translate([0,-115,0])box([100,3,7], anchor = [-1,1,-1]); // end stay