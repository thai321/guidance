demo = User.find_by(username: 'guest')

# user_ids = []
# User.all.map do |u|
#   user_ids.push(u.id) if demo.id != u.id
# end
#
# demo.follower_ids = user_ids
# demo.save


p12 = Project.create(
  title: "Obstacle Avoiding Robot 4WD",
description:
 "<p><span class=\"ql-size-large\" style=\"background-color: rgb(255, 255, 102);\">Arduino</span><span class=\"ql-size-large\"> Tutorial </span><u class=\"ql-size-large\">Obstacle Avoiding Robot 4WD</u><span class=\"ql-size-large\"> -</span><em class=\"ql-size-large\"> For beginners</em></p><p><span class=\"ql-size-large\">In this tutorial, you will make obstacle avoiding robot.</span></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">This tutorial involves building a 4WD robot with an ultrasonic sensor that can detect nearby objects and change its direction to avoid these objects. The ultrasonic sensor will be attached to a servo motor which is constantly scanning left and right looking for objects in its way.</span></p>",
video_url: "https://www.youtube.com/embed/C3GhJmmRY4Y",
published: true,
author_id: demo.id
)

p12.tag_ids = [1]
p12.save


Step.create(
  title: "Hardware Required",
body:
 "<ul><li><span class=\"ql-size-large\">Arduino Board</span></li><li><span class=\"ql-size-large\">Motor Shield (Adafruit)</span></li><li><span class=\"ql-size-large\">Ultrasonic Sensor (HC-SR04)</span></li><li><span class=\"ql-size-large\">Mini Servo Motor (SG90)</span></li><li><span class=\"ql-size-large\">DC Motor x4</span></li><li><span class=\"ql-size-large\">Wheel x4</span></li><li><span class=\"ql-size-large\">Chassis plate</span></li><li><span class=\"ql-size-large\">Holder for HC-SR04</span></li><li><span class=\"ql-size-large\">Battery 9V x2</span></li><li><span class=\"ql-size-large\">Battery Buckle x2</span></li><li><span class=\"ql-size-large\">Wires</span></li><li><span class=\"ql-size-large\">Button</span></li><li><span class=\"ql-size-large\">Glue Gun</span></li></ul><p><br></p>",
project_id: p12.id
)


Step.create(
  title: "Create of the Chassis",
  body:
   "<ol><li><span class=\"ql-size-large\">The DC motors attach to the chassis</span></li><li><span class=\"ql-size-large\">The Arduino attach to the chassis</span></li><li><span class=\"ql-size-large\">The Motor Shield attach to the Arduino.</span></li><li><span class=\"ql-size-large\">The Servo motor attach to the chassis</span></li><li><span class=\"ql-size-large\">The HC-SR04 holder attach to Servo</span></li><li><span class=\"ql-size-large\">The HC-SR04 sensor attach to Servo</span></li></ol><p><br></p>",
  project_id: p12.id
)

Step.create(
  title: "About the Motor Shield",
  body:
   "<ul><li><span class=\"ql-size-large\">The motor controllers on this shield are designed to run from 4.5V to 25V.</span></li><li><span class=\"ql-size-large\">There are two places you can get your motor 'high voltage supply' from. One is the DC jack on the Arduino board and the other is the 2-terminal block on the shield that is labeled EXT_PWR.</span></li><li><span class=\"ql-size-large\">To connect a motor, simply solder two wires to the terminals and then connect them to either the M1, M2, M3, or M4.</span></li><li><span class=\"ql-size-large\">Hobby servos are the easiest way to get going with motor control. They have a 3-pin 0.1\" female header connection with +5V, ground and signal inputs. The motor shield simply brings out the 16bit PWM output lines to two 3-pin headers so that its easy to plug in and go.</span></li><li><span class=\"ql-size-large\">Power for the Servos comes from the Arduino's on-board 5V regulator, powered directly from the USB or DC power jack on the Arduino.</span></li></ul><p><strong class=\"ql-size-large\"><em>Reference</em></strong></p><p><a href=\"https://learn.adafruit.com/adafruit-motor-shield/overview\" target=\"_blank\" style=\"color: rgb(232, 108, 0);\" class=\"ql-size-large\">https://learn.adafruit.com/adafruit-motor-shield/overview</a></p>",
  project_id: p12.id
)



