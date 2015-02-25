class Email
	def initialize(subject,headers)
		@subject = subject
		@headers = headers
	end
	
	def subject
		@subject
	end
	
	def headers
		@headers
	end
end

email = Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Ferdous" })

puts "Date:    #{email.headers[:date]}"
puts "From:    #{email.headers[:from]}"
puts "Subject: #{email.subject}"
