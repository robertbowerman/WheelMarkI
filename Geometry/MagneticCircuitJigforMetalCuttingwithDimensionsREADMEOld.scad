/* Jig for Cutting Iron parts for Magnetic Circuit for Wheel Mark I
This file does not show any visual geometry.

To Cut - Here Dimensions are just to the nearest mm.  They are refined in discussion below.
    3mm x 10mm x 121mm  Qty 1    Rotor circuit maker, cut is at 121mm
    12mm x 12mm x 12mm  Qty 2    Stator EM main pads, cut is at 12mm
    3mm x 10mm x 14mm   Qty 2    Stator EM side pads, cut is at 14mm  
    6mm diameter x 100mm Qty 1   Stator EM windings core, cut is at 100mm

Holes to fit these in for easy slide in / out without rattle, so 0.3mm free on each axis
3DP printers tend to print holes a bit smaller than specified in the STL, so add a further 0.3mm for this part.

Enamelled Copper wire is 20SWG actuals 0.87, 0.88, 0.94, 0.94, 0.94, 0.94, 0.95.  Avg 0.94.  So windings per 100mm is 106.38. Or width to get 100 windings 94.0mm.  Allow room to jam the windings into.  Really 1mm free each end would not go amiss.    This design suits 100 windings. (not more or less as per earlier designs)  Conclusion do 100 windings per row, three rows for 300 in all.  100 x .94 is 94mm.  Need to cut at 100. Leaves 5mm to hold in chuck and or allow for gaps in the winding and for all to fit. 

The copper wire that has no enamel, used for touch detection is extracted from grey three core and earth household wiring, called 1mm2.  The copper wires with plastic insulation sheaths stripped off are: 1.05, 1.06, 1.06, 1.07, 1.07.  So take wire diameter as 1.06mm.  The earth is the same diameter as the other three. 

The permanent magnets are 9.92, 9.93, 9.94, 9.95,9.96.  So make holes 9.95 + 0.03. Will need to experiment to ensure snug fit, without rattle and assemble-able. Perhaps use 0.3mm one way and 0.1mm the other way.  Calibration test may be needed, adjusting extrusion rate. 

Get good at winding coils, probably with the aid of another jig

Metal Stock with actuals

12mm x 12mm.  From B&Q over the counter.  
    12.05, 12.08, 12.16, 12.17, 12.18 -> Make hole 12.47mm in both x and y on metal that is 12.17 x 12.17 x 12.0
3mm x 10mm.  From Metalbits via Internet.
    2.90, 2.91, 2.92, 2.93, 2.94 -> Make hole 3.23mm wide on metal that is 2.93 x 10.11 x 14.0, 
    9.96, 9.98, 10.00, 10.11, 10.12 -> Make hole 10.41mm tall        and 2.93 x 10.11 x 121.0
6mm diameter. From B&Q over the counter. 
    5.96, 6.11, 6.14, 6.18, 6.22 (this is smaller)
    6.08, 6.28, 6.29, 6.30, 6.36  -> Say its 6.30 diameter. Make hole 6.60mm diameter, on metal that is 6.30 x 6.30 x 100mm

Does B&Q sell all of these online? No - only the same as in the shop, so the 3 x 10 needs to be both off metalbits.  I have purchased all of them off metalbits.
*/

function statorMainRodDiameter() = 6.30;
function statorMainRodSawnLength() = 100.0;

function rotorLongBarHeight() = 2.93;
function rotorLongBarWidth() = 10.11;
function rotorLongBarSawnLength() = 121.0; 

function statorSidePadHeight() = rotorLongBarHeight();  //2.93;
function statorSidePadWidth() = rotorLongBarWidth(); //10.11;
function statorSidePadSawnLength() = 14.0;       

function statorMainPadHeight() = 12.17;
function statorMainPadWidth() = statorMainPadHeight(); //12.17
function statorMainPadSawnLength() = 12.0; //use machine cut face for facing towards permanent magnet. 

function rotorMagnetHeight() = 9.95; //this is the permanent Neodymium magnet with an advertised strength of 4.7kg and N42 material. from first4magnets.com. 

function justFitSize() = 0.3; //This is the extra size on an axis you have to include to just fit a part into a nylon hole.  We allow the same for clearance for the nozzle in closing the hole up after insertion. 

function nozzleDiameter() = 0.4;
function trueAirGap() = 0.7; 


/*
Cuts needed
    Of the 12x12 stock, cut at 12mm
    Of the 3x10 stock, cut at 14mm and also at 121mm
    Of the 6x6 stock, cut at 100mm

The electric jig power saw has the following dimensions. The blade is 1.02mm wide so we assume it makes a cut of 1.02mm wide. The Saw's cutting plate is 70.12mm wide and 148.04mm long.  The blade is hte centre of the 70.12cm but has some wobble.  Nominally and normally the edge of blade to edge of saw base is 30.03mm, but with wobble it can go downto 28mm and up to 33 to 36mm call it 34.5mm -- but we'll take 34.21mm as our number.  

G clamp details
    I have clamps that separate 0 to 50mm (which takes 30mm of talble), 55 to 150mm and 0 to 110mm.  Use first and last 
    
Table top details (its the Idea table in the hall)
    27mm of overhang to clamp onto
    20.45mm of thickness to clamp onto

(Stator EM side pads could have been made of 3 x 12 but thats more types of iron bar to buy and anyway the magnet is only 10 wide)
*/

/* Uses The Openscad General Library of Relativity, found on Thingiverse.  See http://www.thingiverse.com/thing:349943
Downlaod from Thingiverse.  Their filename has a lot of dots in it so I've renamed it relativity2.scad. 

The code is held at https:github.com/davidson16807/relativity.scad/wiki
The wiki has helpful instructions 
*/