Step.create(
  title: "Connections",
 body:
  "<p><span class=\"ql-size-large\">1. DC Motors connect to the Motor Shield</span></p><p><span class=\"ql-size-large\">2. Left Motors connect to M1 and M2 (If the motors run backwards, change the (+) and (-) connections)</span></p><p><span class=\"ql-size-large\">3. Right Motors connect to M4 and M3</span></p><p><span class=\"ql-size-large\">4. The Servo motor connect to the Motor Shield</span></p><ul><li><span class=\"ql-size-large\">The Servo1 input is connected to the Arduino Digital10 input</span></li><li><span class=\"ql-size-large\">The Servo2 input is connected to the Arduino Digital9 input</span></li><li><span class=\"ql-size-large\">Power for the Servos comes from the Arduino's on-board 5V regulator, powered directly from the USB or DC power jack on the Arduino</span></li></ul><p><span class=\"ql-size-large\">5. The HC-SR04 Sensor connections</span></p><ul><li><span class=\"ql-size-large\">The HC-SR04 Sensor VCC connect to the Arduino +5V</span></li><li><span class=\"ql-size-large\">The HC-SR04 Sensor GND connect to the Arduino Ground</span></li><li><span class=\"ql-size-large\">The HC-SR04 Sensor Trig connect to the Arduino Analog 0</span></li><li><span class=\"ql-size-large\">The HC-SR04 Sensor Echo connect to the Arduino Analog 1</span></li></ul><p><span class=\"ql-size-large\">6. Battery and on / off button connection</span></p><ul><li><span class=\"ql-size-large\">The (+) from the battery is connect to a leg of the button</span></li><li><span class=\"ql-size-large\">Connect a cable to the other legs of the button. This cable is for Motor Shield (+)</span></li></ul><p><span class=\"ql-size-large\">7. 2 seperate DC power supplies for the Arduino and motors</span></p><ul><li><span class=\"ql-size-large\">If you would like to have 2 seperate DC power supplies for the Arduino and motors. Plug in the supply for the Arduino into the DC jack, and connect the motor supply to the PWR_EXT block. Make sure the jumper is removed from the motor shield.</span></li></ul><p><span class=\"ql-size-large\">8. Attach the wheels</span></p>",
 project_id: p12.id
)


Step.create(
  title: "Copy the Code and Install the Arduino Library",
 body:
  "<p><span class=\"ql-size-large\">1. Open the new Arduino IDE page</span></p><p><span class=\"ql-size-large\">2. Delete everything on the page</span></p><p><span class=\"ql-size-large\">3.&nbsp;</span><a href=\"https://youtu.be/C3GhJmmRY4Y\" target=\"_blank\" style=\"color: rgb(232, 108, 0);\" class=\"ql-size-large\">Get the code in video description</a></p><p><span class=\"ql-size-large\">4. Paste empty Arduino IDE page</span></p><p><span class=\"ql-size-large\">5. First Install the Arduino Library</span></p><p><span class=\"ql-size-large\">6. The AF_Motor Arduino library</span></p><ul><li><span class=\"ql-size-large\">Before you can use the Motor shield, you must install the AF_Motor Arduino library.</span></li><li><span class=\"ql-size-large\">Close the Arduino IDE</span></li><li><span class=\"ql-size-large\">Download the library&nbsp;</span><a href=\"https://learn.adafruit.com/adafruit-motor-shield/overviewhttps://github.com/adafruit/Adafruit-Motor-Shield-library\" target=\"_blank\" style=\"color: rgb(232, 108, 0);\" class=\"ql-size-large\">https://github.com/adafruit/Adafruit-Motor-Shield-library</a></li><li><span class=\"ql-size-large\">Uncompress the ZIP file onto your desktop</span></li><li><span class=\"ql-size-large\">Check that inside AFMotor is AFMotor.cpp and AFMotor.h files</span></li><li><span class=\"ql-size-large\">Place the AFMotor folder into your arduinosketchfolder/libraries folder. For Windows, this will probably be something like MY Documents/Arduino/libraries for Mac it will be something likeDocuments/arduino/libraries. If this is the first time you are installing a library, you'll need to create the libraries folder. Make sure to call it libraries exactly, no caps, no other name.</span></li><li><span class=\"ql-size-large\">Rename the uncompressed folder AFMotor</span></li></ul><p><span class=\"ql-size-large\">7. The NewPing Arduino Library</span></p><ul><li><span class=\"ql-size-large\">Download the library&nbsp;</span><a href=\"https://bitbucket.org/teckel12/arduino-new-ping/downloads\" target=\"_blank\" style=\"color: rgb(232, 108, 0);\" class=\"ql-size-large\">https://bitbucket.org/teckel12/arduino-new-ping/downloads</a></li><li><span class=\"ql-size-large\">Uncompress the ZIP file onto your desktop</span></li><li><span class=\"ql-size-large\">Move to the Arduino library folder</span></li></ul><p><span class=\"ql-size-large\">8. Restart the IDE</span></p><p><span class=\"ql-size-large\">9. Now you can see the libraries you have installed</span></p><p><span class=\"ql-size-large\">10. When you verify, you will not see any errors</span></p>",
 project_id: p12.id
)



