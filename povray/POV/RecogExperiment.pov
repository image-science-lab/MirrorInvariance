#include "colors.inc"
#include "textures.inc"
#include "shapes.inc"

//background { color White }

camera
{      
       orthographic 
       location <0, 10, 0>
       look_at  <0, 8, 0>  
       right 12*x
       up 12*z
       
   
}

#declare pSelect = floor((frame_number-1)*10/final_frame);            //USE THIS LINE INSTEAD OF NEXT WHEN USING SCRIPT
#declare poseSelect = 0;   

                            


#declare xPose=seed(pSelect*10000);

#declare poses = array[4][5]{
    { (rand(xPose)-1/2)*60,   (rand(xPose)-1/2)*60,  (rand(xPose)-1/2)*60,  (rand(xPose)-1/2)*3-2,  (rand(xPose)-1/2)*3-2 },
    { (rand(xPose)-1/2)*60,   (rand(xPose)-1/2)*60,  (rand(xPose)-1/2)*60,  (rand(xPose)-1/2)*3-2,  (rand(xPose)-1/2)*3+2 },
    { (rand(xPose)-1/2)*60,   (rand(xPose)-1/2)*60,  (rand(xPose)-1/2)*60,  (rand(xPose)-1/2)*3+2,  (rand(xPose)-1/2)*3+2 },
    { (rand(xPose)-1/2)*60,   (rand(xPose)-1/2)*60,  (rand(xPose)-1/2)*60,  (rand(xPose)-1/2)*3+2,  (rand(xPose)-1/2)*3-2 },
    };
           
#fopen MyFile "Recog_Sanity.txt" append
#write(MyFile, clock, " ", pSelect, " ", frame_number , "\n")
#fclose MyFile

#fopen MyFile1 "RecogSurf1_Poses.txt" append
#write(MyFile1, pSelect, " ", frame_number , " ", poses[0][0], " ",  poses[0][1], " ",  poses[0][2], " ",  poses[0][3], " ",  poses[0][4], "\n")
#fclose MyFile1
#fopen MyFile2 "RecogSurf2_Poses.txt" append
#write(MyFile2, pSelect, " ", frame_number , " ", poses[1][0], " ",  poses[1][1], " ",  poses[1][2], " ",  poses[1][3], " ",  poses[1][4], "\n")
#fclose MyFile2
#fopen MyFile3 "RecogSurf3_Poses.txt" append
#write(MyFile3, pSelect, " ", frame_number , " ", poses[2][0], " ",  poses[2][1], " ",  poses[2][2], " ",  poses[2][3], " ",  poses[2][4], "\n")
#fclose MyFile3                                                                                
#fopen MyFile4 "RecogSurf4_Poses.txt" append
#write(MyFile4, pSelect, " ", frame_number , " ", poses[3][0], " ",  poses[3][1], " ",  poses[3][2], " ",  poses[3][3], " ",  poses[3][4], "\n")
#fclose MyFile4
   
  
       
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
       
       translate <poses[poseSelect][3],-12,-poses[poseSelect][4]>

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

       translate <poses[poseSelect][3],-12,-poses[poseSelect][4]>
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
           
       matrix <2,0,0,0,-1,0,0,0,2,-1,0,-1>
       scale <2.5, 2.3754, 2.5>    
       
       rotate poses[poseSelect+1][0]*x //SET POSE HERE
       rotate -poses[poseSelect+1][1]*z //SET POSE HERE     
       rotate poses[poseSelect+1][2]*y //SET POSE HERE     

       translate <poses[poseSelect+1][3],-4,-poses[poseSelect+1][4]>
       

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


  
       rotate poses[poseSelect+1][0]*x //SET POSE HERE
       rotate -poses[poseSelect+1][1]*z //SET POSE HERE     
       rotate poses[poseSelect+1][2]*y //SET POSE HERE     
       
       translate <poses[poseSelect+1][3],-4,-poses[poseSelect+1][4]>
       
       
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
        png  "data/Surface1.png"    
        water_level 0.001
        smooth       
  
    }              
           
       matrix <2,0,0,0,-1,0,0,0,2,-1,0,-1>
       scale <2.5, 2.31, 2.5>    


       rotate poses[poseSelect+2][0]*x //SET POSE HERE
       rotate -poses[poseSelect+2][1]*z //SET POSE HERE     
       rotate poses[poseSelect+2][2]*y //SET POSE HERE     

       translate <poses[poseSelect+2][3],0,-poses[poseSelect+2][4]>
     

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
        png  "data/Surface1.png" 
        water_level 0.001        
        smooth       
  
    }              
                                          
       matrix <2,0,0,0,1,0,0,0,2,-1,0,-1>
       scale <2.5, 2.31, 2.5>   
       
       
       rotate poses[poseSelect+2][0]*x //SET POSE HERE
       rotate -poses[poseSelect+2][1]*z //SET POSE HERE     
       rotate poses[poseSelect+2][2]*y //SET POSE HERE     
  
       translate <poses[poseSelect+2][3],0,-poses[poseSelect+2][4]>
       finish{
               ambient 0
               diffuse 0
               //specular 1
               roughness 0
               reflection 1
       }
    }
    
    
    object{
    height_field{
        png  "data/Surface2.png"    
        water_level 0.001
        smooth       
  
    }              
           
       matrix <2,0,0,0,-1,0,0,0,2,-1,0,-1>      
       scale <2.5, 2.4016, 2.5>       
       
       rotate poses[poseSelect+3][0]*x //SET POSE HERE
       rotate -poses[poseSelect+3][1]*z //SET POSE HERE     
       rotate poses[poseSelect+3][2]*y //SET POSE HERE     

       translate <poses[poseSelect+3][3],2.5,-poses[poseSelect+3][4]>
      

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
        png  "data/Surface2.png" 
        water_level 0.001        
        smooth       
  
    }              
                                          
       matrix <2,0,0,0,1,0,0,0,2,-1,0,-1>        
       scale <2.5, 2.4016, 2.5>   

       rotate poses[poseSelect+3][0]*x //SET POSE HERE
       rotate -poses[poseSelect+3][1]*z //SET POSE HERE     
       rotate poses[poseSelect+3][2]*y //SET POSE HERE     

       translate <poses[poseSelect+3][3],2.5,-poses[poseSelect+3][4]>
       
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
//                        hdr "uffizi-large.hdr"
                         jpeg     "pebbles_9290205.jpg"
                       map_type 1
                       interpolate 2
                       }
//                rotate <clock*90, clock*180, -clock*360>
        rotate <rand(R1)*360, rand(R2)*180, rand(R3)*360>
        scale 1.0
        }

} 