class Email
  attr_reader :subject, :date, :from

  def initialize(subject, headers)
    @subject = subject
    @date = headers[:date]
    @from = headers[:from]

  end

end

class Mailbox
  attr_reader :name, :emails

  def initialize(name, emails)
    @name = name
    @emails = [:email]
    @emails = emails
  end
end


class MailboxTextFormatter
  attr_reader :mailbox

  def initialize(mailbox)
    @mailbox = mailbox
  end

def format
  puts "MailBox: #{mailbox.name}"
  array = Array[]
  array.push("+------------+----------+-------------------------------+");
  array.push("| Date       | From    \t| Subject\t\t\t|");
  array.push("+------------+----------+-------------------------------+");
  mailbox.emails.each do |email|
    array.push("| #{email.date} | #{email.from} \t| #{email.subject}\t\t|");
    array.push("+------------+----------+-------------------------------+")
  end
  return array
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
