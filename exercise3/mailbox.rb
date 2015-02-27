class Email
    attr_accessor :subject, :date, :from

	def initialize(subject, options={})
   		@subject, @date, @from  = subject, options[:date], options[:from]
	end
end

class Mailbox
	attr_accessor :name

	def initialize(name, emails)
		@name, @emails = name, emails 
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