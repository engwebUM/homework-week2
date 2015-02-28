class Email
	attr_accessor :subject
	attr_accessor :date
	attr_accessor :from
  
  def initialize(subject,date,from)
  	@subject=subject
  	@date=date
  	@from=from
  end
end

email1 = Email.new("Homework this week", "2014-12-01", "Ferdous")
puts "Date:    #{email1.date}"
puts "From:    #{email1.from}"
puts "Subject: #{email1.subject}"
#------------------------------------------
email2 = Email.new("This is just another email for you to test", "2015-01-01", "Some guy")
puts "Date:    #{email2.date}"
puts "From:    #{email2.from}"
puts "Subject: #{email2.subject}"

#------------------------------------------
email3 = Email.new("This is just another email for you to test. You need to test in order to see if it is good enough", "1999-11-05", "That German Guy")
puts "Date:    #{email3.date}"
puts "From:    #{email3.from}"
puts "Subject: #{email3.subject}"