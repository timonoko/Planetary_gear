include <gears.scad>

module planeetta() {
  spur_gear (modul=1, tooth_number=16, width=4.8, bore=3.6, pressure_angle=20, helix_angle=00, optimized=true);
}

module nuppi() {
      spur_gear (modul=1, tooth_number=7, width=5, bore=0, pressure_angle=20, helix_angle=00, optimized=true);
      translate([0,0,5])cylinder(d1=20,d2=18,h=20,$fn=6);
      translate([0,0,5])rotate([0,0,30]) cylinder(d1=20,d2=18,h=20,$fn=6);
      translate([0,0,5])cylinder(r1=22,r2=20,h=2);
}

module kampi() {
  difference(){
    union() {
      translate([0,0,-2])cylinder(r=19,h=2);
      translate([11.7,0,0])cylinder(d=3,h=5);
      translate(-[11.7,0,0])cylinder(d=3,h=5);
      translate([0,0,-10])cylinder(d=10,h=8);
    }
    translate([0,0,-11])cylinder(d=6,h=12,$fn=6);
  }
}      

module rengas() {
  translate([0,0,-1])ring_gear (modul=1, tooth_number=40, width= 6, rim_width=1, pressure_angle=20, helix_angle=0);
  translate([0,0,-16])
    difference(){
    cylinder(r=22,h=15);
    cylinder(r=20,h=15);
  }
}


module panta() difference() {
 cylinder(d=48,h=10);
 translate([0,0,1])cylinder(d=44.7,h=20);
 translate([0,0,0])cylinder(d1=41,d2=45,h=2);
}

module pohja() difference() {
  cylinder(d=40,h=4,$fn=100);
  cylinder(d=13,h=5);
}


module printtaus() {
  translate([66,0,0])pohja();
  translate([0,0,0])nuppi();
  translate([34,0,0])planeetta();
  translate([40,18,0])planeetta();
  translate([66,0,16])rotate([0,0,0])rengas();
  translate([21,39,10])kampi();
  panta();
}

module koossa(){
  color("VIOLET")translate([0,0,7])rotate([0,180,0])panta();
  rengas();
  color("YELLOW")  rotate([0,0,23])nuppi();
  color("RED")kampi();
  color("BLUE")translate([11.7,0,0])planeetta();
  color("BLUE")translate([-11.7,0,0])planeetta();
  translate([0,0,-16])pohja();
}

printtaus();

//difference(){koossa();translate([0,0,-23]) cube(100);}


