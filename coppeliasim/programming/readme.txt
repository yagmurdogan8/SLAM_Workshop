The various source code items can be found on https://github.com/CoppeliaRobotics
Clone each required repository with:

git clone --recursive https://github.com/CoppeliaRobotics/repositoryName

Use following directory structure:

coppeliaRobotics
    |__ coppeliaSimLib (CoppeliaSim main library)
    |__ programming
                  |__ include
                  |__ coppeliaGeometricRoutines
                  |__ coppeliaKinematicsRoutines
                  |__ simExtGeom
                  |__ simExtIK
                  |__ simExtDyn
                  |__ zmqRemoteApi
                  |__ wsRemoteApi
                  |__ simExtCodeEditor
                  |__ simExtJoystick
                  |__ simExtCam
                  |__ simExtURDF
                  |__ simExtSDF
                  |__ simExtRuckig
                  |__ simExtRRS1
                  |__ simExtMTB
                  |__ simExtUI
                  |__ simExtOMPL
                  |__ simExtICP
                  |__ simExtSurfRec
                  |__ simExtLuaCmd
                  |__ simExtPluginSkeleton
                  |__ simExtSkel
                  |__ simExtCHAI3D
                  |__ simExtConvexDecompose
                  |__ simExtPovRay
                  |__ simExtQHull
                  |__ simExtQML
                  |__ simExtVision
                  |__ simExtIM
                  |__ simExtIGL
                  |__ simExtBubbleRob
                  |__ simExtAssimp
                  |__ simExtOpenMesh
                  |__ simExtOpenGL3Renderer
                  |__ simExtGLTF
                  |__ simExtZMQ
                  |__ simExtURLDrop
                  |__ simExtSubprocess
                  |__ simExtEigen
                  |__ simExtLDraw
                  |__ bubbleRobServer
                  |__ bubbleRobZmqServer
                  |__ configUi-2
                  |__ rcsServer
                  |__ mtbServer
                  |
                  |__ ros_packages
                  |            |__ simExtROS
                  |            |__ ros_bubble_rob
                  |
                  |__ ros2_packages
                               |__ simExtROS2
                               |__ ros2_bubble_rob
                               

           
Following are the main Items:
-----------------------------

-   'coppeliaSimLib' (requires 'include'):         
    https://github.com/CoppeliaRobotics/coppeliaSimLib

-   'coppeliaSimClientApplication' (requires 'include'):
    https://github.com/CoppeliaRobotics/coppeliaSimClientApplication


Various common items:
---------------------

-   'include'
    https://github.com/CoppeliaRobotics/include

-   'zmqRemoteApi' (requires 'include'): 
    https://github.com/CoppeliaRobotics/zmqRemoteApi

-   'wsRemoteApi' (requires 'include'):
    https://github.com/CoppeliaRobotics/wsRemoteApi

-   'coppeliaGeometricRoutines' (requires 'include'):
    https://github.com/CoppeliaRobotics/coppeliaGeometricRoutines

-   'coppeliaKinematicsRoutines' (requires 'include'):
    https://github.com/CoppeliaRobotics/coppeliaKinematicsRoutines
    
Major plugins:
--------------

-   'simExtDyn' (requires 'include' + various physics engine dependencies):
    https://github.com/CoppeliaRobotics/simExtDyn

-   'simExtGeom' (requires 'include' and 'coppeliaGeometricRoutines'):
    https://github.com/CoppeliaRobotics/simExtGeom

-   'simExtIK' (requires 'include' and 'coppeliaKinematicsRoutines'):
    https://github.com/CoppeliaRobotics/simExtIK

-   'simExtCodeEditor' (requires 'include' and 'QScintilla'):
    https://github.com/CoppeliaRobotics/simExtCodeEditor


Various plugins:
----------------

-   'simExtJoystick' (requires 'include'):
    https://github.com/CoppeliaRobotics/simExtJoystick (Windows only)

-   'simExtCam' (requires 'include'):
    https://github.com/CoppeliaRobotics/simExtCam (Windows only)

-   'simExtURDF' (requires 'include'):
    https://github.com/CoppeliaRobotics/simExtURDF

