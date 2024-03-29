"""
"""
# @ YD

from __future__ import print_function
from src.env    import VrepEnvironment
from src.agents import Pioneer
from src.disp   import Display
import settings
import time
# import argparse
import matplotlib.pyplot as plt
import math
import random

""" Motors:

          1. agent.change_velocity([ speed_left: float, speed_right: float ]) 
               Set the target angular velocities of left
               and right motors with a LIST of values:
               e.g. [1., 1.] in radians/s.
               
               Values in range [-5:5] (above these 
               values the control accuracy decreases)
                    
          2. agent.current_speed_API() 
          ----
               Returns a LIST of current angular velocities
               of the motors
               [speed_left: float, speed_right: float] in radians/s.

    Lidar:
          3. agent.read_lidars()   
          ----
               Returns a list of floating point numbers that 
               indicate the distance towards the closest object at a particular angle from the robot's lidar position.
               
               Basic configuration of the lidar:
               Lidar distance reading list: 270 lidar distance readings starting from 134 deg  to 1 deg 
               followed by a dummy-value and further readings from -1 deg to -135 deg. 
               That is: A total of 270 real values representing distance readings starting with the right-most lidar point/reading and going anti-clockwise
               Note: ignore center-element, number 135 (is index 134 as we start counting from 0), of the list, it has always value 1.0

    Agent:
          You can access these attributes to get information about the agent's positions

          4. agent.pos  

          ----
               Current x,y position of the agent (derived from 
               SLAM data) Note: unreliable as SLAM is not solved here.

          5. agent.position_history

               A deque containing N last positions of the agent 
               (200 by default, can be changed in settings.py) Note: unreliable as SLAM is not solved here.
"""

###########
###########


def loop(agent):
    """
    Robot control loop
    Your code goes here
    """
    # Example: 
    # agent.change_velocity([5, 4])
    lidar_data = agent.read_lidars()

    # Check if there are any obstacles in front of the robot
    min_distance = min(lidar_data[:5] + lidar_data[-5:])
    if min_distance < 0.3:  
        # If an obstacle is detected, rotate the robot randomly
        print("Obstacle detected near...")
        random_angle = random.uniform(-math.pi/4, math.pi/4)  # Random angle between -45 and 45 degrees
        agent.change_velocity([math.cos(random_angle), math.sin(random_angle)])  # Rotate the robot
        time.sleep(0.1)  # Rotate for 0.1 seconds
        # agent.change_velocity([0, 0])  # Stop the robot
        # time.sleep(0.1)  # Add a short delay before moving backward
        print("Moving straight backwards...")
        agent.change_velocity([-5, -5])  # Move backward
        time.sleep(0.2)  # Move backward for 0.5 seconds
        # print("Moving straight forward...")
        # agent.change_velocity([5, 5])  # Move backward
        # time.sleep(0.2)  # Move backward for 0.5 seconds
        # if min_distance < 0.1:
        #     print("Robot got stuck somewhere...")
        #     agent.change_velocity([-5, -5])  # Move forward
        #     time.sleep(0.5)  # Move forward for 0.5 seconds
        # elif agent.change_velocity == [0, 0]:
        #     print("velocity hasnt changed")
        #     agent.change_velocity([-5, -5])  # Move forward
        #     time.sleep(0.5)  # Move forward for 0.1 seconds        
       
        # while min_distance < 0.3:  # While an obstacle is still detected
        #     random_angle = random.uniform(-math.pi/6, math.pi/6)  # Random angle between -45 and 45 degrees
        #     agent.change_velocity([math.cos(random_angle), math.sin(random_angle)])  # Rotate the robot
        #     time.sleep(0.1)  # Rotate for 0.1 seconds
        #     agent.change_velocity([-5, -3])  # Move backward
        #     time.sleep(0.2)  # Move backward for 0.5 seconds
        #     max_distance = max(lidar_data[:10] + lidar_data[-10:])
        #     if max_distance > 5:
        #         agent.change_velocity([8, 8])  # Move forward
        #         time.sleep(0.1)  # Move forward for 0.1 seconds
        #     else:
        #         agent.change_velocity([2, 5])  # Move forward
        #         time.sleep(0.1)  # Move forward for 0.1 seconds
        return
        
    
    # If no obstacle is detected, move forward
    print("Moving forward...")
    agent.change_velocity([5, 4.1])  # Move forward
    time.sleep(0.3)
    # Define a threshold for the robot's speed
    SPEED_THRESHOLD = 0.1  # Adjust this threshold as needed

    current_speed = agent.current_speed_API()
    if abs(current_speed[0]) < SPEED_THRESHOLD and abs(current_speed[1]) < SPEED_THRESHOLD:
        # Robot speed is close to zero, indicating that it has stopped
        print("Faced an obstacle, Moving backward...")
        agent.change_velocity([-5, -2])  # Move backward
        time.sleep(0.2)  # Move backward for 0.5 seconds
    
    # max_dist = max(lidar_data[:10] + lidar_data[-10:])
    # if max_dist > 4:
    #     agent.change_velocity([8, 8])
    #     time.sleep(0.4)
    
    # elif max_dist < 0.3:
    #     agent.change_velocity([-5, -4])  # Move backward
    #     time.sleep(0.2)
#     if stuck_counter >= MAX_STUCK_TIME:
#         # If the robot remains stuck for too long, apply a sequence of random rotational movements
#         for _ in range(3):  # Perform 3 random rotations
#             random_angle = random.uniform(-math.pi/4, math.pi/4)  # Random angle between -45 and 45 degrees
#             agent.change_velocity([math.cos(random_angle), math.sin(random_angle)])  # Rotate the robot
#             time.sleep(0.5)  # Rotate for 0.5 seconds
#         stuck_counter = 0  # Reset the stuck counter
#     else:
#         stuck_counter += 1  # Increment the stuck counter

# # Constants
# MAX_STUCK_TIME = 5  # Maximum number of iterations the robot can remain stuck before applying random rotations
# stuck_counter = 0  # Counter to track how long the robot remains stuck
            
##########
##########

if __name__ == "__main__":
    plt.ion()
    # Initialize and start the environment
    environment = VrepEnvironment(settings.SCENES + '/room_static.ttt')  # Open the file containing our scene (robot and its environment)
    environment.connect()        # Connect python to the simulator's remote API
    agent   = Pioneer(environment)
    display = Display(agent, False) 
    
    print('\nDemonstration of Simultaneous Localization and Mapping using CoppeliaSim robot simulation software. \nPress "CTRL+C" to exit.\n')
    start = time.time()
    step  = 0
    done  = False
    environment.start_simulation()
    time.sleep(1)

    try:    
        while step < settings.simulation_steps and not done:
            display.update()                      # Update the SLAM display
            loop(agent)                           # Control loop
            step += 1
    except KeyboardInterrupt:
        print('\n\nInterrupted! Time: {}s'.format(time.time()-start))
        
    display.close()
    environment.stop_simulation()
    environment.disconnect()
