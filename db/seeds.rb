User.destroy_all
Project.destroy_all
Step.destroy_all
Comment.destroy_all
Follow.destroy_all

# Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }

# load "#{Rails.root}/db/seeds/seed_user.rb"
# load "#{Rails.root}/db/seeds/data5.rb"
# load 'db/seeds/aristotle'

Tag.create(name: 'Arduino')
Tag.create(name: 'Math')
Tag.create(name: 'Computer Science')
Tag.create(name: 'Other')

demo = User.create(username: 'guest', email: 'guest@example.com', password: '123456')


u1 = User.create(username: 'Aristotle', email: 'aristotle@example.com', password: '123456')
# u1.image = File.new("#{Rails.root}/app/assets/images/aristotle.jpg")
# u1.save


u2 = User.create(username: 'Galileo', email: 'galileo@example.com', password: '123456')
# u2.image = File.new("#{Rails.root}/app/assets/images/galileo.jpg")
# u2.save


u3 = User.create(username: 'Plato', email: 'plato@example.com', password: '123456')
# u3.image = File.new("#{Rails.root}/app/assets/images/plato.jpg")
# u3.save


u4 = User.create(username: 'Pythagoras', email: 'pythagoras@example.com', password: '123456')
# u4.image = File.new("#{Rails.root}/app/assets/images/pythagoras.jpg")
# u4.save

u5 = User.create(username: 'Rene Descartes', email: 'rene@example.com', password: '123456')
# u5.image = File.new("#{Rails.root}/app/assets/images/rene.jpg")
# u5.save


u6 = User.create(username: 'CSLewis', email: 'cslewis@example.com', password: '123456')
# u6.image = File.new("#{Rails.root}/app/assets/images/lewis2.jpg")
# u6.save


u7 = User.create(username: 'Thomas Aquinas', email: 'aquinas@example.com', password: '123456')
# u7.image = File.new("#{Rails.root}/app/assets/images/aquinas.jpg")
# u7.save

u8 = User.create(username: 'Epicurus', email: 'epicurus@example.com', password: '123456')
# u8.image = File.new("#{Rails.root}/app/assets/images/epicurus.jpg")
# u8.save

u9 = User.create(username: 'Socrates', email: 'socrates@example.com', password: '123456')
# u9.image = File.new("#{Rails.root}/app/assets/images/socrates.jpg")
# u9.save


u10 = User.create(username: 'David Hume', email: 'davidhume@example.com', password: '123456')
# u10.image = File.new("#{Rails.root}/app/assets/images/davidhume.jpg")
# u10.save

u11 = User.create(username: 'Isaac Newton', email: 'isaacnewton@example.com', password: '123456')
# u11.image = File.new("#{Rails.root}/app/assets/images/newton.jpg")
# u11.save


puts 'Create 11 Users'



p1 = Project.create(
  title: "LED Morse Code Encoder",
  description:
   "<p><span class=\"ql-size-huge\">Morse code is a old method of communication wherein text information is transmitted as a series of on-off tones, lights, or clicks which represent specific characters.</span></p><p><span class=\"ql-size-huge\">In this project, we will create a program and device, that takes text as an input serially, then relays this message to the Arduino, where the LED will light up to the morse code equivalent of the text message.</span></p>",
  video_url: "",
  author_id: u1.id,
  published: true
)

Step.create(
 title: "Tools and Materials",
 body:
  "<ul><li><span class=\"ql-size-huge\">Arduino 101 or Arduino Uno</span></li><li><span class=\"ql-size-huge\">Red LED</span></li><li><span class=\"ql-size-huge\">100Ω resistor</span></li><li><span class=\"ql-size-huge\">Jumper Wires</span></li></ul><p><br></p>",
  project_id: p1.id
)

Step.create(
  title: "Circuitry",
   body:
    "<p><span class=\"ql-size-huge\">The circuitry is very simple, since all that is needed is to control one LED.</span></p><ul><li><span class=\"ql-size-huge\">Connect the negative pin of the LED (flat edge) to ground.</span></li><li><span class=\"ql-size-huge\">Connect the positive pin of the LED (rounded side) to a 100Ω resistor.</span></li><li><span class=\"ql-size-huge\">Connect the 100Ω resistor in series to pin 9 on the Arduino.</span></li></ul><p><br></p>",
   project_id: p1.id
)


