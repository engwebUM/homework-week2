class Email	
	def initialize(subject,headers)
		@subject = subject
		@headers = headers
	end
	
	def date
		@headers[:date]
	end

	def from
		@headers[:from]
	end
	
	def subject
		@subject
	end
end

class Mailbox
	def initialize(name, emails)
		@name = name
		@emails = emails
	end
	
	def name
		@name
	end
	
	def emails
		@emails
	end
end

class MailboxTextFormatter	
	def initialize(mailbox)
		@mailbox = mailbox
	end

	def format
		puts "Mailbox: #{mailbox.name}"
		puts
		puts "+------------+---------+------------------------+"
		puts "| Date       | From    | Subject                |"
		puts "+------------+---------+------------------------+"

		mailbox.emails.each do |email|
			puts "| #{email.date} | #{email.from}" + " "*(7-email.from.bytesize) +
				" | #{email.subject}" + " "*(22-email.subject.bytesize) + " |"
		end

		puts "+------------+---------+------------------------+"
	end
	
	def mailbox
		@mailbox
	end
end

emails = [
	Email.new("Homework this week", { :date => "2014-12-01", :from => "Ferdous" }),
	Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Dajana" }),
	Email.new("Re: Homework this week", { :date => "2014-12-02", :from => "Ariane" })
]
mailbox = Mailbox.new("Ruby Study Group", emails)
formatter = MailboxTextFormatter.new(mailbox)

puts formatter.format
