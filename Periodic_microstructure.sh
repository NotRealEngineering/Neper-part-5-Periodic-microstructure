#Property of Not Real Engineering 
#Copyright 2021 Not Real Engineering - All Rights Reserved. You may not use, 
#           distribute and modify this code without the written permission 
#           from Not Real Engineering.

# FULLY PERIODIC MICROSTRUCTURE USING NEPER

cd /mnt/c
cd NRE_examples

# Step 1 Tessellation
export OMP_NUM_THREADS=8 
neper -T -n 50 -periodicity all -format tess,ori -o Periodic_polycrystal 
neper -V Periodic_polycrystal.tess -datacellcol id -datacelltrs 0.5 -cameraangle 14 -cameracoo x:-6.3:z -cameraprojection orthographic -imagesize 1200:1200 -print Periodic_polycrystal_image

# Step 2 Mesh
export OMP_NUM_THREADS=1
neper -M Periodic_polycrystal.tess -order 2 -meshqualexpr Odis -meshqualmin 1
neper -V Periodic_polycrystal.tess,Periodic_polycrystal.msh -dataelsetcol id -imagesize 1200:1200 -print Periodic_polycrystal_mesh_image
#---------------------------------------------------------------#

# PERIODIC MICROSTRUCTURE (Only in X direction) USING NEPER

# Step 1 Tessellation
export OMP_NUM_THREADS=8 
neper -T -n 500 -periodicity x -o Periodic_polycrystal_x
neper -V Periodic_polycrystal_x.tess -datacellcol id -cameraangle 14 -cameracoo x:-6.3:z -cameraprojection orthographic -datacelltrs 0.5 -imagesize 1200:1200 -print Periodic_polycrystal_x_image

# Step 2 Mesh
export OMP_NUM_THREADS=1
neper -M Periodic_polycrystal_x.tess -order 2 -meshqualexpr Odis -meshqualmin 1
neper -V Periodic_polycrystal_x.tess,Periodic_polycrystal_x.msh -dataelsetcol id -imagesize 1200:1200 -print Periodic_polycrystal_x_mesh_image
#---------------------------------------------------------------#

# PERIODIC MICROSTRUCTURE (In X and Y direction) USING NEPER

# Step 1 Tessellation
export OMP_NUM_THREADS=8 
neper -T -n 500 -periodicity x,y -o Periodic_polycrystal_x_y
neper -V Periodic_polycrystal_x_y.tess -datacellcol id -cameraangle 14 -cameracoo x:-6.3:z -cameraprojection orthographic -datacelltrs 0.5 -imagesize 1200:1200 -print Periodic_polycrystal_x_y_image

# Step 2 Mesh
export OMP_NUM_THREADS=1
neper -M Periodic_polycrystal_x_y.tess -order 2 -meshqualexpr Odis -meshqualmin 1
neper -V Periodic_polycrystal_x_y.tess,Periodic_polycrystal_x_y.msh -dataelsetcol id -imagesize 1200:1200 -print Periodic_polycrystal_x_y_mesh_image
#---------------------------------------------------------------#

