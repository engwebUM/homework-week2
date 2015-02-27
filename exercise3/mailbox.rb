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
    puts "Mailbox: #{mailbox.name}"
    puts

    hash = {} #Columns goes here
    hash["Date"]=mailbox.emails.max_by { |x| x.date.length }.date.length
    hash["From"]=mailbox.emails.max_by { |x| x.from.length }.from.length
    hash["Subject"]=mailbox.emails.max_by { |x| x.subject.length }.subject.length

    printTable(hash)
  end

  private

  def printTable(hash)
    printEdge(hash)
    puts
    printHeader(hash)
    puts
    printEdge(hash)
    puts
    printEmails(hash)
    printEdge(hash)
  end

  def printEdge(hash)
    hash.each do |key, value|
      printEdgeColumn(value)
    end
    print '+' #finish line
  end

  def printHeader(hash)
    hash.each do |key, value|
      printDataColumn(key, value)
    end
    print '|' #finish line
  end

  def printEmails(hash)
    mailbox.emails.each do |email|
      printDataColumn(email.date, hash["Date"])
      printDataColumn(email.from, hash["From"])
      printDataColumn(email.subject, hash["Subject"])
      print '|' #finish line
      puts
    end
  end

  def printEdgeColumn(value)
    print "+-"
    repeat('-', value)
    print '-'
  end

  def printDataColumn(key, value)
    print "| #{key}"
    repeat(' ', (value - key.length))
    print ' '
  end

  def repeat(text, n)
    print text * n
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
