class Email
  attr_reader :date
  attr_reader :from
  attr_reader :subject

  def initialize(subject, headers)
    @date = headers[:date]
    @from = headers[:from]
    @subject = subject
  end
end

class Mailbox
  attr_reader :name
  attr_reader :emails

  def initialize(name, emails)
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
    hash = {} #Columns goes here
    hash["Date"]=mailbox.emails.max_by { |x| x.date.length }.date.length
    hash["From"]=mailbox.emails.max_by { |x| x.from.length }.from.length
    hash["Subject"]=mailbox.emails.max_by { |x| x.subject.length }.subject.length

    str = "Mailbox: #{mailbox.name}\n\n" + printTable(hash)
  end

  private

  def printTable(hash)
    str = printEdge(hash) + "\n" +
    printHeader(hash) + "\n" +
    printEdge(hash) + "\n" +
    printEmails(hash) +
    printEdge(hash)
  end

  def printEdge(hash)
    str = ""
    hash.each do |key, value|
      str += printEdgeColumn(value)
    end
    str += "+" #finish line
  end

  def printHeader(hash)
    str = ""
    hash.each do |key, value|
      str += printDataColumn(key, value)
    end
    str += "|" #finish line
  end

  def printEmails(hash)
    str = ""
    mailbox.emails.each do |email|
      str += printDataColumn(email.date, hash["Date"])
      str += printDataColumn(email.from, hash["From"])
      str += printDataColumn(email.subject, hash["Subject"])
      str += "|\n" #finish line
    end
    str += ""
  end

  def printEdgeColumn(value)
    str = "+-" + repeat("-", value) + "-"
  end

  def printDataColumn(key, value)
    str = "| #{key}" + repeat(" ", (value - key.length)) + " "
  end

  def repeat(text, n)
    str = text * n
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