-   'simExtSDF' (requires 'include'):
    https://github.com/CoppeliaRobotics/simExtSDF

-   'simExtRuckig' (requires 'include'):
    https://github.com/CoppeliaRobotics/simExtRuckig

-   'simExtRRS1' (requires 'include'):
    https://github.com/CoppeliaRobotics/simExtRRS1

-   'simExtMTB' (requires 'include'):
    https://github.com/CoppeliaRobotics/simExtMTB

-   'simExtUI' (requires 'include'):
    https://github.com/CoppeliaRobotics/simExtUI

-   'simExtOMPL' (requires 'include'):
    https://github.com/CoppeliaRobotics/simExtOMPL

-   'simExtICP' (requires 'include'):
    https://github.com/CoppeliaRobotics/simExtICP

-   'simExtIGL' (requires 'include'):
    https://github.com/CoppeliaRobotics/simExtIGL

-   'simExtSurfRec' (requires 'include'):
    https://github.com/CoppeliaRobotics/simExtSurfRec

-   'simExtQML' (requires 'include'):
    https://github.com/CoppeliaRobotics/simExtQML

-   'simExtROS' (requires 'include'):
    https://github.com/CoppeliaRobotics/simExtROS

-   'simExtROS2' (requires 'include'):
    https://github.com/CoppeliaRobotics/simExtROS2

-   'simExtLuaCmd' (requires 'include'):
    https://github.com/CoppeliaRobotics/simExtLuaCmd

-   'simExtCHAI3D' (requires 'include'):
    https://github.com/CoppeliaRobotics/simExtCHAI3D

-   'simExtConvexDecompose' (requires 'include'):
    https://github.com/CoppeliaRobotics/simExtConvexDecompose

-   'simExtPovRay' (requires 'include'):
    https://github.com/CoppeliaRobotics/simExtPovRay

-   'simExtQHull' (requires 'include'):
    https://github.com/CoppeliaRobotics/simExtQHull

-   'simExtOpenMesh' (requires 'include'):
    https://github.com/CoppeliaRobotics/simExtOpenMesh

-   'simExtVision' (requires 'include'):
    https://github.com/CoppeliaRobotics/simExtVision

-   'simExtIM' (requires 'include'):
    https://github.com/CoppeliaRobotics/simExtIM

-   'simExtBubbleRob' (requires 'include'):
    https://github.com/CoppeliaRobotics/simExtBubbleRob

-   'simExtOpenGL3Renderer' (requires 'include'):
    https://github.com/stepjam/simExtOpenGL3Renderer or https://github.com/CoppeliaRobotics/simExtOpenGL3Renderer

-   'simExtGLTF' (requires 'include'):
    https://github.com/CoppeliaRobotics/simExtGLTF

-   'simExtZMQ' (requires 'include'):
    https://github.com/CoppeliaRobotics/simExtZMQ

-   'simExtURLDrop' (requires 'include'):
    https://github.com/CoppeliaRobotics/simExtURLDrop

-   'simExtSubprocess' (requires 'include' and Qt):
    https://github.com/CoppeliaRobotics/simExtSubprocess

-   'simExtEigen' (requires 'include' and Eigen):
    https://github.com/CoppeliaRobotics/simExtEigen

Various other repositories:		
---------------------------

-   'bubbleRobServer' (requires 'include'):
    https://github.com/CoppeliaRobotics/bubbleRobServer
    
-   'bubbleRobZmqServer' (requires 'include'):
    https://github.com/CoppeliaRobotics/bubbleRobZmqServer
    
-   'rcsServer' (requires 'include'):
    https://github.com/CoppeliaRobotics/rcsServer

-   'mtbServer' (requires 'include'):
    https://github.com/CoppeliaRobotics/mtbServer

-   'ros_bubble_rob' (requires 'include'):
    https://github.com/CoppeliaRobotics/ros_bubble_rob

-   'ros2_bubble_rob' (requires 'include'):
    https://github.com/CoppeliaRobotics/ros2_bubble_rob

-   'PyRep':
    https://github.com/stepjam/PyRep
