class Email
	def initialize (s = subject,h = headers)
		@subject = s
		@headers = h
	end

	def date
		headers[:date]
	end

	def from
		headers[:from]
	end

	def subject
		@subject
	end

	def headers
		@headers
	end
end
	
	#teste

	email = Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Ferdous" })

	puts "Date:    #{email.date}"
	puts "From:    #{email.from}"
	puts "Subject: #{email.subject}"

