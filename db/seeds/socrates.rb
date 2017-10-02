u9 = User.create(username: 'Socrates', email: 'socrates@example.com', password: '123456')
u9.image = File.new("#{Rails.root}/app/assets/images/socrates.jpg")
u9.save


p9 = Project.create(
  title: "How to Make Music on GarageBand",
 description:
  "<p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">GarageBand’s software is made to be user-friendly for people that are beginning but also for people that want to get into a musical instrument like the piano (through extensions). The simplest way to make music on GarageBand is to use the already installed, the MIDI loops. These loops have a variety of music genres and instruments that can be overlapped and used to create different types of music tempos and types. The application for GarageBand is endless, you can do it for a presentation, video, a gift to a friend or family member and many other things</span></p>",
 video_url: "",
 published: true,
 author_id: u9.id,
)


p9.tag_ids = [4,5]
p9.save


Step.create(
  title: "Start",
  body:
   "<p><span class=\"ql-size-large\">GarageBand on the Mac can be searched through the spotlight located on the top right (this looks like a magnifying glass) click it and type in “GarageBand” press enter when GarageBand logo pops up. Once it up it will show different types of instruments with different titles on the bottom, click the one with a note sheet and with the title “empty project”, double-click.</span></p><p><span class=\"ql-size-large\">From this, a page will pull up with an electric keyboard, mic, etc. I would click the electric keyboard just for simplicity. If a keyboard piano pulls up just pull it over to the side or to the bottom because we won’t be needing it</span></p>",
  project_id: p9.id,

)



Step.create(
  title: "MIDI Loops",
  body:
   "<p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">If you look to the top right of the screen there is three symbols: a piece of paper and pen, a loop, and a media file with pictures, video, and music. Click the one that looks like a loop. A side screen pulls up and all these different types of instruments and music genres will be seen</span></p>",
  project_id: p9.id,
)


Step.create(
  title: "Creativity",
  body:
   "<p><span class=\"ql-size-large\">This is where you are allowed to do anything you want. All you have to do is choose what type of music you want to hear or the type of instruments. Once you click the type of instrument or genre you want a variety of music types will pop-up below these. You can go more into deep by pressing other instrument or genre depending on what you pressed first.</span></p><p><span class=\"ql-size-large\">You can preview the music by clicking the music file once. Once you find one music you want to add you can drag it into the screen to the left. From this, you can later overlap the music types or lay them next to each other.</span></p>",
  project_id: p9.id,
)


Step.create(
  title: "Tips to Making Better Music",
body:
 "<p><span class=\"ql-size-large\">GarageBand has made it so that each music has different instruments and tempo, but the MIDI files also have a name. if the names are the same like “ambitions…” than the music can be put together, almost always forming a better sound as a combination</span></p><p><span class=\"ql-size-large\">Don’t go overboard with the amount of sound going in at once. I would go with 1 to 4 instruments at once.</span></p>",
project_id: p9.id,
)



Step.create(
  title: "Export",
  body:
   "<p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">Once you’re happy with the music you have created you can now export. To export go to the very top bar that is a light gray, from this go to the title that says “share”, here you can export it to iTunes, mail, CD, etc.</span></p>",
  project_id: p9.id,
)
