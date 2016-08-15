Skill Test.

The following is a solution to the skill test using Ruby as my language of choice. 
Install Ruby to run each challenge on the command line. 

Question 1: ruby question_1.rb
  For this challenge, I used an index tracker for the recursive formula. 
  This approach is suited for Ruby, but would not work for a concurrent language.
  An alternate solution would have been to pass an array as the accumulator,
  which would then feed into a printer function which would handle the conversion into xml.
  
Question 2: ruby question_2.rb
  For this challenge, I focused mainly on ensuring the string provided was made up of valid xml. 
  I tried to ensure that all cases of invalid tags would raise an error. An alternate approach 
  would have allowed users to enter any information within the tag, not only digits. 
  
Question 4: ruby question_4.rb
  In this challenge, I created a shape class that had multiple sub-classes, however, looking at
  the code, I see that there was room for improvement where shared properties such as the area
  and the perimeter should have been a part of the shape class. In an ideal case, I would have
  used a unit testing framework such as rSpec to run the tests. To run the test on the command 
  line run "ruby test/question_4_test.rb"
  
  Note: I have used the colorize gem for the tests for Question 4, be sure to install this before running the tests.
