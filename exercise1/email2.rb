puts "Exercicio 1.2"

class Email
	 attr_reader :subject  
	 attr_reader :headers

	def initialize (s= subject,h = {date => "date", from => "from"})
		@subject = s
		@headers = h
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

