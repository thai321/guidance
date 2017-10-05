u8 = User.create(username: 'Epicurus', email: 'epicurus@example.com', password: '123456')
u8.image = File.new("#{Rails.root}/app/assets/images/epicurus.jpg")
u8.save

# user_ids = []
# User.all.map do |u|
#   user_ids.push(u.id) if u8.id != u.id
# end
#
# u8.follower_ids = user_ids
# u8.save


p8 = Project.create(
  title: "Python Programming: Part 1 - Basics",
 description:
  "<p><span class=\"ql-size-large\">Python is a widely used general-purpose, high-level programming language. Its design philosophy emphasizes code readability, and its syntax allows programmers to express concepts in fewer lines of code than would be possible in languages such as C++ or Java. The language provides constructs intended to enable clear programs on both a small and large scale.</span></p><p><span class=\"ql-size-large\">Python supports multiple programming paradigms, including object-oriented, imperative and functional programming or procedural styles. It features a dynamic type system and automatic memory management and has a large and comprehensive standard library.</span></p>",
 video_url: "",
 published: true,
 author_id: u8.id,
)

p8.tag_ids = [2,3]
p8.save


Step.create(
  title: "Expressions and Operators",
  body:
   "<p><span class=\"ql-size-large\">An expression is a combination of values, variables, and operators. A value all by itself is considered an expression, and so is a variable.</span></p><pre class=\"ql-syntax\" spellcheck=\"false\"><span class=\"hljs-built_in\">print</span>(10 + 2)      <span class=\"hljs-comment\"># Addition = 12</span>\n<span class=\"hljs-built_in\">print</span>(10 + 2 - 6)  <span class=\"hljs-comment\"># Addition and Subtraction = 6</span>\n<span class=\"hljs-built_in\">print</span>(10 * 2)      <span class=\"hljs-comment\"># Multiplication = 20</span>\n<span class=\"hljs-built_in\">print</span>(10 * 2 / 2)  <span class=\"hljs-comment\"># Multiplication and Division = 10</span>\n<span class=\"hljs-built_in\">print</span>(10 * 2 + 6)  <span class=\"hljs-comment\"># Multiplication and Addition = 26</span>\n<span class=\"hljs-built_in\">print</span>(10 * (2 + 6))<span class=\"hljs-comment\"># Multiplication evaluates after Addition = 80</span>\n</pre><p><br></p><p><span class=\"ql-size-large\">Operators are special symbols that represent computations like addition and multiplication. The values the operator is applied to are called operands.</span></p><p><span class=\"ql-size-large\">Here is a list of Operators:</span></p><p><br></p><pre class=\"ql-syntax\" spellcheck=\"false\">-------------------------------------------------------------------------------\n|  Operator  |    |  What it does          |  Example                         | \n-------------------------------------------------------------------------------\n|     +      |    | Numerical Addition     |   print(10 + 2)                  |  \n|     -      |    | Numerical Subtraction  |   print(10 - 2)                  |  \n|     *      |    | Multiply By            |   print(10 * 2)                  |  \n|     /      |    | Divided by             |   print(10 / 2)                  |  \n------------------------------------------------------------------------------\n\n</pre>",
  project_id: p8.id,
)