Step.create(
  title: "About the Code",
 body:
  "<p><span class=\"ql-size-large\">1. Using DC Motors with the Motor Shield</span></p><ul><li><span class=\"ql-size-large\">The motor shield can drive up to 4 DC motors bi-directionally. That means they can be driven forwards and backwards.</span></li><li><span class=\"ql-size-large\">To connect a motor, simply solder two wires to the terminals and then connect them to either the M1, M2, M3, or M4.</span></li><li><span class=\"ql-size-large\">Make sure you #include AFMotor.h</span></li><li><span class=\"ql-size-large\">Create the AF_DCMotor object with AF_DCMotor(motor#, frequency), to setup the motor H-bridge and latches. The constructor takes two arguments.</span></li><li><span class=\"ql-size-large\">The first is which port the motor is connected to, 1, 2, 3 or 4. frequency is how fast the speed controlling signal is.</span></li><li><span class=\"ql-size-large\">For motors 1 and 2 you can choose MOTOR12_64KHZ, MOTOR12_8KHZ, MOTOR12_2KHZ, orMOTOR12_1KHZ. A high speed like 64KHz wont be audible but a low speed like 1KHz will use less power. Motors 3 &amp; 4 are only possible to run at 1KHz and will ignore any setting given.</span></li><li><span class=\"ql-size-large\">Then you can set the speed of the motor using setSpeed(speed) where the speed ranges from 0 (stopped) to 255 (full speed). You can set the speed whenever you want.</span></li><li><span class=\"ql-size-large\">To run the motor, call run(direction) where direction is FORWARD, BACKWARD or RELEASE. Of course, the Arduino doesn't actually know if the motor is 'forward' or 'backward', so if you want to change which way it thinks is forward, simply swap the two wires from the motor to the shield.</span></li></ul><p><span class=\"ql-size-large\">2. Using the HC-SR04 with the NewPing Library</span></p><ul><li><span class=\"ql-size-large\">NewPing sonar(trigger_pin, echo_pin [, max_cm_distance]);</span></li></ul><p><span class=\"ql-size-large\">Example;</span></p><ul><li><span class=\"ql-size-large\">NewPing sonar(12, 11, 200);</span></li></ul><p><span class=\"ql-size-large\">This initializes NewPing to use pin 12 for trigger output, pin 11 for echo input, with a maximum ping distance of 200cm. max_cm_distance is optional [default = 500cm]. If connecting using a single pin, specify the same pin for both trigger_pin and echo_pin as the same pin is doing both functions.</span></p><p><strong class=\"ql-size-large\"><em>Reference</em></strong></p><p><a href=\"https://learn.adafruit.com/adafruit-motor-shield/overview\" target=\"_blank\" style=\"color: rgb(232, 108, 0);\" class=\"ql-size-large\">https://learn.adafruit.com/adafruit-motor-shield/overview</a></p><p><a href=\"http://playground.arduino.cc/Code/NewPing\" target=\"_blank\" style=\"color: rgb(232, 108, 0);\" class=\"ql-size-large\">http://playground.arduino.cc/Code/NewPing</a></p>",
 project_id: p12.id,
)



