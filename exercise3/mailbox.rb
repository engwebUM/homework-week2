class Email
   attr_reader :subject  
   attr_reader :headers

  def initialize (subject,headers)
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

class Mailbox
	attr_reader :name
	attr_reader :emails

	def initialize(name,emails)
		@name = name
		@emails = emails
	end
end


class MailboxTextFormatter
  attr_reader :mailbox
  
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
      puts "| #{email.date} | #{email.from} | #{email.subject} |"
    end

    puts "+------------+---------+------------------------+"
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