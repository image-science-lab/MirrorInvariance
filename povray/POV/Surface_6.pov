#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"

//background { color White }

camera
{      
       orthographic 
       location <0, 10, 0>
       look_at  <0, 8, 0>  
       right 10*x
       up 10*z
       
   
}

//#declare poseSelect = floor((frame_number-1)*30/final_frame);                   //USE THIS INSTEAD OF NEXT LINE WHEN RUNNING FROM SCRIPT
#declare poseSelect = 0;   

#fopen MyFile "Occl1_Sanity.txt" append
#write(MyFile, clock, " ", poseSelect, " ", frame_number , "\n")
#fclose MyFile


#declare poses = array[30][5]{

};
       
object{
    height_field{
        png  "data/OcclContour1_26000.png"    
        water_level 0.0001
        smooth       
  
    }              
           
       matrix <2,0,0,0,-1,0,0,0,2,-1,0,-1>
       scale <2.5, 2.6, 2.5>    
       
       rotate poses[poseSelect][0]*x //SET POSE HERE
       rotate -poses[poseSelect][1]*z //SET POSE HERE
       rotate poses[poseSelect][2]*y //SET POSE HERE
       translate <poses[poseSelect][3], 0,  poses[poseSelect][4]>
       finish {
               ambient 0
               diffuse 0
               //specular 1
               roughness 0
               reflection 1
       }
    }
object{
    height_field{
        png  "data/OcclContour1_26000.png" 
        water_level 0.0001        
        smooth       
  
    }              
                                          
       matrix <2,0,0,0,1,0,0,0,2,-1,0,-1>
       scale <2.5, 2.6, 2.5>    
  
       
       rotate poses[poseSelect][0]*x //SET POSE HERE
       rotate -poses[poseSelect][1]*z //SET POSE HERE
       rotate poses[poseSelect][2]*y //SET POSE HERE
       translate <poses[poseSelect][3], 0,  poses[poseSelect][4]>
       
       finish {
               ambient 0
               diffuse 0
               //specular 1
               roughness 0
               reflection 1
       }
    }

#declare R1=seed(clock*1000);
#declare R2=seed(clock*2767);
#declare R3=seed(clock*12342);


sky_sphere {
        pigment {
               image_map {
//                       png "Test4.png"
//                        hdr "grace-new.hdr"
                         jpeg     "pebbles_9290205.jpg"
                       map_type 1
                       interpolate 2
                       }
//                rotate <clock*90, clock*180, -clock*360>
        rotate <rand(R1)*360, rand(R2)*180, rand(R3)*360>
        scale 1.0
        }

} 

#declare poses = array[30][2]{
{5.0000, 19.0000},{4.0000, -16.0000},{-29.0000, -23.0000},{-23.0000, 25.0000},{18.0000, 11.0000},{-27.0000, 5.0000},{7.0000, -29.0000},
{-2.0000, 7.0000},{-2.0000, 14.0000},{-24.0000, 26.0000},{-7.0000, 19.0000},{5.0000, -23.0000},{22.0000, -13.0000},{-14.0000, -15.0000},
{-27.0000, 27.0000},{-11.0000, -20.0000},{-27.0000, 29.0000},{-20.0000, 29.0000},{26.0000, -4.0000},{4.0000, -11.0000},{-21.0000, 1.0000},
{3.0000, 5.0000},{-26.0000, 5.0000},{3.0000, 10.0000},{-23.0000, 26.0000},{28.0000, -25.0000},{-2.0000, 11.0000},{-12.0000, 12.0000},
{-22.0000, 12.0000},{-15.0000, -11.0000}
};