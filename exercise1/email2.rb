class Email
	attr_reader :subject
	attr_reader :headers
	
	def initialize(subject,headers)
		@subject = subject
		@headers = headers
	end

	def date
		headers[:date]
	end
	
	def from
		headers[:from]
	end
end

email = Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Ferdous" })

puts "Date:    #{email.date}"
puts "From:    #{email.from}"
puts "Subject: #{email.subject}"
