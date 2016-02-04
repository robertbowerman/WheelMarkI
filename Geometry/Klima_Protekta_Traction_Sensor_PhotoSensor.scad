/* Component - photosensor - dimensions go in here to be used in constructive geometry.  Measurements made with digital vernier calipers and are in mm. 

These are Photodiodes.  Price for 15 was £2.27, with free UK delivery.  Came from China.  

Long leg of LED is the positive leg, called the anode (little nose), shown in circuit diagrams as the base of the arrow in the diode symbol. 
Short leg of LED is the negative leg, called the cathode (larger flag), shown in circuit diagram as the flat bar at the point of the arrow in the diode symbol.

Form a potential divider between +5V and ground where:
1) 1M ohm resistor from +5V to cathode [short leg] of photodiode  (resistor colour code: brown black green gold)
2) anode of photodiode to ground
3) where resistor meets photodiode (cathode) attach to Arduino. 
      A) start with analogue in and report result to console. Called "Read Analogue Voltage".  Note that the sketch converts the analog reading (which goes from 0 - 1023) to a voltage (0 - 5V) by multiplying the sensor value by 5/1023
      ----> really bright light shining on the photodiode gives zero volts (I've proven these values)
      ----> night time room electric ceiling light gives 0.12 volts
      ----> put a cover on it like a pen cap to shut out the light, goes to 4.81 volts.
      B) When coupled with a LED under a cover (pen cap covers both LED and photosensor)
      ---> LED off is 4.4 volts
      ---> LED on is 0.7 volts
      C) Digital Read, 
      ---> in ambient room light, or next to a bright LED its zero
      ---> under a pen cover its in darkness and goes to 1
      D) Will use a comparator, but just doing this as a digital input read appears to be fine 
      E) test again with actual 3D printed Grays disk and Tower of Light.  Adjust resistors to get good reliable repeatable binary values in to Arduino. 


Weight 4 grams. 

20 to 30ma of current in bright light with 9 volt reverse bias. 
dark current is about zero. 

*/
include </Users/relativity2.scad>;

function photosensor_body_height() = 4.43;
function photosensor_body_diameter() = 4.80; // nominal 5mm in spec
function photosensor_hat_rim_height() = 0.85;
function photosensor_hat_rim_diameter() = 5.71;
function photosensor_wire_long_length() = 29.0; 
function photosensor_wire_short_length() = 27.25; 
function photosensor_wire_diameter() = 0.60; 
function photosensor_wire_offset() = 2.0; 

function photosensor_unit_price() = 2.00; // Pounds Sterling

photosensor();


module photosensor(){

color("yellow")cylinder(photosensor_body_height(),photosensor_body_diameter()/2,photosensor_body_diameter()/2, $fn=100);
translate([0,0,-photosensor_hat_rim_height()])
color("orange")cylinder(photosensor_hat_rim_height(),photosensor_hat_rim_diameter()/2,photosensor_hat_rim_diameter()/2, $fn=100);

translate([-photosensor_wire_offset()/2,0,-photosensor_wire_long_length()])
cylinder(photosensor_wire_long_length(),photosensor_wire_diameter()/2,photosensor_wire_diameter()/2, $fn=4);
translate([photosensor_wire_offset()/2,0,-photosensor_wire_short_length()])
cylinder(photosensor_wire_short_length(),photosensor_wire_diameter()/2,photosensor_wire_diameter()/2, $fn=4);
}