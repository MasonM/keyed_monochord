use </home/masonm/src/keyed_monochord/lasercut/lasercut.scad>;
$fn=60;
module flat(){
projection(cut = false)

lasercutout(thickness = 3.2, 
          points = [[0, 0], [33.6, 0], [33.6, 33.6], [0, 33.6], [0, 0]]
        , simple_tabs = [[180, -1.6, 0], [180, -1.6, 36.8], [270, 33.6, -1.6]]
        , finger_joints = [[0, 1, 4], [180, 1, 4], [90, 1, 4], [270, 0, 4]]
        , circles_remove = [[1, 4, 4]]
        ) 

lasercutout(thickness = 3.2, 
          points = [[0, 0], [33.6, 0], [33.6, 33.6], [0, 33.6], [0, 0]]
        , simple_tabs = [[180, -1.6, 0], [270, 33.6, -1.6]]
        , finger_joints = [[0, 0, 4], [180, 1, 4], [90, 1, 4], [270, 0, 4]]
        , circles_remove = [[1, 4, 4], [1, 4, 8]]
        ) 

lasercutout(thickness = 3.2, 
          points = [[0, 0], [33.6, 0], [33.6, 33.6], [0, 33.6], [0, 0]]
        , finger_joints = [[0, 1, 4], [180, 0, 4], [90, 1, 4], [270, 0, 4]]
        , circles_remove = [[1, 4, 4], [1, 8, 4], [1, 4, 8]]
        ) 

lasercutout(thickness = 3.2, 
          points = [[0, 0], [33.6, 0], [33.6, 33.6], [0, 33.6], [0, 0]]
        , simple_tabs = [[0, -1.6, 33.6], [180, 35.2, 0]]
        , finger_joints = [[0, 1, 4], [180, 1, 4], [90, 1, 4], [270, 0, 4]]
        , circles_remove = [[1, 4, 4], [1, 8, 4], [1, 4, 8], [1, 8, 8]]
        ) 

lasercutout(thickness = 3.2, 
          points = [[0, 0], [33.6, 0], [33.6, 33.6], [0, 33.6], [0, 0]]
        , finger_joints = [[0, 0, 4], [180, 1, 4], [90, 0, 4], [270, 1, 4]]
        , circles_remove = [[1, 4, 4], [1, 8, 4], [1, 4, 8], [1, 8, 8], [1, 6, 11]]
        ) 

lasercutout(thickness = 3.2, 
          points = [[0, 0], [33.6, 0], [33.6, 33.6], [0, 33.6], [0, 0]]
        , simple_tabs = [[0, 35.2, 33.6]]
        , finger_joints = [[0, 0, 4], [180, 1, 4], [90, 0, 4], [270, 1, 4]]
        , circles_remove = [[1, 3, 3], [1, 7, 3], [1, 11, 3], [1, 3, 7], [1, 7, 7], [1, 11, 7]]
        ) 

;
}

flat();
