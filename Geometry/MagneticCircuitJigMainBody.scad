/*  Jig is to do exact cuts of 14, 12, 100 and 121mm. 

*/

include </Users/relativity2.scad>;
use <MagneticCircuitJigStockSupport.scad>;

//Dimensions are not inherited in a pretty way as this is one time use code. 

powerSawCuttingPlateWidth = 70.12; //mm
powerSawCuttingPlateLength = 148.04; //mm
powerSawBladeWidth = 1.02; //mm

endStopHeight = 20.47; //base of stock support is 7mm tall, main body +23 -9



translated(100*y,[0,1])stockSupport();

differed("hole","body")
translate([51,-17.6,20.47])
    box([powerSawCuttingPlateLength,powerSawCuttingPlateWidth,5], anchor=[0,0,-1], $class="body")  //main big flat squarish plate
        {  //allows some children to go off in one direction others in another
        align([0,1,1]) // vertically above it and to the -y direction
        translated((powerSawCuttingPlateWidth-3)*y,[0,-1])
        box([powerSawCuttingPlateLength,3,7], anchor = [0,1,-1], $class="body"); // edge stay above 
                
        align([0,0,0])  // fully centered       
        box([96, 4, 20], anchor = [0,0,0], $class="hole"); // hole for sawblade
            
        align([0,0,-1])  //  centered and below       
        translate([0,-12.0,0])box([12, 4, endStopHeight], anchor = [0,0,1], $class="body"); // end stop for 12mm on 12x12  
            
        }  //allows some children to go off in one direction others in another
       

//translate([0,-10,-7])box([114,5,15], anchor = [-1,0,0]); // edge of table

//translate([-5,-20,0])box([3,100,7], anchor = [-1,1,-1]);//side stay

//translate([105,-20,0])box([3,100,7], anchor = [-1,1,-1]); // side stay

