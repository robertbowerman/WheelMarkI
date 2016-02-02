/*  Jig is to do exact cuts of 14, 12, 100 and 121mm. 

*/

include </Users/relativity2.scad>;
use <MagneticCircuitJigStockSupport.scad>;
use <MagneticCircuitMetalComponentsInNylonHoles.scad>;

//Dimensions are not inherited in a pretty way as this is one time use code. 

powerSawCuttingPlateWidth = 70.12; //mm
powerSawCuttingPlateLength = 148.04; //mm
powerSawBladeWidth = 1.02; //mm

endStopHeight = 20.47; //base of stock support is 7mm tall, main body +23 -9



//translated(100*y,[0,1])
stockSupport();

differed("hole","body")  //creates hole for sawblade in main plate
translate([0,-17.6,20.47])
    box([powerSawCuttingPlateLength,powerSawCuttingPlateWidth,5], anchor=[0,0,-1], $class="body")  //main big flat squarish plate
        {  //allows some children to go off in one direction others in another
        align([0,1,1]) // vertically above it and to the -y direction
        translated((powerSawCuttingPlateWidth-3)*y,[0,-1])
        box([powerSawCuttingPlateLength,3,7], anchor = [0,1,-1], $class="body"); // edge stay above 
                
        align([0,0,0])  // fully centered hole for sawblade      
        box([96, 4, 20], anchor = [0,0,0], $class="hole") // hole for sawblade
            
        //translate([43,0,7])align([0,0,-1]) rotate(90,[0,0,1])rotate(180,[0,1,0])circuitMetalInRow(); // For testing -- comment out before printing these 
            
        align([0,0,-1])  //  centered and below.  End stop of 14mm for 10x3 flat bar.     
        translate([4,-14,7.49])box([26, 4, endStopHeight], anchor = [0,1,1], $class="body"); // end stop for 14 on 10x3  
            
        align([0,0,-1])  //  centered and below. End stop of 12mm for 12x12 square bar      
        translate([4-30-2,-12,0])box([30, 4, endStopHeight], anchor = [0,1,1], $class="body"); // end stop for 12mm on 12x12  
            
        align([0,0,-1])  //  centered and below, end stop for rod      
        translate([24,-100,0])box([13, 4, endStopHeight], anchor = [0,1,1], $class="body"); // end stop
        
        align([0,0,-1])  //  centered and below, end stop for longest bar flat one 10 x 3 x 121    
        translate([38,-121,0])box([15, 4, endStopHeight], anchor = [0,1,1], $class="body"); // end stop 
            
        align([0,-1,-1]) //extension of saw plane to support furthest away end stops   
        translate([32,-30,0])box([31,120,5], anchor=[0,0,-1], $class="body"); 
        
        align([0,0,-1])  //  centered and below       //its another side support, to stop sagging on a long bridge
        translate([46,-5,0])box([3, 120, endStopHeight], anchor = [0,1,1], $class="body"); // end stop for longest flat 
        
        align([0,0,-1])  //  centered and below       //its another side support, to stop sagging on a long bridge
        translate([18,-14,0])box([3, 110, endStopHeight], anchor = [0,1,1], $class="body"); // end stop for longest flat 
            
        }  //allows some children to go off in one direction others in another
       


