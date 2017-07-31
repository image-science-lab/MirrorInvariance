The base folder has a script "SequenceRender.ini" and a pov file "Surface.pov". Running the pov file inside PoVRay should produce a single image. To produce a sequence of images with the same pose for the mirror, run SequenceRender.ini from PovRay. To change the pose as well, uncomment the appropriate line inside Surface.pov and increase Final_Frame to X*30 (where X is the number of image per pose). Sample images are in ../images folder.


1) "DATA" folder has 16-bit depth maps as png files. These are used in the .pov files to generate surfaces. They are also scaled inside appropriately.

2) "POV" folder has many .pov files. Copy them to the base folder to use. 