Step.create(
  title: "If It Helps, Please Subscribe",
 body:
  "<p><span class=\"ql-size-large\">First of all, I would like to thank you for reading this guide ! I hope it helps you.</span></p><p><span class=\"ql-size-large\">If you want to support me, you can subscribe my channel and watch my videos.</span></p><p><a href=\"https://www.youtube.com/channel/UCAH7OfjndkAgtjkmJ6IQvEw\" target=\"_blank\" style=\"color: rgb(232, 108, 0);\" class=\"ql-size-large\"><strong>Visit My Youtube Channel - Mert Arduino Tutorial &amp; Projects</strong></a></p><p><br></p><p><br></p><iframe class=\"ql-video\" frameborder=\"0\" allowfullscreen=\"true\" src=\"https://www.youtube.com/embed/0_SLHFiR7R8?showinfo=0\"></iframe><p><strong style=\"color: rgb(232, 108, 0);\" class=\"ql-size-large\"><U+FEFF></strong></p>",
 project_id: p12.id
)






# Project 13


p13 = Project.create(
  title: "Dijkstra's Algorithm, in Simple Steps",
 description:
  "<p><strong class=\"ql-size-large\">Dijkstra’s Algorithm</strong><span class=\"ql-size-large\">, published by Edsger Dijkstra in 1959, is a powerful method for finding shortest paths between vertices in a graph. This Instructable contains the steps of this algorithm, to assist you with following the algorithm on paper or implementing it in a program.</span></p><p><span class=\"ql-size-large\">Note that the steps provided only record the shortest path lengths, and do not save the actual shortest paths along vertices. If knowledge of the composition of the paths is desired, steps 2 and 4 can be easily modified to save this data in another associative array: see Dijkstra’s 1959 paper in&nbsp;</span><em class=\"ql-size-large\">Numerische Mathematik</em><span class=\"ql-size-large\">for more information.</span></p><p><span class=\"ql-size-large\">Alright, let's get started! In these instructions, we assume we have the following information:</span></p><ul><li><span class=\"ql-size-large\">A graph&nbsp;</span><em class=\"ql-size-large\">G</em></li><li><span class=\"ql-size-large\">A set of vertices&nbsp;</span><em class=\"ql-size-large\">V</em></li><li><span class=\"ql-size-large\">A set of edges&nbsp;</span><em class=\"ql-size-large\">E</em><span class=\"ql-size-large\">&nbsp;(where each edge has a nonnegative weight)</span></li><li><span class=\"ql-size-large\">A starting point&nbsp;</span><em class=\"ql-size-large\">s&nbsp;∈ V</em></li></ul><p><span class=\"ql-size-large\">Note that the \"element of\" symbol, ∈, indicates that the element on the left-hand side of the symbol is contained within the collection on the other side of the symbol. For example,&nbsp;</span><em class=\"ql-size-large\">s&nbsp;∈ V</em><span class=\"ql-size-large\">&nbsp;indicates that&nbsp;</span><em class=\"ql-size-large\">s</em><span class=\"ql-size-large\">&nbsp;is an element of&nbsp;</span><em class=\"ql-size-large\">V</em><span class=\"ql-size-large\">&nbsp;-- in this case, this means that&nbsp;</span><em class=\"ql-size-large\">s</em><span class=\"ql-size-large\">&nbsp;is a vertex contained within the graph.</span></p><p><span class=\"ql-size-large\">These directions are designed for use by an audience familiar with the basics of graph theory, set theory, and data structures. With this prerequisite knowledge, all notation and concepts used should be relatively simple for the audience.</span></p><p><span class=\"ql-size-large\">For more information on the details of Dijkstra's Algorithm, the&nbsp;</span><a href=\"https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm\" target=\"_blank\" style=\"color: rgb(232, 108, 0);\" class=\"ql-size-large\">Wikipedia page</a><span class=\"ql-size-large\">on it is an excellent resource.</span></p>",
 video_url: "",
 published: true,
 author_id: demo.id
)

