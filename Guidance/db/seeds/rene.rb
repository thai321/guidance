u5 = User.create(username: 'Rene Descartes', email: 'rene@example.com', password: '123456')
u5.image = File.new("#{Rails.root}/app/assets/images/rene.jpg")
u5.save

# user_ids = []
# User.all.map do |u|
#   user_ids.push(u.id) if u5.id != u.id
# end
#
# u5.follower_ids = user_ids
# u5.save

p5 = Project.create(
  title: "How to Make a Wheel Encoder",
description:
 "<p><span class=\"ql-size-large\">I am designing a robot.</span></p><p><span class=\"ql-size-large\">I have chosen to use DC motors. So I needed encoders to control these motors.</span></p><p><span class=\"ql-size-large\">For doing so I designed an encoder and developed the associated software.</span></p><p><span class=\"ql-size-large\">The electronic is very simple and the software designed to be easy to used.</span></p>",
video_url: "https://www.youtube.com/embed/YaoZ_HXfDy4",
published: true,
author_id: u5.id
)


p5.tag_ids = [1,3]
p5.save


Step.create(
  title: "How Does It Work ?",
  body:
   "<p><span class=\"ql-size-large\">The encoder is made of:</span></p><ul><li><span class=\"ql-size-large\">a little wheel with some holes regularly spaced This wheel is added on the wheel shaft</span></li><li><span class=\"ql-size-large\">one infrared emitter and one infrared receiver on each sides of the wheel aligned with the holes some</span></li><li><span class=\"ql-size-large\">a few electronic components that detect each time the receiver see the emitter thru a hole</span></li><li><span class=\"ql-size-large\">it is up to the software to count the number of holes and deduct the move.</span></li></ul><p><br></p>",
  project_id: p5.id,
)


Step.create(
  title: "Let's Do the Electronic",
  body:
   "<p><strong class=\"ql-size-large\">Firstly we need some very cheap components</strong></p><ul><li><span class=\"ql-size-large\">IR emitter and receiver (I found 20 for 1.79€ on aliexpress)</span></li><li><span class=\"ql-size-large\">2 x 10k ohms resistors 1 x 150 ohms resistor</span></li><li><span class=\"ql-size-large\">1 NPN transistors (I used BC547)</span></li><li><span class=\"ql-size-large\">optionally for power switch</span></li><li class=\"ql-indent-1\"><span class=\"ql-size-large\">1 NPN transistors (I used 2N222A )</span></li><li class=\"ql-indent-1\"><span class=\"ql-size-large\">1 x 5 volts regulator</span></li></ul><p><span class=\"ql-size-large\">The resistor values may have to be adjusted to fit with the IR components you will get and voltage you will choose</span></p><p><span class=\"ql-size-large\">If you will power on with a battery it is better to be able to switch IR emitter power to reduce power consumption</span></p><p><strong class=\"ql-size-large\">Secondly test on a breadboard</strong></p><ul><li><span class=\"ql-size-large\">set the components according to breadboard picture</span></li><li><span class=\"ql-size-large\">check the voltage you get on the transistor output</span></li><li class=\"ql-indent-1\"><span class=\"ql-size-large\">it can be done with the following Arduino sketch or with a voltage measurement tool</span></li><li class=\"ql-indent-1\"><span class=\"ql-size-large\">you must get around 4 volt in case there an obstacle between emitter and receiver and 1 volt in the other case. obviously i depends of the distance between the 2 IR components</span></li></ul><p><br></p><p><br></p><pre class=\"ql-syntax\" spellcheck=\"false\"><span class=\"hljs-meta\">#define powerSwitchPIN xx <span class=\"hljs-comment\">// digital PIN</span></span>\n" +
   "<span class=\"hljs-meta\">#define encoderInput Ay <span class=\"hljs-comment\">// analog PIN</span></span>\n" +
   "\n" +
   "<span class=\"hljs-function\"><span class=\"hljs-keyword\">void</span> <span class=\"hljs-title\">setup</span><span class=\"hljs-params\">()</span> </span>{\n" +
   "\n" +
   "pinMode(powerSwitchPIN, OUTPUT);\n" +
   "\n" +
   "Serial.begin(<span class=\"hljs-number\">38400</span>);\n" +
   "\n" +
   "digitalWrite(powerSwitchPIN,<span class=\"hljs-number\">1</span>);\n" +
   "\n" +
   "}\n" +
   "\n" +
   "<span class=\"hljs-function\"><span class=\"hljs-keyword\">void</span> <span class=\"hljs-title\">loop</span><span class=\"hljs-params\">()</span>\n" +
   "\n" +
   "</span>{\n" +
   "\n" +
   "Serial.print(<span class=\"hljs-keyword\">float</span>(<span class=\"hljs-built_in\">map</span>(analogRead(encoderInput),<span class=\"hljs-number\">0</span>,<span class=\"hljs-number\">1023</span>,<span class=\"hljs-number\">0</span>,<span class=\"hljs-number\">500</span>))/<span class=\"hljs-number\">100</span>);\n" +
   "\n" +
   "Serial.println(<span class=\"hljs-string\">\" volt\"</span>); delay(<span class=\"hljs-number\">1000</span>);\n" +
   "\n" +
   "}\n" +
   "\n" +
   "</pre><p><br></p><p><strong class=\"ql-size-large\">At last do some solder</strong></p><ul><li><span class=\"ql-size-large\">On one side IR emitter and receiver</span></li><li><span class=\"ql-size-large\">On the other side resistors, transistors and wires</span></li></ul><p><br></p>",
  project_id: p5.id,
)



Step.create(
  title: "It Is Time to Work on the Software",
  body:
   "<p><span class=\"ql-size-large\">I developed a library for Arduino that is free of usage.</span></p><p><span class=\"ql-size-large\">Software is designed to handle from 1 to 4 decoders simultaneously. It works asynchronously of the main code. The main code has to initialize some parameters and then can start the encoder control independently of each others . When a requested threshold expressed in number of holes will be reached the main code will be interrupt by the library code and will be able to act accordingly.</span></p><p><a href=\"https://github.com/cuillerj/WheelControl\" target=\"_blank\" style=\"color: rgb(232, 108, 0);\" class=\"ql-size-large\">The software can be download on Github</a></p><p><span class=\"ql-size-large\">WheelControl.h contains the library usage documentation</span></p><p><span class=\"ql-size-large\">example/framework.ino helps to start with this library</span></p>",
  project_id: p5.id,
)
