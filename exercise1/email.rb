class Email
   attr_reader :subject, :date, :from

	def initialize(subject, date, from)
   	@subject, @date, @from = subject, date, from
	end
end

email = Email.new("of your interest", "2015-02-27", "A guy")

puts "Date:    #{email.date}"
puts "From:    #{email.from}"
puts "Subject: #{email.subject}"