p13.tag_ids = [3]
p13.save


Step.create(
  title: "Getting Started: Initializing Relevant Data Structures",
 body:
  "<p><strong class=\"ql-size-large\">Construct</strong><span class=\"ql-size-large\">&nbsp;a (now-empty) mutable associative array&nbsp;</span><em class=\"ql-size-large\">D</em><span class=\"ql-size-large\">, representing the total distances from&nbsp;</span><em class=\"ql-size-large\">s</em><span class=\"ql-size-large\">&nbsp;to every vertex in&nbsp;</span><em class=\"ql-size-large\">V</em><span class=\"ql-size-large\">. This means that&nbsp;</span><em class=\"ql-size-large\">D[v]</em><span class=\"ql-size-large\">&nbsp;should (at the conclusion of this algorithm) represent the distance from&nbsp;</span><em class=\"ql-size-large\">s</em><span class=\"ql-size-large\">&nbsp;to any&nbsp;</span><em class=\"ql-size-large\">v</em><span class=\"ql-size-large\">, so long as&nbsp;</span><em class=\"ql-size-large\">v∈ V</em><span class=\"ql-size-large\">&nbsp;and at least one path exists from&nbsp;</span><em class=\"ql-size-large\">s</em><span class=\"ql-size-large\">&nbsp;to&nbsp;</span><em class=\"ql-size-large\">v</em><span class=\"ql-size-large\">.</span></p><p><br></p><p><strong class=\"ql-size-large\">Construct</strong><span class=\"ql-size-large\">&nbsp;a (now-empty) set&nbsp;</span><em class=\"ql-size-large\">U</em><span class=\"ql-size-large\">, representing all unvisited vertices within&nbsp;</span><em class=\"ql-size-large\">G</em><span class=\"ql-size-large\">. We will populate U in the next step, and then iteratively remove vertices from it as we traverse the graph.</span></p><p><br></p>",
 project_id: p13.id
)


Step.create(
  title: "Initializing the Distance Associative Array",
body:
 "<p><span class=\"ql-size-large\">For every&nbsp;</span><em class=\"ql-size-large\">v ∈&nbsp;V</em><span class=\"ql-size-large\">:</span></p><ol><li><strong class=\"ql-size-large\">Set </strong><em class=\"ql-size-large\">D[v]</em><span class=\"ql-size-large\">&nbsp;to infinity. An infinite distance in D for a given vertex indicates that no path has (yet) been found from the starting vertex (</span><em class=\"ql-size-large\">s</em><span class=\"ql-size-large\">) to&nbsp;</span><em class=\"ql-size-large\">v</em><span class=\"ql-size-large\">.</span></li><li><strong class=\"ql-size-large\">Add </strong><em class=\"ql-size-large\">v</em><span class=\"ql-size-large\">&nbsp;to&nbsp;</span><em class=\"ql-size-large\">U</em><span class=\"ql-size-large\">, indicating that&nbsp;</span><em class=\"ql-size-large\">v</em><span class=\"ql-size-large\">&nbsp;is unvisited.</span></li></ol><p><strong class=\"ql-size-large\">Set </strong><em class=\"ql-size-large\">D[s]</em><span class=\"ql-size-large\">&nbsp;to 0. This renders&nbsp;</span><em class=\"ql-size-large\">s</em><span class=\"ql-size-large\">&nbsp;the vertex in the graph with the smallest&nbsp;</span><em class=\"ql-size-large\">D</em><span class=\"ql-size-large\">-value.</span></p><p><span class=\"ql-size-large\">Note that in the below instructions, we repeat directions as we iterate through the graph.</span></p>",
project_id: p13.id
)


