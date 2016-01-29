include </Users/relativity2.scad>;
use <MagneticCircuitMetalComponentsInNylonHoles.scad>;

stockSupport();

module stockSupport()
{ // start module

rodDiameter = 6.30;
tenByThreeHeight = 2.93;
tenByThreeWidth = 10.11;
twelveByTwelveSide = 12.17;
    
adjustmentForPrintSlop = 0.3;

holeForRodDiameter = 6.60 + adjustmentForPrintSlop; 
holeForSmallBarHeight = 3.23 + adjustmentForPrintSlop; 
holeForSmallBarWidth = 10.41 + adjustmentForPrintSlop;
holeForBigBar = 12.47 + adjustmentForPrintSlop;  // so unit height of main part is 12.47 + 0.3 + 2 = 14.77, for wedge + 6 = 20
interCentresGap = 16.0;

basePlatformHeight = 6.0;
basePlatformWidth = 30.0;    

//Feature : base that is held to table with G clamps and for second instance by a weight further down table
// overall height = 6+12.47+2 = 20.47

difference()
    { // start difference
box([154,basePlatformWidth,basePlatformHeight], anchor=[0,0,-1], $class="body")  //very base main part
    { //start children of central part of base 
    align([1,0,-1])      
    rod(d=basePlatformWidth, h=basePlatformHeight, anchor=[0,0,-1], $class="body");
            
    align([-1,0,-1])      
    rod(d=basePlatformWidth, h=basePlatformHeight, anchor=[0,0,-1], $class="body");
    
    align([0,-1,1])     
    box([90,basePlatformWidth-5,holeForBigBar+2], anchor=[0,-1,-1], $class="body"); //main part
        
    align([-1,-1,-1])   // table edge holder, slide in two pegs, each 25mm wide x 4.5mm deep
    translated(124*x,[0,1])    
    box([5,4.8,basePlatformHeight], anchor=[0,1,-1], $class="body")  //stick out from base
    align([-1,-1,-1])  
    box([25.4+4.8+4.8,3,basePlatformHeight], anchor=[-1,1,-1], $class="body")
    align([1,1,-1])    
    box([5,4.8,basePlatformHeight], anchor=[1,-1,-1], $class="body");    //side support run x wise cross bar
       
        
      
    } //end children of central part of base 
    union(){
    translate([45-2,30-15,basePlatformHeight+holeForBigBar])rotate(90,[0,0,1])rotate(180,[0,1,0])circuitMetalInRow();
    translate([45-2,30-1-11,basePlatformHeight+holeForBigBar])rotate(90,[0,0,1])rotate(180,[0,1,0])circuitMetalInRow();
    translate([45-2,30-1-22,basePlatformHeight+holeForBigBar])rotate(90,[0,0,1])rotate(180,[0,1,0])circuitMetalInRow();
    translate([45-2,30-1-33,basePlatformHeight+holeForBigBar])rotate(90,[0,0,1])rotate(180,[0,1,0])circuitMetalInRow();
    } // end union
    }// end difference
} // end module

/*
translate([17,0,0])difference(){
//translate([-5,0,9])box([90,25,23], anchor=[-1,0,0], $class="body"); // the main body of the item 

translate([0,0,5])
union(){

    
translate([(interCentresGap*2),0,holeForBigBar-holeForSmallBarHeight])
translated((interCentresGap-2)*x, [0,1])
box([holeForSmallBarWidth, 35, holeForSmallBarHeight], anchor=[-1,0,-1]); // that is the two 10 x 3 holes
    
translate([interCentresGap*4-4+(holeForBigBar-holeForRodDiameter)/2,-35/2,holeForBigBar-holeForRodDiameter/2])
rotate(270, [1,0,0])
rod([holeForRodDiameter, holeForRodDiameter, 35], anchor=[0,0,-1], $fn=100); // the roound hole
    
translate([interCentresGap*5-10, 0, holeForBigBar-holeForSmallBarHeight])
box([holeForSmallBarWidth, 35, holeForSmallBarHeight], anchor=[-1,0,-1]);
}} */

