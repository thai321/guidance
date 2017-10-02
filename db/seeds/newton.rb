u11 = User.create(username: 'Isaac Newton', email: 'isaacnewton@example.com', password: '123456')
u11.image = File.new("#{Rails.root}/app/assets/images/newton.jpg")
u11.save


# user_ids = []
# User.all.map do |u|
#   user_ids.push(u.id) if u11.id != u.id
# end
#
# u11.follower_ids = user_ids
# u11.save


p11 = Project.create(
  title: "How to Play Counting Stars on Piano",
description:
 "<p><strong class=\"ql-size-large\">Counting Stars - OneRepublic - Easy Piano Tutorial for Beginners.</strong></p><p><span class=\"ql-size-large\">Learn how to play your first song on piano: Beginners can learn this song in one hour. You will play with both hands but the left hand is very easy because the hand position stays the same as you play.</span></p><p><span class=\"ql-size-large\">Use the sustain pedal for this song. You can let it depressed all the time if you are a beginner. With more experience, you will hear that the sound is better when you release and depress the pedal just before you start a new serie of notes.</span></p><p><span class=\"ql-size-large\">I started learning piano a few months ago. Before I could play a piano song, I looked for easy songs to play on piano. Most of them are too difficult for beginners, and when they are not, they sound like \"kids songs\".</span></p><p><span class=\"ql-size-large\">It's why I share my own tutorials of easy piano songs I practiced. I think it can help beginners because the tutorials are easy but they sound really good on piano.</span></p><p><strong class=\"ql-size-large\">It is the secret for a successful learning: staying motivated because you can play easy piano songs quickly.</strong></p><p><span class=\"ql-size-large\">You can find more easy songs to play on piano and piano tutorials on my website:&nbsp;</span><a href=\"http://www.piano-tutorials.com/\" target=\"_blank\" style=\"color: rgb(232, 108, 0);\" class=\"ql-size-large\">www.piano-tutorials.com</a></p><p><br></p>",
video_url: "https://www.youtube.com/embed/27n5VBg3C18",
published: true,
author_id: u11.id,
)

p11.tag_ids = [4,5]
p11.save


Step.create(
  title: "Chorus",
body:
 "<p><span class=\"ql-size-large\">Find the Middle C. If you don't know what it is or you are not familiar with piano notes, go to my instructables&nbsp;</span><a href=\"https://www.instructables.com/id/How-to-play-piano-and-easy-piano-songs-for-beginne/\" target=\"_blank\" class=\"ql-size-large\" style=\"color: rgb(232, 108, 0);\">How to Play Piano and Easy Piano Songs for Beginners</a><span class=\"ql-size-large\">.</span></p><p><span class=\"ql-size-large\">The F# note (right hand) at the beginning of the song is in the octave of Middle C (third black key above middle C).</span></p><p><span class=\"ql-size-large\">The C# note (left hand) at the beginning of the song is in the octave below Middle C.</span></p><p><br></p><p><span class=\"ql-size-large\">Place your left-hand fingers this way for all the song:</span></p><p><span class=\"ql-size-large\">2:C# - 1:E - 3:B - 4:A</span></p><p><br></p><p><span class=\"ql-size-large\">Place your right-hand fingers this way:</span></p><p><span class=\"ql-size-large\">2:F# - 3:G# - 5:B - 2:F#</span></p><p><span class=\"ql-size-large\">2:F# - 3:G# - 2:F# - 1:E - 3:G#</span></p><p><span class=\"ql-size-large\">2:F# - 2:F# - 3:G# - 4:A - 3:G# - 2:F# - 1:E</span></p><p><br></p><p><span class=\"ql-size-large\">3:G# - 1:C# - 2:E</span></p><p><br></p><p><span class=\"ql-size-large\">1:C# - 2:F# - 3:G# - 5:B - 2:F#</span></p><p><br></p><p><span class=\"ql-size-large\">2:F# - 3:G# - 2:F# - 1:E - 3:G#</span></p><p><span class=\"ql-size-large\">2:F# - 2:F# - 3:G# - 4:A - 3:G# - 2:F# - 1:E</span></p><p><span class=\"ql-size-large\">3:G# - 2:F# - 2:F# - 1:E - 1:E</span></p><p><br></p><p><span class=\"ql-size-large\">1:C# - 3:G# - 2:F# - 2:F# - 1:E - 3:E - 1:C#</span></p><p><a href=\"https://www.youtube.com/watch?v=27n5VBg3C18#t=45s\" target=\"_blank\" class=\"ql-size-large\" style=\"color: rgb(232, 108, 0);\">Counting Stars - Piano Tutorial - Chorus</a></p>",
project_id: p11.id,
)


Step.create(
  title: "Instrumental Part",
 body:
  "<p><span class=\"ql-size-large\">Place your left-hand fingers this way for all the song:</span></p><p><span class=\"ql-size-large\">2:C# - 1:E - 3:B - 4:A</span></p><p><br></p><p><span class=\"ql-size-large\">Place your right-hand fingers this way:</span></p><p><span class=\"ql-size-large\">1:G# - 3:C#</span></p><p><span class=\"ql-size-large\">1:G# - 5:E</span></p><p><span class=\"ql-size-large\">1:F# - 4:B</span></p><p><span class=\"ql-size-large\">1:E - 4:A</span></p><p><br></p><p><span class=\"ql-size-large\">4:G# - 4:G# - 4:G# - 5:B - 4:G#</span></p><p><br></p><p><span class=\"ql-size-large\">3:F# - 3:F# - 3:F# - 5:B - 4:G#</span></p><p><span class=\"ql-size-large\">3:F# - 3:F# - 4:G#</span></p><p><br></p><p><a href=\"https://www.youtube.com/watch?v=27n5VBg3C18#t=1m48s\" target=\"_blank\" style=\"color: rgb(232, 108, 0);\" class=\"ql-size-large\">Counting Stars - Piano Tutorial - Instrumental Part</a></p><p><span class=\"ql-size-large\">You can find more easy songs to play on piano and piano tutorials on my website:</span></p><p><a href=\"http://www.piano-tutorials.com/\" target=\"_blank\" style=\"color: rgb(232, 108, 0);\" class=\"ql-size-large\">www.piano-tutorials.com</a></p>",
 project_id: p11.id,
)
