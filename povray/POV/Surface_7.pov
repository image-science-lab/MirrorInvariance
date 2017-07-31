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

//#declare poseSelect = floor((frame_number-1)*30/final_frame);   ////USE THIS INSTEAD OF NEXT LINE WHEN RUNNING FROM SCRIPT
#declare poseSelect = 0;   

#fopen MyFile "Surface7_Sanity.txt" append
#write(MyFile, clock, " ", poseSelect, " ", frame_number , "\n")
#fclose MyFile


#declare poses = array[30][5]{
{18.567435, 12.600114, 16.000043, -1.696583, -1.573389},
{23.334416, -27.310003, -14.317859, -1.784200, 1.847592},
{-21.874668, -12.184378, 2.095004, 0.123190, -1.981463},
{25.287676, -26.288092, 10.126010, 1.116669, 1.099642},
{6.853529, -22.709750, 24.428183, 1.736043, 1.269213},
{-22.809085, 20.668601, 28.895638, -1.480375, 1.474779},
{-11.810836, 13.190838, 3.730957, 0.275295, -1.662257},
{2.962367, -11.202457, -20.422143, -0.122437, -0.400869},
{28.327292, 27.980210, -20.959686, -1.952392, -0.960518},
{28.174639, -27.156717, -13.322911, -0.651509, 1.200274},
{-20.186709, -4.604086, 21.568900, -1.351271, -0.274345},
{29.725791, -6.742696, -14.255645, 1.177138, 1.642590},
{27.411683, 14.943527, 18.622531, -0.755140, -1.272612},
{2.183186, 19.415141, -15.295887, 0.114133, -0.944788},
{18.863604, -18.805090, 24.524865, -1.337405, -1.417844},
{-20.886069, 0.528743, -9.234004, 0.407928, -1.455726},
{-2.933232, -2.780679, -17.881555, -0.948115, 1.477169},
{25.059281, 8.078098, -13.685191, 0.616316, 0.318818},
{17.904352, 10.829326, 8.443508, 0.756858, 0.199441},
{27.167651, 15.940812, -1.350975, 0.992606, -1.420181},
{10.294411, -14.010634, -7.376766, -0.197834, 1.412124},
{-28.336182, 11.614463, 20.799049, -1.664714, 0.488221},
{21.714325, 10.507741, 6.940890, -1.084092, -0.596190},
{28.623562, -18.307570, 2.007908, 1.653349, 0.052998},
{10.308224, -21.408717, 26.212035, -1.390488, -0.392768},
{16.857997, -0.643595, -11.762118, 1.303268, -1.696133},
{16.254001, 28.380337, 14.992237, 0.153370, -1.040335},
{-7.593730, -10.009116, 15.257955, 1.984539, -1.506724},
{8.559036, 5.980489, -5.917705, -1.687298, -1.264369},
{-18.428852, -16.048221, 4.868500, -0.229287, -1.040190},
};
       
object{
    height_field{
        png  "data/Surface7_25760.png"    
        water_level 0.0001
        smooth       
  
    }              
           
       matrix <2,0,0,0,-1,0,0,0,2,-1,0,-1>
       scale <2.5, 2.5760, 2.5>    
       
       rotate poses[poseSelect][0]*x //SET POSE HERE
       rotate -poses[poseSelect][1]*z //SET POSE HERE
       rotate poses[poseSelect][2]*y //SET POSE HERE
       translate <poses[poseSelect][3], 0,  -poses[poseSelect][4]>

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
        png  "data/Surface7_25760.png" 
        water_level 0.0001        
        smooth       
  
    }              
                                          
       matrix <2,0,0,0,1,0,0,0,2,-1,0,-1>
       scale <2.5, 2.5760, 2.5>    
  
       
       rotate poses[poseSelect][0]*x //SET POSE HERE
       rotate -poses[poseSelect][1]*z //SET POSE HERE
       rotate poses[poseSelect][2]*y //SET POSE HERE
       translate <poses[poseSelect][3], 0,  -poses[poseSelect][4]>

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
                         jpeg     "pebbles_9290205.jpg"         //CHANGE TEXTURE HERE
                       map_type 1
                       interpolate 2
                       }
//                rotate <clock*90, clock*180, -clock*360>
        rotate <rand(R1)*360, rand(R2)*180, rand(R3)*360>
        scale 1.0
        }

} 
