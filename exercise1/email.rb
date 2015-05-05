class Email
	def initialize(subject, date, from)
		@subject=subject
		@date=date
		@from=from
	end	
	attr_reader :date, :from, :subject
end

email = Email.new("Homework this week", "2014-12-01", "Ferdous")

puts "Date:    #{email.date}"
puts "From:    #{email.from}"
puts "Subject: #{email.subject}"

