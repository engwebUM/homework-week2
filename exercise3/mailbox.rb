class Email
  attr_accessor :subject
  attr_accessor :date
  attr_accessor :from

  def initialize(subject,headers)
    @subject=subject
    @date=headers[:date]
    @from=headers[:from]
  end
end

class Mailbox
  attr_accessor :name
	attr_accessor :emails

  def initialize(name,emails)
  	@name=name
  	@emails=emails
  ende
end

class MailboxTextFormatter
  

  def format 
	#code of format goes here
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