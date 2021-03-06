u6 = User.create(username: 'CSLewis', email: 'cslewis@example.com', password: '123456')
u6.image = File.new("#{Rails.root}/app/assets/images/lewis2.jpg")
u6.save

# user_ids = []
# User.all.map do |u|
#   user_ids.push(u.id) if u6.id != u.id
# end
#
# u6.follower_ids = user_ids
# u6.save


p6 = Project.create(
  title: "Derivative of a Simple Function",
 description:
  "<p><br></p><p><span style=\"color: rgb(51, 51, 51);\" class=\"ql-size-huge\">Derivatives are a very fundamental item in calculus. They give you the slope of a line. They can be really quite handy. Today in this tutorial, I will be demonstrating how to take the derivative of a simple function.</span></p>",
 video_url: "",
 published: true,
 author_id: u6.id,
)


p6.tag_ids = [2]
p6.save



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