Step.create(
  title: "Code",
  body:
   "<pre class=\"ql-syntax\" spellcheck=\"false\"><span class=\"hljs-comment\">// declare the pin wehere the LED is plugged in&lt;br&gt;int ledPin = 9;</span>\n" +
   "<span class=\"hljs-comment\">// assign a pointer for the letters represented in morse code</span>\n" +
   "<span class=\"hljs-keyword\">char</span>* letters[] = { <span class=\"hljs-string\">\".-\"</span>, <span class=\"hljs-string\">\"-...\"</span>, <span class=\"hljs-string\">\"-.-.\"</span>, <span class=\"hljs-string\">\"-..\"</span>, <span class=\"hljs-string\">\".\"</span>, <span class=\"hljs-string\">\"..-.\"</span>, <span class=\"hljs-string\">\"--.\"</span>, <span class=\"hljs-string\">\"....\"</span>, <span class=\"hljs-string\">\"..\"</span>, <span class=\"hljs-string\">\".---\"</span>, <span class=\"hljs-string\">\"-.-\"</span>, <span class=\"hljs-string\">\".-..\"</span>, <span class=\"hljs-string\">\"--\"</span>, <span class=\"hljs-string\">\"-.\"</span>, <span class=\"hljs-string\">\"---\"</span>, <span class=\"hljs-string\">\".--.\"</span>, <span class=\"hljs-string\">\"--.-\"</span>, <span class=\"hljs-string\">\".-.\"</span>, <span class=\"hljs-string\">\"...\"</span>, <span class=\"hljs-string\">\"-\"</span>, <span class=\"hljs-string\">\"..-\"</span>, <span class=\"hljs-string\">\"...-\"</span>, <span class=\"hljs-string\">\".--\"</span>, <span class=\"hljs-string\">\"-..-\"</span>, <span class=\"hljs-string\">\"-.--\"</span>, <span class=\"hljs-string\">\"--..\"</span> };\n" +
   "<span class=\"hljs-comment\">// assign a pointer for the numbers represented in morsecode</span>\n" +
   "<span class=\"hljs-keyword\">char</span>* numbers[] = {<span class=\"hljs-string\">\"-----\"</span>, <span class=\"hljs-string\">\".----\"</span>, <span class=\"hljs-string\">\"..---\"</span>, <span class=\"hljs-string\">\"...--\"</span>, <span class=\"hljs-string\">\"....-\"</span>, <span class=\"hljs-string\">\".....\"</span>, <span class=\"hljs-string\">\"-....\"</span>, <span class=\"hljs-string\">\"--...\"</span>, <span class=\"hljs-string\">\"---..\"</span>, <span class=\"hljs-string\">\"----.\"</span>};\n" +
   "<span class=\"hljs-comment\">// declare how long the delay is in between sequences of dots</span>\n" +
   "<span class=\"hljs-keyword\">int</span> dotDelay = <span class=\"hljs-number\">200</span>;\n" +
   "<span class=\"hljs-function\"><span class=\"hljs-keyword\">void</span> <span class=\"hljs-title\">setup</span>() </span>{\n" +
   "  <span class=\"hljs-comment\">// setup the ledPin to be an output</span>\n" +
   "  pinMode(ledPin, OUTPUT);\n" +
   "  <span class=\"hljs-comment\">// alows us to use serial to communicate with the Arduino</span>\n" +
   "  Serial.begin(<span class=\"hljs-number\">9600</span>);\n" +
   "}<span class=\"hljs-function\"><span class=\"hljs-keyword\">void</span> <span class=\"hljs-title\">loop</span>() </span>{\n" +
   "  <span class=\"hljs-keyword\">char</span> ch;\n" +
   "  \n" +
   "  <span class=\"hljs-keyword\">if</span> (Serial.available()) {<span class=\"hljs-comment\">// is there anything to be read from USB?</span>\n" +
   "    ch = Serial.read(); <span class=\"hljs-comment\">// read a single letter through the serial monitor console</span>\n" +
   "      <span class=\"hljs-comment\">// if the character is between a to z i.e. it's a small letter</span>\n" +
   "      <span class=\"hljs-keyword\">if</span> (ch &gt;= <span class=\"hljs-string\">'a'</span> &amp;&amp; ch &lt;= <span class=\"hljs-string\">'z'</span>){\n" +
   "        flashSequence(letters[ch - <span class=\"hljs-string\">'a'</span>]);\n" +
   "      <span class=\"hljs-comment\">// is it a capital letter?</span>\n" +
   "      } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (ch &gt;= <span class=\"hljs-string\">'A'</span> &amp;&amp; ch &lt;= <span class=\"hljs-string\">'Z'</span>) {\n" +
   "        flashSequence(letters[ch - <span class=\"hljs-string\">'A'</span>]);\n" +
   "      <span class=\"hljs-comment\">// is it a number?</span>\n" +
   "      } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (ch &gt;= <span class=\"hljs-string\">'0'</span> &amp;&amp; ch &lt;= <span class=\"hljs-string\">'9'</span>) {\n" +
   "        flashSequence(numbers[ch - <span class=\"hljs-string\">'0'</span>]); \n" +
   "      <span class=\"hljs-comment\">// if it's none of the above, make it a space which is 4 times the delay of a dot sequence</span>\n" +
   "      } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (ch == <span class=\"hljs-string\">' '</span>) {\n" +
   "        delay(dotDelay * <span class=\"hljs-number\">4</span>); }<span class=\"hljs-comment\">// gap between words</span>\n" +
   "  }\n" +
   "}\n" +
   "  \n" +
   "<span class=\"hljs-comment\">// determines the sequences to flashed by parsing the seqeunce of letters read by the serial monitor</span>\n" +
   "<span class=\"hljs-function\"><span class=\"hljs-keyword\">void</span> <span class=\"hljs-title\">flashSequence</span>(<span class=\"hljs-params\"><span class=\"hljs-keyword\">char</span>* sequence</span>) </span>{\n" +
   "  <span class=\"hljs-keyword\">int</span> i = <span class=\"hljs-number\">0</span>;\n" +
   "  <span class=\"hljs-comment\">// while there are still characters keep going through each one</span>\n" +
   "  <span class=\"hljs-keyword\">while</span> (sequence[i] != NULL)  {\n" +
   "    flashDotOrDash(sequence[i]);\n" +
   "    i++; } <span class=\"hljs-comment\">// increment by one until end of characters</span>\n" +
   "  delay(dotDelay * <span class=\"hljs-number\">3</span>); <span class=\"hljs-comment\">// gap between letters</span>\n" +
   "} <span class=\"hljs-comment\">// checks if it is a dot or a dash</span>\n" +
   "<span class=\"hljs-function\"><span class=\"hljs-keyword\">void</span> <span class=\"hljs-title\">flashDotOrDash</span>(<span class=\"hljs-params\"><span class=\"hljs-keyword\">char</span> dotOrDash</span>) </span>{\n" +
   "  digitalWrite(ledPin, HIGH);\n" +
   "  <span class=\"hljs-keyword\">if</span> (dotOrDash == <span class=\"hljs-string\">'.'</span>)  {\n" +
   "    delay(dotDelay); \n" +
   "  } <span class=\"hljs-keyword\">else</span> { <span class=\"hljs-comment\">// must be a -</span>\n" +
   "    delay(dotDelay * <span class=\"hljs-number\">3</span>);   <span class=\"hljs-comment\">// if it's a dot then we need a longer delay gap relative to a dot.</span>\n" +
   "  }\n" +
   "  \n" +
   "  digitalWrite(ledPin, LOW);\n" +
   "  delay(dotDelay); <span class=\"hljs-comment\">// gap between flashes</span>\n" +
   "  \n" +
   "}\n" +
   "\n" +
   "</pre>",
  project_id: p1.id,
)




Step.create(
  title: "Demo",
  body:
   "<iframe class=\"ql-video\" frameborder=\"0\" allowfullscreen=\"true\" src=\"https://www.youtube.com/embed/uNSWJMnPgEU?showinfo=0\"></iframe><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-huge\">To test the program, text without special characters is inputed to the serial monitor console, in this case, the classic programmers \"Hello World\", and this is lit up in morse code on the LED, after enter is triggered</span></p>",
   project_id: p1.id
)


Step.create(
  title: "Riddle Me This",
 body:
  "<iframe class=\"ql-video\" frameborder=\"0\" allowfullscreen=\"true\" src=\"https://www.youtube.com/embed/IFPxtwYUnVc?showinfo=0\"></iframe><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-huge\">I have decided to encode a message via Morse Code. Comment down below if you figure out what the secret message is!</span></p>",
 project_id: p1.id,
)




