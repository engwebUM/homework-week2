class Email
	def initialize(subject, headers)
		@subject=subject
		@date=headers[:date]
		@from=headers[:from]
	end	
	attr_reader :date, :from, :subject
end

email = Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Ferdous" })

puts "Date:    #{email.date}"
puts "From:    #{email.from}"
puts "Subject: #{email.subject}"

