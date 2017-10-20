u10 = User.create(username: 'David Hume', email: 'davidhume@example.com', password: '123456')
u10.image = File.new("#{Rails.root}/app/assets/images/davidhume.jpg")
u10.save


# user_ids = []
# User.all.map do |u|
#   user_ids.push(u.id) if u10.id != u.id
# end
#
# u10.follower_ids = user_ids
# u10.save


p10 = Project.create(
  title: "Keyhole Router Bit Jig",
description:
 "<p><span class=\"ql-size-large\">One of the easiest ways to hang frames flat against the wall is using keyhole slots. They are easy to make with a keyhole router bit. The tricky part is making them all at the same distance from the top of the frame so your picture will be level. You can make a simple keyhole router bit jig that will not only help guide your router, but also make consistent keyholes every time.</span></p><p><span class=\"ql-size-large\">Watch the 2-minute video or read on!</span></p>",
video_url: "https://www.youtube.com/embed/-xXrmzGcO28",
published: true,
author_id: u10.id
)

p10.tag_ids = [5]
p10.save


Step.create(
  title: "What You'll Need",
  body:
   "<iframe class=\"ql-video\" frameborder=\"0\" allowfullscreen=\"true\" src=\"https://www.youtube.com/embed/-xXrmzGcO28?showinfo=0\"></iframe><p><br></p><p><br></p><p><span class=\"ql-size-large\">You'll need some basic tools and materials to make this keyhole router jig</span></p><ul><li><span class=\"ql-size-large\">Trim router&nbsp;</span><a href=\"http://amzn.to/2jmjkus\" target=\"_blank\" class=\"ql-size-large\" style=\"color: rgb(232, 108, 0);\">http://amzn.to/2jmjkus</a></li><li><span class=\"ql-size-large\">Keyhole bit&nbsp;</span><a href=\"http://amzn.to/2wz4oyY\" target=\"_blank\" class=\"ql-size-large\" style=\"color: rgb(232, 108, 0);\">http://amzn.to/2wz4oyY</a></li><li><span class=\"ql-size-large\">Countersink bit&nbsp;</span><a href=\"http://amzn.to/2xx8OWD\" target=\"_blank\" class=\"ql-size-large\" style=\"color: rgb(232, 108, 0);\">http://amzn.to/2xx8OWD</a></li><li><span class=\"ql-size-large\">1-1/2 x 3/4 poplar board&nbsp;</span><a href=\"http://amzn.to/2wDoiJt\" target=\"_blank\" class=\"ql-size-large\" style=\"color: rgb(232, 108, 0);\">http://amzn.to/2wDoiJt</a></li><li><span class=\"ql-size-large\">(8) 2-inch FH wood screws</span></li><li><span class=\"ql-size-large\">(3) 1-1/4 FH wood screws</span></li></ul>",
  project_id: p10.id
)



Step.create(
  title: "Measure & Cut",
  body:
   "<p><span class=\"ql-size-large\">I started by measuring the size of my router's base. My&nbsp;</span><a href=\"http://amzn.to/2jmjkus\" target=\"_blank\" style=\"color: rgb(232, 108, 0);\" class=\"ql-size-large\">RIDGID trim router</a><span class=\"ql-size-large\">'s base was 3-1/2 by 3-1/2.</span></p><p><span class=\"ql-size-large\">I decided to make my jig 3-1/2 x 4-1/2 so I would have a 1-inch span to slide the router back and forth to cut my keyhole slots.</span></p><p><span class=\"ql-size-large\">I bought some&nbsp;</span><a href=\"http://amzn.to/2wDoiJt\" target=\"_blank\" style=\"color: rgb(232, 108, 0);\" class=\"ql-size-large\">1-1/2 poplar</a><span class=\"ql-size-large\">&nbsp;to use for the frame and figured out I would need the following cuts:</span></p><ul><li><span class=\"ql-size-large\">(2) @ 3-1/2 (top and bottom piece)</span></li><li><span class=\"ql-size-large\">(3) @ 7-1/2 (both sides and an extra which will serve as a stop piece)</span></li></ul><p><br></p>",
  project_id: p10.id
)


Step.create(
  title: "Assemble the Frame",
  body:
   "<p><span class=\"ql-size-large\">Make pilot holes.&nbsp;</span><em class=\"ql-size-large\">Really, this is important</em><span class=\"ql-size-large\">. I first tried making this without pilot holes and I split my wood.</span></p><p><span class=\"ql-size-large\">I marked by boards and used a 1/8\" drill bit on the drill press to make the pilot holes. I also used a&nbsp;</span><a href=\"http://amzn.to/2xx8OWD\" target=\"_blank\" style=\"color: rgb(232, 108, 0);\" class=\"ql-size-large\">countersink bit</a><span class=\"ql-size-large\">&nbsp;so my screw heads would be flush.</span></p><p><span class=\"ql-size-large\">I used eight 2-inch flat head wood screws to assemble the 4 corners.</span></p>",
  project_id: p10.id
)


Step.create(
  title: "Add a Stop",
  body:
   "<iframe class=\"ql-video\" frameborder=\"0\" allowfullscreen=\"true\" src=\"https://www.youtube.com/embed/-xXrmzGcO28?showinfo=0\"></iframe><p><br></p><p><span class=\"ql-size-large\">The last step is to add a stop at the back.</span></p><p><span class=\"ql-size-large\">I again drilled countersunk pilot holes and applied some glue. I clamped the stop flush with the top of the frame and screwed it in using 1-1/4 flat head wood screws.</span></p><p><span class=\"ql-size-large\">This jig is truly so simple but makes keyholes so easy! Not only does it help guide your router, but more importantly it allows you to&nbsp;</span><strong class=\"ql-size-large\">make multiple keyholes at the exact same distance from the top</strong><span class=\"ql-size-large\">&nbsp;of your work piece, which means your frames will hang level every time.</span></p><p><strong class=\"ql-size-large\">Tip</strong><span class=\"ql-size-large\">:&nbsp;</span><em class=\"ql-size-large\">You don't need a plunge router</em><span class=\"ql-size-large\">&nbsp;with this jig. Simply press the router base against the bottom edge of the jig and push the router straight down into the work piece until your base sits flush on the surface. Then slide the router all the way up and back down again before pulling out the bit. Perfect keyholes every time.</span></p><p><span class=\"ql-size-large\">__________________________________________</span></p><p><span class=\"ql-size-large\">Check out my other recent Instructables:</span></p><ul><li><a href=\"https://www.instructables.com/id/The-Ultimate-Lumber-Storage-Cart/\" target=\"_blank\" style=\"color: rgb(232, 108, 0);\" class=\"ql-size-large\">The Ultimate Lumber Storage Cart</a></li><li><a href=\"https://www.instructables.com/id/Large-Concrete-Planter/\" target=\"_blank\" style=\"color: rgb(232, 108, 0);\" class=\"ql-size-large\">Large Concrete Planter</a></li><li><a href=\"https://www.instructables.com/id/Modern-Outdoor-Bench/\" target=\"_blank\" style=\"color: rgb(232, 108, 0);\" class=\"ql-size-large\">Modern Outdoor Bench Made From 2x4s</a></li></ul><p><span class=\"ql-size-large\">Or head over to&nbsp;</span><a href=\"http://www.diymontreal.com/projects/\" target=\"_blank\" style=\"color: rgb(232, 108, 0);\" class=\"ql-size-large\">diymontreal.com</a><span class=\"ql-size-large\">&nbsp;to see all my projects!</span></p>",
  project_id: p10.id
)