p2 = Project.create(
  title: "The Morse Translator With Arduino ",
description:
 "<p><span class=\"ql-size-huge\">What it does:</span></p><p><span class=\"ql-size-huge\">It translates your morse code into English words!</span></p><p><span class=\"ql-size-huge\">With this Morse Translator you can improve your morsing skills. Imagen,if the zombie apocalypse will happen, this will be the only way to communicate. Start practicing now!!</span></p><p><span class=\"ql-size-huge\">... or just have fun morsing ;)</span></p><p><strong class=\"ql-size-huge\">About the morse code:</strong></p><p><span class=\"ql-size-huge\">Characters in morse code consist of a series of dots (short beeps) and dashes (long beeps).&nbsp;</span></p><p><span class=\"ql-size-huge\">The duration of a dot is the basic unit of time.</span></p><p><span class=\"ql-size-huge\">To begin with, the variable is set to a value of 1000 ms, which is good if you're just starting to learn morse code. The following rules hold: The duration of a dash is three times the duration of a dot (default 1000ms) The gap between dashes and dots within a character is the duration of a dot.The gap between characters is three times the duration of a dot (i.e., the duration of a dash)The gap between words is seven times the duration of a dot.</span></p><p><strong class=\"ql-size-huge\">Components</strong></p><ul><li><span class=\"ql-size-huge\">1x Arduino Uno</span></li><li><span class=\"ql-size-huge\">1x Breadboard</span></li><li><span class=\"ql-size-huge\">1x Potentiometer 10k Ω</span></li><li><span class=\"ql-size-huge\">1x Button</span></li><li><span class=\"ql-size-huge\">1x Speaker (Piezo Buzzer)</span></li><li><span class=\"ql-size-huge\">1x LCD (Hitachi HD44780 compatible)</span></li><li><span class=\"ql-size-huge\">1x Resistor 220 Ω</span></li><li><span class=\"ql-size-huge\">M-M / M-F Jumper cables</span></li></ul><p><br></p>",
video_url: "https://www.youtube.com/embed/NQn-DLBpyJ0",
author_id: u2.id,
published: true
)


Step.create(
  title: "Connecting Parts",
  body: "<p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-huge\">Connect the parts according to the fritzing sketch.</span></p>",
  project_id: p2.id,
)


Step.create(
  title: "Code and Usage",
  body:
   "<p><span class=\"ql-size-huge\">Upload the source code to your Arduino.</span></p><p><span class=\"ql-size-huge\">You can change the duration of a dot in the source code by changing the value of the variable</span><strong class=\"ql-size-huge\"><em>&nbsp;dotDuration</em></strong><span class=\"ql-size-huge\">.</span></p><p><span class=\"ql-size-huge\">In order to make it easier for beginners, the morse code translator tolerates certain deviations of the actual duration of dots, dashes and gaps.</span></p><p><span class=\"ql-size-huge\">The tolerance can be modifies by changing the value of the variable&nbsp;</span><strong class=\"ql-size-huge\"><em>tolerance&nbsp;</em></strong><span class=\"ql-size-huge\">in the source code (the default is 500 ms).</span></p><p><span class=\"ql-size-huge\">- Happy morsing!</span></p>",
  project_id: p2.id,
)





p3 = Project.create(
  title: "Morse Code by a PS\\2 Keyboard",
 description:
  "<p><span class=\"ql-size-huge\">Hi, all!</span></p><p><span class=\"ql-size-huge\">Today I' m trying to explain you my last project: \"The morse code generator by a PS\\2 keyboard\"</span></p><p><span class=\"ql-size-huge\">I' ve used an PS/2 keyboard to send input to my Arduino board and transform it in morse code that activate a speaker and a relay.</span></p><p><span class=\"ql-size-huge\">Components:</span></p><p><span class=\"ql-size-huge\">- PS\\2 keyboard</span></p><p><span class=\"ql-size-huge\">- Arduino Uno(or others)</span></p><p><span class=\"ql-size-huge\">- Wires</span></p><p><span class=\"ql-size-huge\">- 5V relay</span></p><p><span class=\"ql-size-huge\">- BC547 transistor</span></p><p><span class=\"ql-size-huge\">- Small speaker</span></p><p><span class=\"ql-size-huge\">- Recirculation Diode</span></p>",
 video_url: "",
 published: true,
 author_id: u3.id
)

Step.create(
  title: "Setting Hardware",
  body:
   "<p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-huge\">The Fritzing project image below can explain almost all, but the hardest thing is connect the keyboard to the Arduino board. We must connect the PS\\2 connector data pin to the Arduino pin 8, the clock pin to the 2nd, 5V pin to a 5V source and GND pin to GND. If you find a female PS\\2 connector you are very lucky and can use it but others can do like me: I've use as replacement the metal part, covered by insulating tape, of connectors that are used on the mother boards (for wires of: power and HDD LEDs, power and reset buttons, USB face connectors , ecc. ecc.) .</span></p>",
  project_id: p3.id,
)


