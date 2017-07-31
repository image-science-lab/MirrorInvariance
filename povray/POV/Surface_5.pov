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

//#declare poseSelect = floor((frame_number-1)*30/final_frame);               //USE THIS INSTEAD OF NEXT LINE WHEN RUNNING FROM SCRIPT
#declare poseSelect = 0;   

#fopen MyFile "Surface5_Sanity.txt" append
#write(MyFile, clock, " ", poseSelect, " ", frame_number , "\n")
#fclose MyFile


#declare poses = array[30][5]{
{-19.024553, 1.085991, -24.690713, -0.904644, -0.777394},
{-5.234353, 11.995437, -8.475361, -0.997754, -0.303015},
{27.288807, -28.493088, -12.011787, 1.905791, 1.184228},
{-1.429303, -24.537952, -2.086859, 1.897739, -0.283402},
{-12.944199, -14.321005, -12.944059, -1.609894, 0.738699},
{20.632126, -2.763444, -29.107070, -1.558215, 1.965932},
{-19.464973, -7.631280, -4.514502, -0.255860, 1.835986},
{30.370961, 14.674789, 24.994995, 1.408701, 0.783666},
{10.728283, 22.768363, -10.276218, 0.472025, 0.354448},
{-15.887840, -9.944352, 14.276452, -1.213792, 1.858660},
{-22.357298, -9.113224, -10.136599, -0.452579, 0.404325},
{-2.022610, 20.379224, 5.477441, -0.718426, 1.466193},
{23.037834, 2.944200, 16.103424, -1.467077, 1.772445},
{-18.389800, 5.879573, 11.192351, 0.278099, -1.791205},
{-30.381266, 28.355321, 25.680439, -0.035845, 1.473702},
{-22.684457, -17.704302, -25.364590, -0.085503, -0.363898},
{5.553243, 1.981863, 14.990115, -0.514252, -0.225427},
{-15.292106, 8.817918, -1.781101, -1.357774, 0.052679},
{23.957385, -19.478987, 29.261662, -1.100574, -1.095259},
{7.504542, 3.961561, 19.213444, 0.631382, -0.620094},
{6.864529, 30.227448, 17.725333, 1.077867, 1.287222},
{-0.339812, 21.303795, -20.133134, 0.569988, -0.712586},
{-30.139779, -0.992476, -26.270500, -0.248299, -0.772288},
{-27.211123, 22.217107, 8.336394, -1.073986, 0.185062},
{22.190245, 3.586939, -5.703554, -1.160244, -1.547173},
{-30.116209, -3.251207, 25.280880, -0.658814, 1.028438},
{-25.364726, -15.519864, -20.541209, -1.113862, -0.160227},
{4.398588, 22.668155, -26.333531, 0.919393, 1.002576},
{-5.448815, 26.921679, -5.927314, -1.633503, 0.532057},
{14.900160, 4.889173, -17.712085, -0.470415, 1.833504},
};
       
object{
    height_field{
        png  "data/Surface5_23755.png"    
        water_level 0.0001
        smooth       
  
    }              
           
       matrix <2,0,0,0,-1,0,0,0,2,-1,0,-1>
       scale <2.5, 2.3754, 2.5>    
       
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
        png  "data/Surface5_23755.png" 
        water_level 0.0001        
        smooth       
  
    }              
                                          
       matrix <2,0,0,0,1,0,0,0,2,-1,0,-1>
       scale <2.5, 2.3754, 2.5>    
  
       
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
                         jpeg     "pebbles_9290205.jpg"
                       map_type 1
                       interpolate 2
                       }
//                rotate <clock*90, clock*180, -clock*360>
        rotate <rand(R1)*360, rand(R2)*180, rand(R3)*360>
        scale 1.0
        }

} 
