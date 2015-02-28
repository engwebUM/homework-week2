class Email

  attr_reader :subject, :date, :from

  def initialize(subject, headers)
    @subject = subject
    @date    = headers[:date].to_s
    @from    = headers[:from].to_s
  end
end

class Mailbox

  attr_reader :emails, :name

  def initialize(name, emails)
    @name   = name
    @emails = emails
  end
end

class MailboxTextFormatter

  LENGTH_DATE = 10 # date have always the same length

  def initialize(mailbox)
    @mailbox = mailbox
    @maxlength_from    = 0
    @maxlength_subject = 0
  end

  # Get the higher length of From and Subject column
  def getHigherLength
    @mailbox.emails.each do |email|
      if email.from.length > @maxlength_from
        @maxlength_from = email.from.length
      end

      if email.subject.length > @maxlength_subject
        @maxlength_subject = email.subject.length
      end
    end
  end

  # Add the missing spaces to fit the format of the table
  def processSpaces (phrase,maxlength)
    for i in 0..maxlength-phrase.length
      phrase += " "
    end
    return phrase
  end

  # Print Default Separator Line
  def printSeparatorLine(maxlength_from, maxlength_subject)
    print "+" + "-"*(LENGTH_DATE+2)
    print "+" + "-"*(maxlength_from+2)
    print "+" + "-"*(maxlength_subject+2) + "+\n"
  end

  def format
    # Get the higher length of From and Subject column
    getHigherLength

    # Print Mailbox Name
    puts "Mailbox:   #{@mailbox.name}\n\n"
    printSeparatorLine(@maxlength_from, @maxlength_subject)

    # Print Title Header
    print "| " + processSpaces("Date", LENGTH_DATE)
    print "| " + processSpaces("From", @maxlength_from)
    print "| " + processSpaces("Subject", @maxlength_subject) + "|\n"
    printSeparatorLine(@maxlength_from, @maxlength_subject)

    # Print all emails in Mailbox
    @mailbox.emails.each do |email|
      print "| " + processSpaces(email.date, LENGTH_DATE)
      print "| " + processSpaces(email.from, @maxlength_from)
      print "| " + processSpaces(email.subject, @maxlength_subject) + "|\n"
    end
    printSeparatorLine(@maxlength_from, @maxlength_subject)
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
