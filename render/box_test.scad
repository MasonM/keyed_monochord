use </home/masonm/src/keyed_monochord/lasercut/lasercut.scad>;
$fn=60;
module flat(){
projection(cut = false)

lasercutout(thickness = 3, 
          points = [[0, 0], [34, 0], [34, 34], [0, 34], [0, 0]]
        , simple_tabs = [[180, -1.5, 0], [180, -1.5, 37], [270, 34, -1.5]]
        , finger_joints = [[0, 1, 4], [180, 1, 4], [90, 1, 4], [270, 0, 4]]
        , circles_remove = [[1, 4, 4]]
        ) 

lasercutout(thickness = 3, 
          points = [[0, 0], [34, 0], [34, 34], [0, 34], [0, 0]]
        , simple_tabs = [[180, -1.5, 0], [270, 34, -1.5]]
        , finger_joints = [[0, 0, 4], [180, 1, 4], [90, 1, 4], [270, 0, 4]]
        , circles_remove = [[1, 4, 4], [1, 4, 8]]
        ) 

lasercutout(thickness = 3, 
          points = [[0, 0], [34, 0], [34, 34], [0, 34], [0, 0]]
        , finger_joints = [[0, 1, 4], [180, 0, 4], [90, 1, 4], [270, 0, 4]]
        , circles_remove = [[1, 4, 4], [1, 8, 4], [1, 4, 8]]
        ) 

lasercutout(thickness = 3, 
          points = [[0, 0], [34, 0], [34, 34], [0, 34], [0, 0]]
        , simple_tabs = [[0, -1.5, 34], [180, 35.5, 0]]
        , finger_joints = [[0, 1, 4], [180, 1, 4], [90, 1, 4], [270, 0, 4]]
        , circles_remove = [[1, 4, 4], [1, 8, 4], [1, 4, 8], [1, 8, 8]]
        ) 

lasercutout(thickness = 3, 
          points = [[0, 0], [34, 0], [34, 34], [0, 34], [0, 0]]
        , finger_joints = [[0, 0, 4], [180, 1, 4], [90, 0, 4], [270, 1, 4]]
        , circles_remove = [[1, 4, 4], [1, 8, 4], [1, 4, 8], [1, 8, 8], [1, 6, 11]]
        ) 

lasercutout(thickness = 3, 
          points = [[0, 0], [34, 0], [34, 34], [0, 34], [0, 0]]
        , simple_tabs = [[0, 35.5, 34]]
        , finger_joints = [[0, 0, 4], [180, 1, 4], [90, 0, 4], [270, 1, 4]]
        , circles_remove = [[1, 3, 3], [1, 7, 3], [1, 11, 3], [1, 3, 7], [1, 7, 7], [1, 11, 7]]
        ) 

;
}

flat();