Step.create(
  title: "Looping Through the Graph",
 body:
  "<p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">If&nbsp;</span><em style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">U</em><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">&nbsp;is not empty (that is, there are still unvisited nodes left),&nbsp;</span><strong style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">select</strong><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">&nbsp;the vertex&nbsp;</span><em style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">w&nbsp;∈ W</em><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">&nbsp;with the smallest&nbsp;</span><em style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">D</em><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">-value and&nbsp;</span><strong style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">continue</strong><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">&nbsp;to step 4. Otherwise,&nbsp;</span><strong style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">go to&nbsp;</strong><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">step 5.</span></p>",
 project_id: p13.id
)


Step.create(
  title: "Processing an Unvisited Vertex",
  body:
   "<p><strong class=\"ql-size-large\">Remove </strong><em class=\"ql-size-large\">w</em><span class=\"ql-size-large\">&nbsp;from&nbsp;</span><em class=\"ql-size-large\">U</em><span class=\"ql-size-large\">.</span></p><p><span class=\"ql-size-large\">Iteratively, for every adjacent vertex (neighbor)&nbsp;</span><em class=\"ql-size-large\">n</em><span class=\"ql-size-large\">&nbsp;of&nbsp;</span><em class=\"ql-size-large\">w</em><span class=\"ql-size-large\">&nbsp;such that&nbsp;</span><em class=\"ql-size-large\">n&nbsp;∈ U</em><span class=\"ql-size-large\">, do the following:</span></p><ol><li><strong class=\"ql-size-large\">Let&nbsp;</strong><em class=\"ql-size-large\">a</em><span class=\"ql-size-large\">&nbsp;be equal to&nbsp;</span><em class=\"ql-size-large\">D[n] + weight(w, n)</em><span class=\"ql-size-large\">, where&nbsp;</span><em class=\"ql-size-large\">weight(a, b)</em><span class=\"ql-size-large\">&nbsp;is the weight of the edge between two adjacent vertices&nbsp;</span><em class=\"ql-size-large\">a&nbsp;</em><span class=\"ql-size-large\">and&nbsp;</span><em class=\"ql-size-large\">b</em><span class=\"ql-size-large\">.</span></li><li><span class=\"ql-size-large\">If&nbsp;</span><em class=\"ql-size-large\">a &lt; D[n]</em><span class=\"ql-size-large\">, then we have identified a shorter-than-previously-thought path to&nbsp;</span><em class=\"ql-size-large\">n</em><span class=\"ql-size-large\">. To&nbsp;</span><strong class=\"ql-size-large\">store</strong><span class=\"ql-size-large\">&nbsp;this information,&nbsp;</span><strong class=\"ql-size-large\">set </strong><em class=\"ql-size-large\">D[n]</em><span class=\"ql-size-large\">&nbsp;to&nbsp;</span><em class=\"ql-size-large\">a</em><span class=\"ql-size-large\">.</span></li></ol><p><strong class=\"ql-size-large\">Go back</strong><span class=\"ql-size-large\">&nbsp;to step 3.</span></p>",
  project_id: p13.id
)


Step.create(
  title: "Finishing Up",
 body:
  "<p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">The algorithm is finished. At this point,&nbsp;</span><em style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">D</em><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">&nbsp;is “complete”: for any&nbsp;</span><em style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">v ∈ V</em><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">, we have the exact shortest path length from&nbsp;</span><em style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">s</em><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">&nbsp;to&nbsp;</span><em style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">v</em><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">&nbsp;available at&nbsp;</span><em style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">D[v]</em><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">. If no paths exist at all from&nbsp;</span><em style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">s</em><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">&nbsp;to&nbsp;</span><em style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">v</em><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">, then we can tell easily, as&nbsp;</span><em style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">D[v]</em><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">&nbsp;will be equal to infinity.</span></p>",
 project_id: p13.id
)



#  Project 14


