u2 = User.create(username: 'Galileo', email: 'galileo@example.com', password: '123456')
u2.image = File.new("#{Rails.root}/app/assets/images/galileo.jpg")
u2.save


# user_ids = []
# User.all.map do |u|
#   user_ids.push(u.id) if u2.id != u.id
# end
#
# u2.follower_ids = user_ids
# u2.save


p2 = Project.create(
  title: "The Morse Translator With Arduino ",
description:
 "<p><span class=\"ql-size-huge\">What it does:</span></p><p><span class=\"ql-size-huge\">It translates your morse code into English words!</span></p><p><span class=\"ql-size-huge\">With this Morse Translator you can improve your morsing skills. Imagen,if the zombie apocalypse will happen, this will be the only way to communicate. Start practicing now!!</span></p><p><span class=\"ql-size-huge\">... or just have fun morsing ;)</span></p><p><strong class=\"ql-size-huge\">About the morse code:</strong></p><p><span class=\"ql-size-huge\">Characters in morse code consist of a series of dots (short beeps) and dashes (long beeps).&nbsp;</span></p><p><span class=\"ql-size-huge\">The duration of a dot is the basic unit of time.</span></p><p><span class=\"ql-size-huge\">To begin with, the variable is set to a value of 1000 ms, which is good if you're just starting to learn morse code. The following rules hold: The duration of a dash is three times the duration of a dot (default 1000ms) The gap between dashes and dots within a character is the duration of a dot.The gap between characters is three times the duration of a dot (i.e., the duration of a dash)The gap between words is seven times the duration of a dot.</span></p><p><strong class=\"ql-size-huge\">Components</strong></p><ul><li><span class=\"ql-size-huge\">1x Arduino Uno</span></li><li><span class=\"ql-size-huge\">1x Breadboard</span></li><li><span class=\"ql-size-huge\">1x Potentiometer 10k Ω</span></li><li><span class=\"ql-size-huge\">1x Button</span></li><li><span class=\"ql-size-huge\">1x Speaker (Piezo Buzzer)</span></li><li><span class=\"ql-size-huge\">1x LCD (Hitachi HD44780 compatible)</span></li><li><span class=\"ql-size-huge\">1x Resistor 220 Ω</span></li><li><span class=\"ql-size-huge\">M-M / M-F Jumper cables</span></li></ul><p><br></p>",
video_url: "https://www.youtube.com/embed/NQn-DLBpyJ0",
author_id: u2.id,
published: true,
)


ProjectTag.create(project_id: p2.id, tag_id: 1)



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