Step.create(
  title: "Statements and Control Flow",
  body:
   "<h3><strong>Loops</strong></h3><p><span class=\"ql-size-large\">In Python, there are two kinds of loops, 'for' loops and 'while' loops.</span></p><p><br></p><p><strong class=\"ql-size-large\">For Loops</strong></p><p><span class=\"ql-size-large\">A&nbsp;</span><strong class=\"ql-size-large\">for</strong><span class=\"ql-size-large\">&nbsp;loop iterates over elements of a sequence (tuple or list). A variable is created to represent the object in the sequence. For example,</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">a = [100,200,300]\n<span class=\"hljs-keyword\">for</span> i <span class=\"hljs-keyword\">in</span> x:\n\t<span class=\"hljs-built_in\">print</span>(i)\n</pre><p><br></p><p><span class=\"ql-size-large\" style=\"color: rgb(51, 51, 51);\">This will output:</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">100\n200\n300\n</pre><p><br></p><p><br></p><p><span class=\"ql-size-large\">The&nbsp;</span><strong class=\"ql-size-large\">for&nbsp;</strong><span class=\"ql-size-large\">loop loops over each of the elements of a list or iterator, assigning the current element to the variable name given. In the example above, each of the elements in&nbsp;</span><strong class=\"ql-size-large\"><em>x</em></strong><span class=\"ql-size-large\">&nbsp;is assigned to&nbsp;</span><strong class=\"ql-size-large\"><em>i</em></strong><span class=\"ql-size-large\">.</span></p><p><span class=\"ql-size-large\">A built-in function called range exists to make creating sequential lists such as the one above easier. The loop above is equivalent to:</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">l = range(100,301,100)\n<span class=\"hljs-keyword\">for</span> i <span class=\"hljs-keyword\">in</span> l:\n\t<span class=\"hljs-built_in\">print</span>(i)\n\n</pre><p><br></p><p><span class=\"ql-size-large\">The next example uses a negative step (the third argument for the built-in range function):</span></p><pre class=\"ql-syntax\" spellcheck=\"false\"><span class=\"hljs-keyword\">for</span> i <span class=\"hljs-keyword\">in</span> range(5,0,-1):\n<span class=\"hljs-built_in\">print</span>(i)\n</pre><p><br></p><p><span class=\"ql-size-large\">This will output:</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">5\n4\n3\n2\n1\n</pre><p><br></p><p><span class=\"ql-size-large\">The negative step can be -2:</span></p><pre class=\"ql-syntax\" spellcheck=\"false\"><span class=\"hljs-keyword\">for</span> i <span class=\"hljs-keyword\">in</span> range(10,0,-2):\n\t<span class=\"hljs-built_in\">print</span>(i)\n</pre><p><br></p><p><span class=\"ql-size-large\">This will output:</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">10\n8\n6\n4\n2\n</pre><p><br></p><p><strong class=\"ql-size-large\">While Loops</strong></p><p><span class=\"ql-size-large\">A while loop repeats a sequence of statements until some condition becomes false. For example:</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">x = 5\n<span class=\"hljs-keyword\">while</span> x &gt; 0:\n\t<span class=\"hljs-built_in\">print</span>(x)\n\tx = x - 1\n</pre><p><br></p><p><span class=\"ql-size-large\">This will output:</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">5\n4\n3\n2\n1\n</pre><p><br></p><p><span class=\"ql-size-large\">Python's while loops can also have an 'else' clause, which is a block of statements that is executed (once) when the while statement evaluates to false. The break statement inside the while loop will not direct the program flow to the else clause. For example:</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">x = 5\ny = x\nwhile y &gt; 0:\n\tprint(y)\n\ty = y - 1\n<span class=\"hljs-section\">else:</span>\n\tprint(x)\n</pre><p><br></p><p><span class=\"ql-size-large\">This will output:</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">5\n4\n3\n2\n1\n5\n</pre><p><br></p><p><strong class=\"ql-size-large\">Breaking and continuing</strong></p><p><span class=\"ql-size-large\">Python includes statements to exit a loop (either a for loop or a while loop) prematurely. To exit a loop, use the break statement:</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">x = 5\n<span class=\"hljs-keyword\">while</span> x &gt; 0:\n\t<span class=\"hljs-built_in\">print</span>(x)\n\t<span class=\"hljs-built_in\">break</span>\n\tx-=1\n\t<span class=\"hljs-built_in\">print</span>(x)\n</pre><p><br></p><p><span class=\"ql-size-large\">This will output:</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">5\n</pre><p><br></p><p><span class=\"ql-size-large\">The statement to begin the next iteration of the loop without waiting for the end of the current loop is 'continue'.</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">l = [5,6,7]\n<span class=\"hljs-keyword\">for</span> x <span class=\"hljs-keyword\">in</span> l:\n\t<span class=\"hljs-built_in\">continue</span>\n\t<span class=\"hljs-built_in\">print</span>(x)\n</pre><p><br></p><p><span class=\"ql-size-large\">This will not produce any output, but this will:</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">l = [5,6,7]\n<span class=\"hljs-keyword\">for</span> x <span class=\"hljs-keyword\">in</span> l:\n\t<span class=\"hljs-built_in\">print</span>(x)\n</pre><p><br></p><p><br></p><p><strong class=\"ql-size-large\">If Statements</strong></p><p><br></p><p><span class=\"ql-size-large\">Here is a warm-up exercise - a short program to compute the absolute value of a number:</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">n = raw_input(<span class=\"hljs-string\">\"Type a Number: \"</span>) <span class=\"hljs-comment\">#Choose a number.</span>\nn = int(n) <span class=\"hljs-comment\">#Defines n as the integer you chose.</span>\nif n &lt; 0:\n\tprint(<span class=\"hljs-string\">\"The absolute value of \"</span>+n+<span class=\"hljs-string\">\" is \"</span>+-n)\n<span class=\"hljs-section\">else:</span>\n\tprint(<span class=\"hljs-string\">\"The absolute value of \"</span>+n+<span class=\"hljs-string\">\" is \"</span>+n)\n</pre><p><br></p><p><span class=\"ql-size-large\">Here is the output from the two times when I ran this program:</span></p><pre class=\"ql-syntax\" spellcheck=\"false\">Type a Number: <span class=\"hljs-number\">-34</span>\nThe absolute value <span class=\"hljs-keyword\">of</span> <span class=\"hljs-number\">-34</span> <span class=\"hljs-keyword\">is</span> <span class=\"hljs-number\">34</span>\n\nType a Number: <span class=\"hljs-number\">1</span>\nThe absolute value <span class=\"hljs-keyword\">of</span> <span class=\"hljs-number\">1</span> <span class=\"hljs-keyword\">is</span> <span class=\"hljs-number\">1</span>\n</pre><p><br></p><p><span class=\"ql-size-large\">First it prompts the user for a number with the statement \"n = raw_input(\"Integer? \")\". Next it reads the line \"if n &lt; 0:\". If n is less than zero Python runs the line \"print \"The absolute value of\",n,\"is\",-n\". Otherwise python runs the line \"print \"The absolute value of\",n,\"is\",n\".</span></p><p><br></p><p><span class=\"ql-size-large\">More formally, Python looks at whether the expression n &lt; 0 is true or false. An if statement is followed by an indented block of statements that are run when the expression is true. After the if statement is an optional else statement and another indented block of statements. This 2nd block of statements is run if the expression is false.</span></p><p><br></p><p><span class=\"ql-size-large\">Basic Syntax of an&nbsp;</span><strong class=\"ql-size-large\">if</strong><span class=\"ql-size-large\">&nbsp;statement:</span></p><pre class=\"ql-syntax\" spellcheck=\"false\"><span class=\"hljs-keyword\">if</span> <span class=\"hljs-keyword\">this</span> == that:\n\t<span class=\"hljs-keyword\">do</span> <span class=\"hljs-keyword\">this</span>...\n<span class=\"hljs-keyword\">else</span>:\n\t<span class=\"hljs-keyword\">do</span> that...\n</pre>",
  project_id: p8.id,
)