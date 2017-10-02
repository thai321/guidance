u7 = User.create(username: 'Thomas Aquinas', email: 'aquinas@example.com', password: '123456')
u7.image = File.new("#{Rails.root}/app/assets/images/aquinas.jpg")
u7.save


p7 = Project.create(
  title: "Fast Multiply Numbers Between 1-100",
 description:
  "<p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">First instructable, yay!&nbsp;</span></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">In this instructable, I will teach you an easy method I created for multiplying numbers between 1 and 100 with relative ease.&nbsp;</span></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">All I ask is that you have a decent understanding of math</span></p>",
 video_url: "",
 published: true,
 author_id: u7.id
)

p7.tag_ids = [2]
p7.save

Step.create(
  title: "Pick Two Numbers",
  body:
   "<p><span class=\"ql-size-large\">The first part of this trick requires two numbers. So, pick any two. The trick works a bit better when at least one number is 10 or more. So, for this instructable, I will choose 15 x 19.</span></p><p><br></p>",
  project_id: p7.id,
)

Step.create(
  title: "Dissect the Numbers",
  body:
   "<p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">We can break the equation 19 x 15 down into&nbsp;</span></p><p><br></p><p><span class=\"ql-size-large\" style=\"color: rgb(51, 51, 51);\">19 * (10 + ((1/2) 10))</span></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">or</span></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">15 x (20 - 1)</span></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">Now the first one might seem a little harder, but it's really not. If you have a five in the equation, you can simply multiply a number by 10 (which is simple, just add a 0 at the end), and then take half of it. </span></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">So 19 x 5 = half of 19 x 10.</span></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">That means that 19 x 5 = (1/2) 190</span></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">But for now, let's just stick with the second equation because it is simpler.</span></p>",
  project_id: p7.id,
)


Step.create(
  title: "Multiply Out",
 body:
  "<p><span class=\"ql-size-large\">Okay, so we have 15 x (20 - 1)&nbsp;</span></p><p><br></p><p><span class=\"ql-size-large\">The distributive property states that we can distribute the 15 to the other numbers, meaning we have (15 x 20) - (15 x 1)&nbsp;</span></p><p><br></p><p><span class=\"ql-size-large\">I am sorry for these really short pages, btw.</span></p><h2><br></h2><p><br></p>",
 project_id: p7.id,
)


Step.create(
  title: "Do Some More Simple Math",
  body:
   "<p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">15 x 20 is the same as doubling 15 x 10.</span></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">Since multiplication has the commutative property, it doesn't matter what order we multiply the numbers in. 15 x 10 x 2 is exactly the same as 10 x 2 x 15, and 2 x 15 x 10, using that rule, we can find that:&nbsp;</span></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">2 x (15 x 10) = 2 x 150 = 300</span></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">and since we still have to subtract 15 x 1 (which equals 15), we just subtract 15 from 300, giving us 285</span></p>",
  project_id: p7.id,
)

Step.create(
  title: "Let's Try Another Problem",
  body:
   "<p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">Say we have 51 x 42.</span></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">The larger the number, the more complex the math gets, but it's still well within the abilities of a human mind.</span></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">Your best bet for this problem is to go with 51 x (40 + 2)</span></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">51 x 40 is the same as 51 x 10 x 4</span></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">51 x 10 = 510, then multiply that by 4, which gives you 2040</span></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">we have one final step, which is to add 51 x 2, which equals 102.</span></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">This means, 2040 + 102 = 2142</span></p>",
  project_id: p7.id,
)


Step.create(
  title: "Numbers Close to 100",
 body:
  "<p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">What if we have 99 x 99. It would be rather inefficient to try to multiply a number all the way up to 99.</span></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">So instead of doing the normal method of multiplying by 10, and then multiplying up to higher numbers, we can just multiply by 100.</span></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">99 x 99 = 99 x (100 - 1)</span></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">99 x 100 = 9900, and 99 x 1 = 99, so subtract the two, giving you&nbsp;</span></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">9900 - 99 = 9801</span></p>",
 project_id: p7.id,
)


Step.create(
  title: "Practice Practice Practice",
 body:
  "<p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">Don't expect to be doing ridiculously fast mental math on day 1, just practice when you get a chance. If your at the grocery and want to find out how much 5 of the same item would cost, give it a try. Or if you see the score of a sports game, you can also give it a try.&nbsp;</span></p><p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-large\">Hope this helps you all!</span></p>",
 project_id: p7.id,
)