Step.create(
  title: "Software and Conclusions",
  body:
   "<p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-huge\">Here is attached the '.ino' file I've made. You'll find the 'PS2Keyboard.h' library in&nbsp;</span><a href=\"http://www.pjrc.com/teensy/td_libs_PS2Keyboard.html\" target=\"_blank\" style=\"color: rgb(232, 108, 0); background-color: rgb(255, 255, 255);\" class=\"ql-size-huge\">here</a><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-huge\">. Enjoy it.</span></p><p><br></p><pre class=\"ql-syntax\" spellcheck=\"false\"><span class=\"hljs-comment\">/**********\n" +
   "morse.ino\n" +
   "**********/</span>\n" +
   "\n" +
   "<span class=\"hljs-meta\">#include &lt;PS2Keyboard.h&gt;</span>\n" +
   "\n" +
   "<span class=\"hljs-keyword\">const</span> <span class=\"hljs-keyword\">int</span> DataPin = <span class=\"hljs-number\">8</span>;\n" +
   "<span class=\"hljs-keyword\">const</span> <span class=\"hljs-keyword\">int</span> IRQpin =&nbsp; <span class=\"hljs-number\">2</span>;\n" +
   "\n" +
   "PS2Keyboard keyboard;\n" +
   "\n" +
   "<span class=\"hljs-function\"><span class=\"hljs-keyword\">void</span> <span class=\"hljs-title\">setup</span><span class=\"hljs-params\">()</span> </span>{\n" +
   "&nbsp; delay(<span class=\"hljs-number\">1000</span>);\n" +
   "&nbsp; keyboard.begin(DataPin, IRQpin);\n" +
   "}\n" +
   "\n" +
   "<span class=\"hljs-function\"><span class=\"hljs-keyword\">void</span> <span class=\"hljs-title\">loop</span><span class=\"hljs-params\">()</span> </span>{\n" +
   "&nbsp; <span class=\"hljs-keyword\">if</span> (keyboard.available()) {\n" +
   "&nbsp;&nbsp;&nbsp;\n" +
   "&nbsp;&nbsp;&nbsp; <span class=\"hljs-keyword\">char</span> c = keyboard.read();\n" +
   "&nbsp;&nbsp;&nbsp;\n" +
   "&nbsp;&nbsp;&nbsp; <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'a'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p();l();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'b'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l();p();p();p();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'c'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l();p();l();p();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'d'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l();p();p();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'e'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'f'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p();p();l();p();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'g'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l();l();p();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'h'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p();p();p();p();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'i'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p();p();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'j'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p();l();l();l();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'k'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l();p();l();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'l'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p();l();p();p();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'m'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l();l();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'n'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l();p();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'o'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l();l();l();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'p'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p();l();l();p();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'q'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l();l();p();l();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'r'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p();l();p();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'s'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p();p();p();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'t'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'u'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p();p();l();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'v'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p();p();p();l();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'w'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p();l();l();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'x'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l();p();p();l();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'y'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l();p();l();l();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'z'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l();l();p();p();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'1'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p();l();l();l();l();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'2'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p();p();l();l();l();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'3'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p();p();p();l();l();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'4'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p();p();p();p();l();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'5'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p();p();p();p();p();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'6'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l();p();p();p();p();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'7'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l();l();p();p();p();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'8'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l();l();l();p();p();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'9'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l();l();l();l();p();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">'0'</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l();l();l();l();l();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (c == <span class=\"hljs-string\">' '</span>) {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pausa();\n" +
   "&nbsp;&nbsp;&nbsp; } <span class=\"hljs-keyword\">else</span> {\n" +
   "&nbsp;&nbsp;&nbsp;&nbsp; tone(<span class=\"hljs-number\">4</span>, <span class=\"hljs-number\">300</span>, <span class=\"hljs-number\">250</span>); <span class=\"hljs-comment\">//error tone</span>\n" +
   "&nbsp;&nbsp;&nbsp; }\n" +
   "&nbsp; }\n" +
   "}\n" +
   "\n" +
   "<span class=\"hljs-function\"><span class=\"hljs-keyword\">void</span> <span class=\"hljs-title\">p</span><span class=\"hljs-params\">()</span></span>{&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class=\"hljs-comment\">//dot</span>\n" +
   "&nbsp; digitalWrite(<span class=\"hljs-number\">12</span>, HIGH);\n" +
   "&nbsp; tone(<span class=\"hljs-number\">4</span>, <span class=\"hljs-number\">700</span>);\n" +
   "&nbsp; delay(<span class=\"hljs-number\">250</span>);\n" +
   "&nbsp; digitalWrite(<span class=\"hljs-number\">12</span>, LOW);\n" +
   "&nbsp; noTone(<span class=\"hljs-number\">4</span>);\n" +
   "&nbsp; delay(<span class=\"hljs-number\">250</span>);\n" +
   "}\n" +
   "\n" +
   "<span class=\"hljs-function\"><span class=\"hljs-keyword\">void</span> <span class=\"hljs-title\">l</span><span class=\"hljs-params\">()</span></span>{&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class=\"hljs-comment\">//dash</span>\n" +
   "&nbsp; digitalWrite(<span class=\"hljs-number\">12</span>, HIGH);\n" +
   "&nbsp; tone(<span class=\"hljs-number\">4</span>, <span class=\"hljs-number\">700</span>);\n" +
   "&nbsp; delay(<span class=\"hljs-number\">750</span>);\n" +
   "&nbsp; digitalWrite(<span class=\"hljs-number\">12</span>,LOW);\n" +
   "&nbsp; noTone(<span class=\"hljs-number\">4</span>);\n" +
   "&nbsp; delay(<span class=\"hljs-number\">250</span>);\n" +
   "}\n" +
   "\n" +
   "<span class=\"hljs-function\"><span class=\"hljs-keyword\">void</span> <span class=\"hljs-title\">pausa</span><span class=\"hljs-params\">()</span></span>{&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class=\"hljs-comment\">//pause between two letters</span>\n" +
   "&nbsp; delay(<span class=\"hljs-number\">1750</span>);\n" +
   "}\n" +
   "</pre><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-huge\">If you have any kind of problems leave a comment</span></p>",
  project_id: p3.id,
)




p4 = Project.create(
  title: "Improved Arduino Rotary Encoder",
   description:
    "<p><strong class=\"ql-size-large\"><em>Rotary encoders are great input devices for electronics projects - hopefully this Instructable will inspire and help you use one in your next project.</em></strong></p><p><strong class=\"ql-size-large\">Why write rotary encoder code?</strong></p><p><span class=\"ql-size-large\">I wanted to use a low cost rotary encoder as an input mechanism for one of my upcoming projects and was initially bewildered by the&nbsp;</span><a href=\"http://playground.arduino.cc/Main/RotaryEncoders\" target=\"_blank\" style=\"color: rgb(232, 108, 0);\" class=\"ql-size-large\">code options available to take readings from the rotary encoder</a><span class=\"ql-size-large\">&nbsp;and determine how many \"detents\" or cycles the encoder had clicked past and in what direction. I think my main sketch will need to use most of my Arduino's memory so I am avoiding the various available encoder libraries, which seemed to be difficult to make work when I tried a couple of them. They also appear to use far more of the code budget than the sketch-based code approaches discussed from here on.</span></p><p><em class=\"ql-size-large\">If you just want to bypass the thinking behind my approach and get straight into the Instructable, feel free to skip ahead to Step 1!</em></p><p><strong class=\"ql-size-large\">Other Approaches</strong></p><p><span class=\"ql-size-large\">Several of the main sketch-based (i.e. they don't use a library) approaches are discussed in&nbsp;</span><a href=\"http://practicalusage.com/arduino-using-a-rotary-encoder/\" target=\"_blank\" style=\"color: rgb(232, 108, 0);\" class=\"ql-size-large\">rt's blog post where they write rotary encoder code</a><span class=\"ql-size-large\">&nbsp;that makes the cheapest encoders usable as Arduino inputs. They also have a good example of they logic signal that the encoder produces. rt found that a timer interrupt system worked best for them but I'm concerned that the polling frequency would detract from screen update speed in the main loop of my project sketch. Given that the rotary encoder will be moving for a tiny proportion of the time I want the screen to be updating, this seems a poor match for my application.</span></p><p><span class=\"ql-size-large\">I chose to start off using&nbsp;</span><a href=\"http://arduinotronics.blogspot.co.uk/2013/09/using-rotary-encoder-with-arduino.html\" target=\"_blank\" style=\"color: rgb(232, 108, 0);\" class=\"ql-size-large\">Steve Spence's code here</a><span class=\"ql-size-large\">, which was fine on it's own but appeared to really slow down when I incorporated the rest of my sketch code (which involves writing display updates to a small TFT screen). Initially I wondered if it could be because the main loop contains a debounce statement.</span></p><p><span class=\"ql-size-large\">I then read&nbsp;</span><a href=\"https://www.circuitsathome.com/mcu/rotary-encoder-interrupt-service-routine-for-avr-micros\" target=\"_blank\" style=\"color: rgb(232, 108, 0);\" class=\"ql-size-large\">Oleg's rotary encoder article</a><span class=\"ql-size-large\">&nbsp;on an&nbsp;</span><a href=\"http://www.gammon.com.au/forum/?id=11488\" target=\"_blank\" style=\"color: rgb(232, 108, 0);\" class=\"ql-size-large\">interrupt service routine</a><span class=\"ql-size-large\">&nbsp;version of his previous post, I also thought it might be a good idea to use direct port manipulation to read both pins simultaneously and as soon as the interrupt fires. His code can be used on any input pin if the port manipulation code is rewritten. In contrast, I decided to use only the hardware interrupts on digital pins 2 and 3, so we can set interrupts to only fire on a rising edge of the pin voltage, rather than on pin voltage change, which includes falling edges. This reduces the number of times the ISR is called, distracting from the main loop.</span></p><p><span class=\"ql-size-large\">Oleg's code uses a lookup table to reduce compiled code size to a really small size but I couldn't get reliable results which would catch very slow rotation as well as reasonably fast rotation. Bear in mind that hardware debouncing (see Step 2) can help a lot with reliability of readings but I was after a software solution to simplify the hardware build and be as portable to other hardware applications as possible.</span></p><p><span class=\"ql-size-large\">This concludes the introduction of my challenge and considerations. In Step 2 we'll take a look at the encoder hardware, terminology and some practical considerations when you want to integrate a rotary encoder into your project.</span></p>",
   video_url: "",
   published: true,
   author_id: u4.id,
)


Step.create(
  title: "A Bit About Rotary Encoders",
 body:
  "<p><strong class=\"ql-size-large\"><em>Why are rotary encoders so cool?</em></strong></p><ol><li><span class=\"ql-size-large\">Unlike a variable resistor/potentiometer they have infinite travel in any direction and because they produce a&nbsp;</span><a href=\"https://en.wikipedia.org/wiki/Gray_code\" target=\"_blank\" style=\"color: rgb(232, 108, 0);\" class=\"ql-size-large\">digital \"Gray code\"</a><span class=\"ql-size-large\">&nbsp;you can scale their readings to whatever range you like.</span></li><li><span class=\"ql-size-large\">The dual direction makes them useful for increasing or decreasing a value within a variable or navigating menus.</span></li><li><span class=\"ql-size-large\">Finally, many of these rotary encoders come with a centre push button, which can be used to select menu items, reset a counter or do anything you can think of that might suit a momentary push button.</span></li></ol><p><strong class=\"ql-size-large\">Terms</strong></p><ol><li><strong class=\"ql-size-large\">PPR:&nbsp;</strong><span class=\"ql-size-large\">pulses per rotation - typically 12, 20 or 24. You might also see specifications for maximum rotation in rpm etc. This is probably determined by the encoder's propensity to \"bounce\" contacts - see below.</span></li><li><strong class=\"ql-size-large\">Detent:</strong><span class=\"ql-size-large\">&nbsp;the little click of the action as it springs to a natural rest point between pulses. There may be one detent per pulse/cycle (not equal to a rotation of the shaft) or two.</span></li><li><strong class=\"ql-size-large\">Bounce:&nbsp;</strong><span class=\"ql-size-large\">mechanical contacts inside the encoder literally bounce enough to jump off and back on a contact when rotating, potentially leading to too many readings attributed to that phase of the travel between detents.</span></li><li><strong class=\"ql-size-large\">Debounce:&nbsp;</strong><span class=\"ql-size-large\">This can be either done in hardware, perhaps with a low value ceramic capacitor between each pin and Ground, or in software, perhaps with a delay. In either case, the aim is to create a system which ignores bouncing contacts.</span></li></ol><p><strong class=\"ql-size-large\">Tips</strong></p><ol><li><span class=\"ql-size-large\">Look out for a threaded section near the base of the shaft and a matching nut if you want to mount your encoder in a panel or enclosure.</span></li><li><span class=\"ql-size-large\">Many knobs are available for rotary encoders, with the most easily available coming in 6mm diameter shafts.</span></li><li><span class=\"ql-size-large\">Pay attention to whether your encoder shaft uses a flat face or splines to achieve a proper fit with the knob.</span></li><li><span class=\"ql-size-large\">The body of the rotary encoder may also come with a raised pin/stub, intended to mate with a small indent/hole in your panel (probably hidden by your knob) and prevent your encoder from rotating when you turn the knob. You might find you want to remove this if you can create enough friction to prevent encoder body rotation using the mounting bolt to screw the encoder in the panel or enclosure.</span></li><li><span class=\"ql-size-large\">Make sure you find out where the detent state is for your encoder and adapt your code accordingly. My example uses an encoder whose pins are both disconnected from ground and are pulled high by their respective input pullup resistors. This drives my selection of a RISING interrupt. If both pins were connected to ground when at detent, they would need code which was looking for FALLING pin voltage.</span></li></ol>",
 project_id: p4.id,
)


Step.create(
  title: "The Circuit",
  body:
   "<p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">The circuit is so simple. You will need:</span></p><p><br></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">• An ATMEGA328P based Arduino, such as the Uno, Pro Mini or Nano.&nbsp;</span></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">• A mechanical (as opposed to optical) quadrature rotary encoder - this is the most common kind so don't worry too much if it isn't specified. eBay and Aliexpress listings will often mention Arduino in the description and this is a good indicator that one is suitable.&nbsp;</span></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">• Hook-up wire/jumper leads.&nbsp;</span></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">• Optional: a prototyping breadboard.&nbsp;</span></p><p><br></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">First of all, look for a collection of three pins on one side of the encoder. These are the three for measuring rotation with our code. If there are two pins together on another side, these are likely to be for the centre push button. We'll ignore these for now.&nbsp;</span></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">Out of the three pins together, the encoder ground pin is connected to Arduino ground pin. Either of the other two pins is connected to digital pin 2 and the remaining on is connected to digital pin 3. If your direction of rotation isn't the way you'd like, just swap the two non-ground pins over.</span></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">Pins 2 and 3 are important because on the ATMEGA328P-based Arduinos they are the only pins which have the ability to detect RISING and FALLING pin change interrupts. The MEGA 2560 boards etc. have other hardware interrupt pins which can do this.</span></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">Note: In the diagram the ground pin is one of the end pins. In reality, the ground pin is often the centre pin but this is not always the case so read the datasheet or test your encoder to find out which pin is ground.</span></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">Another note: ArneTR made a good comment about not having a separately wired connection to the logic positive voltage (e.g. 5V or 3.3V) for the rotary encoder circuit shown. The Arduino can't read the rotary encoder without both a ground signal (which we have connected a wire to) and the logic voltage (sometimes annotated as Vcc or Vdd), so how can the Arduino read the logic from this encoder without a positive voltage wire? The answer is that the ATMEGA328P chip in the Arduino has a special mode you can set on the digital pins (which we are using) where a pin is automatically pulled \"high\" to the logic voltage by an internal resistor. Look in the code for \"pinMode(pinX, INPUT_PULLUP)\" to see us telling the Arduino that we want to take advantage of this mode. Once set, we only need to provide the encoder with a ground wire as the sensing wires from the digital pins are already providing the logic voltage.</span></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">ONE MORE THING... Githyuk found that a particular branded encoder didn't work with this way of doing things (ie the code below). Please see the comments section for details but in general, trying a different encoder would be a good debugging step when you have exhausted the easier/faster/cheaper steps.&nbsp;</span></p>",
  project_id: p4.id,
)


Step.create(
  title: "The Code",
  body:
   "<p><span class=\"ql-size-large\">If you are not familiar with programming Arduinos, please get up to speed with this&nbsp;</span><a href=\"https://www.arduino.cc/en/Guide/HomePage\" target=\"_blank\" style=\"color: rgb(232, 108, 0);\" class=\"ql-size-large\">resource from Arduino themselves</a><span class=\"ql-size-large\">.</span></p><p><span class=\"ql-size-large\">This code is free for your use (as in no cost and to be modified as you please), please attribute where you should.</span></p><p><br></p><p><br></p><pre class=\"ql-syntax\" spellcheck=\"false\"><span class=\"hljs-comment\">/*******Interrupt-based Rotary Encoder Sketch*******\n" +
   "by Simon Merrett, based on insight from Oleg Mazurov, Nick Gammon, rt, Steve Spence\n" +
   "*/</span>\n" +
   "\n" +
   "<span class=\"hljs-keyword\">static</span> <span class=\"hljs-keyword\">int</span> pinA = <span class=\"hljs-number\">2</span>; <span class=\"hljs-comment\">// Our first hardware interrupt pin is digital pin 2</span>\n" +
   "<span class=\"hljs-keyword\">static</span> <span class=\"hljs-keyword\">int</span> pinB = <span class=\"hljs-number\">3</span>; <span class=\"hljs-comment\">// Our second hardware interrupt pin is digital pin 3</span>\n" +
   "<span class=\"hljs-keyword\">volatile</span> <span class=\"hljs-keyword\">byte</span> aFlag = <span class=\"hljs-number\">0</span>; <span class=\"hljs-comment\">// let's us know when we're expecting a rising edge on pinA to signal that the encoder has arrived at a detent</span>\n" +
   "<span class=\"hljs-keyword\">volatile</span> <span class=\"hljs-keyword\">byte</span> bFlag = <span class=\"hljs-number\">0</span>; <span class=\"hljs-comment\">// let's us know when we're expecting a rising edge on pinB to signal that the encoder has arrived at a detent (opposite direction to when aFlag is set)</span>\n" +
   "<span class=\"hljs-keyword\">volatile</span> <span class=\"hljs-keyword\">byte</span> encoderPos = <span class=\"hljs-number\">0</span>; <span class=\"hljs-comment\">//this variable stores our current value of encoder position. Change to int or uin16_t instead of byte if you want to record a larger range than 0-255</span>\n" +
   "<span class=\"hljs-keyword\">volatile</span> <span class=\"hljs-keyword\">byte</span> oldEncPos = <span class=\"hljs-number\">0</span>; <span class=\"hljs-comment\">//stores the last encoder position value so we can compare to the current reading and see if it has changed (so we know when to print to the serial monitor)</span>\n" +
   "<span class=\"hljs-keyword\">volatile</span> <span class=\"hljs-keyword\">byte</span> reading = <span class=\"hljs-number\">0</span>; <span class=\"hljs-comment\">//somewhere to store the direct values we read from our interrupt pins before checking to see if we have moved a whole detent</span>\n" +
   "\n" +
   "<span class=\"hljs-function\"><span class=\"hljs-keyword\">void</span> <span class=\"hljs-title\">setup</span>() </span>{\n" +
   "  pinMode(pinA, INPUT_PULLUP); <span class=\"hljs-comment\">// set pinA as an input, pulled HIGH to the logic voltage (5V or 3.3V for most cases)</span>\n" +
   "  pinMode(pinB, INPUT_PULLUP); <span class=\"hljs-comment\">// set pinB as an input, pulled HIGH to the logic voltage (5V or 3.3V for most cases)</span>\n" +
   "  attachInterrupt(<span class=\"hljs-number\">0</span>,PinA,RISING); <span class=\"hljs-comment\">// set an interrupt on PinA, looking for a rising edge signal and executing the \"PinA\" Interrupt Service Routine (below)</span>\n" +
   "  attachInterrupt(<span class=\"hljs-number\">1</span>,PinB,RISING); <span class=\"hljs-comment\">// set an interrupt on PinB, looking for a rising edge signal and executing the \"PinB\" Interrupt Service Routine (below)</span>\n" +
   "  Serial.begin(<span class=\"hljs-number\">115200</span>); <span class=\"hljs-comment\">// start the serial monitor link</span>\n" +
   "}\n" +
   "\n" +
   "<span class=\"hljs-function\"><span class=\"hljs-keyword\">void</span> <span class=\"hljs-title\">PinA</span>()</span>{\n" +
   "  cli(); <span class=\"hljs-comment\">//stop interrupts happening before we read pin values</span>\n" +
   "  reading = PIND &amp; <span class=\"hljs-number\">0xC</span>; <span class=\"hljs-comment\">// read all eight pin values then strip away all but pinA and pinB's values</span>\n" +
   "  <span class=\"hljs-keyword\">if</span>(reading == B00001100 &amp;&amp; aFlag) { <span class=\"hljs-comment\">//check that we have both pins at detent (HIGH) and that we are expecting detent on this pin's rising edge</span>\n" +
   "    encoderPos --; <span class=\"hljs-comment\">//decrement the encoder's position count</span>\n" +
   "    bFlag = <span class=\"hljs-number\">0</span>; <span class=\"hljs-comment\">//reset flags for the next turn</span>\n" +
   "    aFlag = <span class=\"hljs-number\">0</span>; <span class=\"hljs-comment\">//reset flags for the next turn</span>\n" +
   "  }\n" +
   "  <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (reading == B00000100) bFlag = <span class=\"hljs-number\">1</span>; <span class=\"hljs-comment\">//signal that we're expecting pinB to signal the transition to detent from free rotation</span>\n" +
   "  sei(); <span class=\"hljs-comment\">//restart interrupts</span>\n" +
   "}\n" +
   "\n" +
   "<span class=\"hljs-function\"><span class=\"hljs-keyword\">void</span> <span class=\"hljs-title\">PinB</span>()</span>{\n" +
   "  cli(); <span class=\"hljs-comment\">//stop interrupts happening before we read pin values</span>\n" +
   "  reading = PIND &amp; <span class=\"hljs-number\">0xC</span>; <span class=\"hljs-comment\">//read all eight pin values then strip away all but pinA and pinB's values</span>\n" +
   "  <span class=\"hljs-keyword\">if</span> (reading == B00001100 &amp;&amp; bFlag) { <span class=\"hljs-comment\">//check that we have both pins at detent (HIGH) and that we are expecting detent on this pin's rising edge</span>\n" +
   "    encoderPos ++; <span class=\"hljs-comment\">//increment the encoder's position count</span>\n" +
   "    bFlag = <span class=\"hljs-number\">0</span>; <span class=\"hljs-comment\">//reset flags for the next turn</span>\n" +
   "    aFlag = <span class=\"hljs-number\">0</span>; <span class=\"hljs-comment\">//reset flags for the next turn</span>\n" +
   "  }\n" +
   "  <span class=\"hljs-keyword\">else</span> <span class=\"hljs-keyword\">if</span> (reading == B00001000) aFlag = <span class=\"hljs-number\">1</span>; <span class=\"hljs-comment\">//signal that we're expecting pinA to signal the transition to detent from free rotation</span>\n" +
   "  sei(); <span class=\"hljs-comment\">//restart interrupts</span>\n" +
   "}\n" +
   "\n" +
   "<span class=\"hljs-function\"><span class=\"hljs-keyword\">void</span> <span class=\"hljs-title\">loop</span>()</span>{\n" +
   "  <span class=\"hljs-keyword\">if</span>(oldEncPos != encoderPos) {\n" +
   "    Serial.println(encoderPos);\n" +
   "    oldEncPos = encoderPos;\n" +
   "  }\n" +
   "}\n" +
   "\n" +
   "</pre><p><br></p><p><span style=\"color: rgb(51, 51, 51);\">That's it!</span></p>",
  project_id: p4.id,
)


Step.create(
  title: "Conclusion",
 body:
  "<p><span class=\"ql-size-large\">I hope you find this code useful for your next project which uses a rotary encoder or that it has inspired you to consider a rotary encoder as an input for your next project.</span></p><p><strong class=\"ql-size-large\">Summary of the Aims</strong></p><p><span class=\"ql-size-large\">I have tried to write some code which achieves a good balance of:</span></p><ul><li><span class=\"ql-size-large\">Portability (port manipulation code is the compromise when moving to other chips)</span></li><li><span class=\"ql-size-large\">Speed (port manipulation really helps)</span></li><li><span class=\"ql-size-large\">Low compiled code size (port manipulation and bitmath helps)</span></li><li><span class=\"ql-size-large\">Reliably records slow and fast manual rotation</span></li><li><span class=\"ql-size-large\">Reduced nugatory interrupt service routine calls (using RISING interrupt and temporarily disabling interrupts)</span></li></ul><p><strong class=\"ql-size-large\">Caveats and Ideas for Improvement</strong></p><p><span class=\"ql-size-large\">This code isn't perfect by any means and you might like to change it to use other pins. I tested this code with the sketch which was causing the most delay and least reliable readings with the other approaches discussed - I certainly haven't compared it with timers to see whose code produces fewer nugatory interrupt service routines, takes the least time to execute or filters out the highest percentage of contact bounces. Perhaps someone might like to do a benchmark test against the other approaches out there.</span></p>",
 project_id: p4.id,
)



p5 = Project.create(
  title: "How to Make a Wheel Encoder",
description:
 "<p><span class=\"ql-size-large\">I am designing a robot.</span></p><p><span class=\"ql-size-large\">I have chosen to use DC motors. So I needed encoders to control these motors.</span></p><p><span class=\"ql-size-large\">For doing so I designed an encoder and developed the associated software.</span></p><p><span class=\"ql-size-large\">The electronic is very simple and the software designed to be easy to used.</span></p>",
video_url: "https://www.youtube.com/embed/YaoZ_HXfDy4",
published: true,
author_id: u5.id,
)



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




p6 = Project.create(
  title: "Derivative of a Simple Function",
 description:
  "<p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-huge\">Derivatives are a very fundamental item in calculus. They give you the slope of a line. They can be really quite handy. Today in this tutorial, I will be demonstrating how to take the derivative of a simple function.</span></p>",
 video_url: "",
 published: true,
 author_id: u6.id,
)


Step.create(
  title: "Identify Different Terms of Function",
  body:
   "<p><span class=\"ql-size-large\">The function we will be using is</span> <span class=\"ql-size-large\"><span class=\"ql-formula\" data-value=\"f(x) = 3x^3 + 8x^2 - 2x + 3\"><U+FEFF><span contenteditable=\"false\"><span class=\"katex\"><span class=\"katex-mathml\"><math><semantics><mrow><mi>f</mi><mo>(</mo><mi>x</mi><mo>)</mo><mo>=</mo><mn>3</mn><msup><mi>x</mi><mn>3</mn></msup><mo>+</mo><mn>8</mn><msup><mi>x</mi><mn>2</mn></msup><mo>−</mo><mn>2</mn><mi>x</mi><mo>+</mo><mn>3</mn></mrow><annotation encoding=\"application/x-tex\">f(x) = 3x^3 + 8x^2 - 2x + 3</annotation></semantics></math></span><span class=\"katex-html\" aria-hidden=\"true\"><span class=\"strut\" style=\"height: 0.814108em;\"></span><span class=\"strut bottom\" style=\"height: 1.06411em; vertical-align: -0.25em;\"></span><span class=\"base\"><span class=\"mord mathit\" style=\"margin-right: 0.10764em;\">f</span><span class=\"mopen\">(</span><span class=\"mord mathit\">x</span><span class=\"mclose\">)</span><span class=\"mrel\">=</span><span class=\"mord mathrm\">3</span><span class=\"mord\"><span class=\"mord mathit\">x</span><span class=\"msupsub\"><span class=\"vlist-t\"><span class=\"vlist-r\"><span class=\"vlist\" style=\"height: 0.814108em;\"><span class=\"\" style=\"top: -3.063em; margin-right: 0.05em;\"><span class=\"pstrut\" style=\"height: 2.7em;\"></span><span class=\"sizing reset-size6 size3 mtight\"><span class=\"mord mathrm mtight\">3</span></span></span></span></span></span></span></span><span class=\"mbin\">+</span><span class=\"mord mathrm\">8</span><span class=\"mord\"><span class=\"mord mathit\">x</span><span class=\"msupsub\"><span class=\"vlist-t\"><span class=\"vlist-r\"><span class=\"vlist\" style=\"height: 0.814108em;\"><span class=\"\" style=\"top: -3.063em; margin-right: 0.05em;\"><span class=\"pstrut\" style=\"height: 2.7em;\"></span><span class=\"sizing reset-size6 size3 mtight\"><span class=\"mord mathrm mtight\">2</span></span></span></span></span></span></span></span><span class=\"mbin\">−</span><span class=\"mord mathrm\">2</span><span class=\"mord mathit\">x</span><span class=\"mbin\">+</span><span class=\"mord mathrm\">3</span></span></span></span></span><U+FEFF></span></span></p><p><span class=\"ql-size-large\">The terms of the function are the things before and after every operator. For example, the first term in our function is <span class=\"ql-formula\" data-value=\"3x^3\"><U+FEFF><span contenteditable=\"false\"><span class=\"katex\"><span class=\"katex-mathml\"><math><semantics><mrow><mn>3</mn><msup><mi>x</mi><mn>3</mn></msup></mrow><annotation encoding=\"application/x-tex\">3x^3</annotation></semantics></math></span><span class=\"katex-html\" aria-hidden=\"true\"><span class=\"strut\" style=\"height: 0.814108em;\"></span><span class=\"strut bottom\" style=\"height: 0.814108em; vertical-align: 0em;\"></span><span class=\"base\"><span class=\"mord mathrm\">3</span><span class=\"mord\"><span class=\"mord mathit\">x</span><span class=\"msupsub\"><span class=\"vlist-t\"><span class=\"vlist-r\"><span class=\"vlist\" style=\"height: 0.814108em;\"><span class=\"\" style=\"top: -3.063em; margin-right: 0.05em;\"><span class=\"pstrut\" style=\"height: 2.7em;\"></span><span class=\"sizing reset-size6 size3 mtight\"><span class=\"mord mathrm mtight\">3</span></span></span></span></span></span></span></span></span></span></span></span><U+FEFF></span> . The last term is 3. Make sure you identify and separate these for later.</span></p>",
  project_id: p6.id,
)


Step.create(
  title: "Identify Exponent and Coefficient of Each Term",
  body:
   "<p><span class=\"ql-size-large\">The exponent of each term is the superscript number. In this case, the exponent for our first term is 3. The exponent for our second to last term is 1 (if there isn't an exponent on a variable, then the exponent is just 1). Exponents on numbers don't count because you can simplify it. I would recommend doing so for any other derive problems you are given.</span></p><p><span class=\"ql-size-large\">The coefficient of a term is defined quite literally as the number that comes directly before the variable. For example, the coefficient for our second term is 8. The coefficient of our second to last term is -2 (if you have a function like <span class=\"ql-formula\" data-value=\"f(x) = x - 2\"><U+FEFF><span contenteditable=\"false\"><span class=\"katex\"><span class=\"katex-mathml\"><math><semantics><mrow><mi>f</mi><mo>(</mo><mi>x</mi><mo>)</mo><mo>=</mo><mi>x</mi><mo>−</mo><mn>2</mn></mrow><annotation encoding=\"application/x-tex\">f(x) = x - 2</annotation></semantics></math></span><span class=\"katex-html\" aria-hidden=\"true\"><span class=\"strut\" style=\"height: 0.75em;\"></span><span class=\"strut bottom\" style=\"height: 1em; vertical-align: -0.25em;\"></span><span class=\"base\"><span class=\"mord mathit\" style=\"margin-right: 0.10764em;\">f</span><span class=\"mopen\">(</span><span class=\"mord mathit\">x</span><span class=\"mclose\">)</span><span class=\"mrel\">=</span><span class=\"mord mathit\">x</span><span class=\"mbin\">−</span><span class=\"mord mathrm\">2</span></span></span></span></span><U+FEFF></span> , the second term would be -2 because there is a negative in front of it. This applies to everything).</span></p>",
  project_id: p6.id,
)



Step.create(
  title: "Math It Up",
  body:
   "<p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">The formula for calculating derivatives goes as follows: <span class=\"ql-formula\" data-value=\"a*cx^a-1\"><U+FEFF><span contenteditable=\"false\"><span class=\"katex\"><span class=\"katex-mathml\"><math><semantics><mrow><mi>a</mi><mo>∗</mo><mi>c</mi><msup><mi>x</mi><mi>a</mi></msup><mo>−</mo><mn>1</mn></mrow><annotation encoding=\"application/x-tex\">a*cx^a-1</annotation></semantics></math></span><span class=\"katex-html\" aria-hidden=\"true\"><span class=\"strut\" style=\"height: 0.664392em;\"></span><span class=\"strut bottom\" style=\"height: 0.747722em; vertical-align: -0.08333em;\"></span><span class=\"base\"><span class=\"mord mathit\">a</span><span class=\"mbin\">∗</span><span class=\"mord mathit\">c</span><span class=\"mord\"><span class=\"mord mathit\">x</span><span class=\"msupsub\"><span class=\"vlist-t\"><span class=\"vlist-r\"><span class=\"vlist\" style=\"height: 0.664392em;\"><span class=\"\" style=\"top: -3.063em; margin-right: 0.05em;\"><span class=\"pstrut\" style=\"height: 2.7em;\"></span><span class=\"sizing reset-size6 size3 mtight\"><span class=\"mord mathit mtight\">a</span></span></span></span></span></span></span></span><span class=\"mbin\">−</span><span class=\"mord mathrm\">1</span></span></span></span></span><U+FEFF></span>  this is better shown in the first image above. So what we need to do for each term is multiply the coefficient by the exponent. Then subtract one from the exponent. Repeat this for each term. Just so you don't get confused, the variable in the third term of the original function should lose it's variable after taking the derivative. The last image explains why. After finishing each term, put them together in another function. And then you're done! If you did this correctly, you should have ended up with </span><span class=\"ql-size-large\"><span class=\"ql-formula\" data-value=\"f'(x) = 9x^2 + 16x - 2\"><U+FEFF><span contenteditable=\"false\"><span class=\"katex\"><span class=\"katex-mathml\"><math><semantics><mrow><msup><mi>f</mi><mo mathvariant=\"normal\">′</mo></msup><mo>(</mo><mi>x</mi><mo>)</mo><mo>=</mo><mn>9</mn><msup><mi>x</mi><mn>2</mn></msup><mo>+</mo><mn>1</mn><mn>6</mn><mi>x</mi><mo>−</mo><mn>2</mn></mrow><annotation encoding=\"application/x-tex\">f'(x) = 9x^2 + 16x - 2</annotation></semantics></math></span><span class=\"katex-html\" aria-hidden=\"true\"><span class=\"strut\" style=\"height: 0.814108em;\"></span><span class=\"strut bottom\" style=\"height: 1.06411em; vertical-align: -0.25em;\"></span><span class=\"base\"><span class=\"mord\"><span class=\"mord mathit\" style=\"margin-right: 0.10764em;\">f</span><span class=\"msupsub\"><span class=\"vlist-t\"><span class=\"vlist-r\"><span class=\"vlist\" style=\"height: 0.751892em;\"><span class=\"\" style=\"top: -3.063em; margin-right: 0.05em;\"><span class=\"pstrut\" style=\"height: 2.7em;\"></span><span class=\"sizing reset-size6 size3 mtight\"><span class=\"mord mtight\"><span class=\"mord mathrm mtight\">′</span></span></span></span></span></span></span></span></span><span class=\"mopen\">(</span><span class=\"mord mathit\">x</span><span class=\"mclose\">)</span><span class=\"mrel\">=</span><span class=\"mord mathrm\">9</span><span class=\"mord\"><span class=\"mord mathit\">x</span><span class=\"msupsub\"><span class=\"vlist-t\"><span class=\"vlist-r\"><span class=\"vlist\" style=\"height: 0.814108em;\"><span class=\"\" style=\"top: -3.063em; margin-right: 0.05em;\"><span class=\"pstrut\" style=\"height: 2.7em;\"></span><span class=\"sizing reset-size6 size3 mtight\"><span class=\"mord mathrm mtight\">2</span></span></span></span></span></span></span></span><span class=\"mbin\">+</span><span class=\"mord mathrm\">1</span><span class=\"mord mathrm\">6</span><span class=\"mord mathit\">x</span><span class=\"mbin\">−</span><span class=\"mord mathrm\">2</span></span></span></span></span><U+FEFF></span> </span></p>",
  project_id: p6.id,
)