p14 = Project.create(
  title: "Spreadsheet Calculus: Euler's Method",
description:
 "<p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">If you've tried solving any differential equations, you probably know that many of them are either very difficult or impossible to solve. What do we do then? Usually the solution to a differential equation actually isn't that important. The question you usually want answered is what happens when I start at certain coordinates? What does the differential equation do?</span></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">If you have a spreadsheet program, then answering these questions is pretty easy. You don't need to solve the equation to find out what it does.</span></p>",
video_url: "",
published: true,
author_id: demo.id
)

p14.tag_ids = [2]
p14.save


Step.create(
  title: "Find a Differential Equation",
  body:
   "<p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">First you need a differential equation that you want (or need) to solve. For my first example I'm going to use a simple equation that's easy to solve. dy/dx=ry. The solution is y=Aerx, where A is an arbitrary constant.</span></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">Type in a dx value and make a graph of the solution, it should look something like the second picture. For most differential equations, you wont know the solution, the only reason we're putting it in first here is to confirm that this method works.</span></p>",
  project_id: p14.id
)


Step.create(
  title: "Use Euler's Method",
  body:
   "<p><span class=\"ql-size-large\">Here's how Euler's method works. Basically, you start somewhere on your plot. You know what dy/dx or the slope is there (that's what the differential equation tells you.) So you make a small line with the slope given by the equation. Then at the end of that tiny line we repeat the process. Soon enough we've sketched a solution curve to the differential equation. As long as we choose small enough step sizes, the solution curve found this way follows the true solution curve almost perfectly.</span></p><p><span class=\"ql-size-large\">Here's how you do it: first set an initial state. In this case I'm going to choose 2, since it's the initial value of the solution curve I sketched earlier. Then, below your initial value you want to type in your differential equation (as a function of the initial value) be sure to multiply it by your dx value. Your differential equation has the form dy/dx. If you multiply it by the step size (dx) then you're left with dy, the change in y, which is added to the previous y value. The picture below explains this a lot better than I ever could.</span></p><p><br></p>",
  project_id: p14.id
)


Step.create(
  title: "Graph It",
  body:
   "<p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">Plot it and check that it works. Notice in the picture below that the solution using Euler's method follows the solution found by solving the equation almost perfectly.</span></p>",
  project_id: p14.id
)



Step.create(
  title: "Do a Tough One",
body:
 "<p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">Now let's try it with a differential equation that can't be solved using traditional methods. The differential equation shown below is completely made up and doesn't model anything as far as I know. I don't know how to solve it, but I can still visualize solutions to it by using Euler's method. The second picture are solution sketches with different starting conditions. The excel file is also attached if you need help.</span></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">Using this method, sketching solutions to differential equations becomes quite easy. Just make sure you use small enough step sizes to reduce the error rate. If you have big step sizes, your solution will be very inaccurate. You want your columns to be at least 100 cells long.</span></p><h2><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">Good luck!</span></h2>",
project_id: p14.id
)




#  Project 15

p15 = Project.create(
  title: "Cat is awesome!",
description:
 "<p><span style=\"color: rgb(128, 128, 128);\" class=\"ql-size-large\">-&nbsp;</span><strong style=\"color: rgb(106, 106, 106);\" class=\"ql-size-large\">Cats</strong><span style=\"color: rgb(84, 84, 84);\" class=\"ql-size-large\">&nbsp;may have evolved their “tone of voice” to communicate with humans.&nbsp;</span><strong style=\"color: rgb(106, 106, 106);\" class=\"ql-size-large\">Cats</strong><span style=\"color: rgb(84, 84, 84);\" class=\"ql-size-large\">' natural vocal range would be inaudible to humans, but they communicate feelings such as affection, hunger, and fear within the range of human hearing.</span></p>",
video_url: "https://www.youtube.com/embed/hY7m5jjJ9mM",
author_id: demo.id
)


Step.create(
  title: "Cat Step 1",
 body:
  "<p><span class=\"ql-size-large\">Cat is .....</span></p><p><br></p><ol><li><span class=\"ql-size-large\">Good</span></li><li><span class=\"ql-size-large\">Awesome</span></li><li><span class=\"ql-size-large\">cute</span></li><li><span class=\"ql-size-large\">all of the above</span></li></ol>",
 project_id: p15.id
)
