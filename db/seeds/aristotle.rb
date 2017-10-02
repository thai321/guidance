u1 = User.create(username: 'Aristotle', email: 'aristotle@example.com', password: '123456')
u1.image = File.new("#{Rails.root}/app/assets/images/aristotle.jpg")
u1.save

# user_ids = []
# User.all.map do |u|
#   user_ids.push(u.id) if u1.id != u.id
# end
#
# u1.follower_ids = user_ids
# u1.save


p1 = Project.create(
  title: "LED Morse Code Encoder",
  description:
   "<p><span class=\"ql-size-huge\">Morse code is a old method of communication wherein text information is transmitted as a series of on-off tones, lights, or clicks which represent specific characters.</span></p><p><span class=\"ql-size-huge\">In this project, we will create a program and device, that takes text as an input serially, then relays this message to the Arduino, where the LED will light up to the morse code equivalent of the text message.</span></p>",
  video_url: "",
  author_id: u1.id,
  published: true
)

ProjectTag.create(project_id: p1.id, tag_id: 1)

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
