u3 = User.create(username: 'Plato', email: 'plato@example.com', password: '123456')
u3.image = File.new("#{Rails.root}/app/assets/images/plato.jpg")
u3.save

# user_ids = []
# User.all.map do |u|
#   user_ids.push(u.id) if u3.id != u.id
# end
#
# u3.follower_ids = user_ids
# u3.save


p3 = Project.create(
  title: "Morse Code by a PS\\2 Keyboard",
 description:
  "<p><span class=\"ql-size-huge\">Hi, all!</span></p><p><span class=\"ql-size-huge\">Today I' m trying to explain you my last project: \"The morse code generator by a PS\\2 keyboard\"</span></p><p><span class=\"ql-size-huge\">I' ve used an PS/2 keyboard to send input to my Arduino board and transform it in morse code that activate a speaker and a relay.</span></p><p><span class=\"ql-size-huge\">Components:</span></p><p><span class=\"ql-size-huge\">- PS\\2 keyboard</span></p><p><span class=\"ql-size-huge\">- Arduino Uno(or others)</span></p><p><span class=\"ql-size-huge\">- Wires</span></p><p><span class=\"ql-size-huge\">- 5V relay</span></p><p><span class=\"ql-size-huge\">- BC547 transistor</span></p><p><span class=\"ql-size-huge\">- Small speaker</span></p><p><span class=\"ql-size-huge\">- Recirculation Diode</span></p>",
 video_url: "",
 published: true,
 author_id: u3.id
)


ProjectTag.create(project_id: p3.id, tag_id: 1)



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
