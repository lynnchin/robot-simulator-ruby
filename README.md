Robot Simulator
 
Descrip8on:
. The applica8on is a simula8on of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.
. There are no other obstruc8ons on the table surface.
. The robot is free to roam around the surface of the table, but must be prevented from falling to destruc8on. Any movement
that would result in the robot falling from the table must be prevented, however further valid movement commands must s8ll
be allowed.
 
. Create an applica8on that can read in commands of the following form - PLACE X,Y,F
MOVE
LEFT
RIGHT
REPORT
 
. PLACE will put the toy robot on the table in posi8on X,Y and facing NORTH, SOUTH, EAST or WEST.
. The origin (0,0) can be considered to be the SOUTH WEST most corner.
. The first valid command to the robot is a PLACE command, aXer that, any sequence of commands may be issued, in any order, including another PLACE command. The applica8on should discard all commands in the sequence un8l a valid PLACE command has been executed.
. MOVE will move the toy robot one unit forward in the direc8on it is currently facing.
. LEFT and RIGHT will rotate the robot 90 degrees in the specified direc8on without changing the posi8on of the robot.
. REPORT will announce the X,Y and F of the robot. This can be in any form, but standard output is sufficient.
 
. A robot that is not on the table can choose the ignore the MOVE, LEFT, RIGHT
 
and REPORT commands.
. Input can be from a file, or from standard input, as the developer chooses. . Provide test data to exercise the applica8on.
 
Constraints:
The toy robot must not fall off the table during movement. This also includes the ini8al placement of the toy robot.
Any move that would cause the robot to fall must be ignored.
 
Example Input and Output:
a)
PLACE 0,0,NORTH
MOVE
REPORT
Output: 0,1,NORTH
 
b)
PLACE 0,0,NORTH
LEFT
REPORT
Output: 0,0,WEST
 
c)
PLACE 1,2,EAST
MOVE
MOVE
LEFT
MOVE
REPORT
Output: 3,3,NORTH
 
Deliverables:
The source files, the test data and any test code.
It is not required to provide any graphical output showing the movement of the toy robot.
-------
