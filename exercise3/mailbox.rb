class Email
	def initialize(subject, headers)
		@subject=subject
		@date=headers[:date]
		@from=headers[:from]
	end	
	attr_reader :date, :from, :subject
end

class Mailbox
	def initialize(name, emails)
		@name=name
		@emails=emails
	end
	attr_reader :name, :emails
end

class MailboxTextFormatter
	
	def initialize(mailbox)
		@mailbox = mailbox

	end

	def format()
		@from_offset = ""
		@subject_offset = ""
		@from = ""
		@subject = ""
		
		puts "Mailbox: "+mailbox.name
		puts
		
		puts "+------------+---------+------------------------+"
		puts "| Date       | From    | Subject                |"
		puts "+------------+---------+------------------------+"
		mailbox.emails.each do |email|
			
			@from = email.from
			@subject = email.subject
			
			if email.from.length < 9
				@from_offset = 7 - email.from.length
			else
				@from_offset = 0
				@from = @from[0, @from.length - (@from.length-4)]+"..."
			end
			
			
			if email.subject.length < 24
				@subject_offset = 22 - email.subject.length
			else
				@subject_offset = 0
				@subject = @subject[0, @subject.length - (@subject.length-19)]+"..."
			end
			
			puts "| "+email.date+" | "+@from+" "*@from_offset+" | "+@subject+" "*@subject_offset+" |"
		end
		puts "+------------+---------+------------------------+"
	end
	attr_reader :mailbox, :from
end


emails = [
	Email.new("Homework this week", { :date => "2014-12-01", :from => "Ferdous" }),
	Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Dajana" }),
	Email.new("Re: Homework this week", { :date => "2014-12-02", :from => "Ariane" })
]
mailbox = Mailbox.new("Ruby Study Group", emails)
formatter = MailboxTextFormatter.new(mailbox)

puts formatter.format