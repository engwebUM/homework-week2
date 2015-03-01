class Email
  attr_reader :subject, :date, :from

  def initialize(subject, headers)
    @subject = subject
    @date    = headers[:date]
    @from    = headers[:from]
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
    @mailBox = mailbox
    @maxLengthFrom    = 4 # assure the right format when from < 4
    @maxLengthSubject = 7 # assure the right format when subject < 7
  end

  # Get the higher length of From and Subject column
  def getHigherLength
    @mailBox.emails.each do |email|
      if email.from.length > @maxLengthFrom
        @maxLengthFrom = email.from.length
      end
      if email.subject.length > @maxLengthSubject
        @maxLengthSubject = email.subject.length
      end
    end
  end

  # Add the missing spaces to fit the format of the table
  def processSpacing (phrase,maxlength)
    phrase += " "*(maxlength-phrase.length+1)
  end

  # Horizontal Separator Line Printer
  def printSeparatorLine(maxLengthFrom, maxLengthSubject)
    line = "+" + "-"*(LENGTH_DATE+2) # +2 means a empty space after/before the bars
    line << "+" + "-"*(maxLengthFrom+2)
    line << "+" + "-"*(maxLengthSubject+2) + "+\n"
    return line
  end

  def format
    # Get the higher length of From and Subject column
    getHigherLength

    # Print Mailbox Name
    mailBoxContent = "Mailbox:   #{@mailBox.name}\n\n"
    mailBoxContent << printSeparatorLine(@maxLengthFrom, @maxLengthSubject)

    # Print Title Header
    mailBoxContent << "| " + processSpacing("Date", LENGTH_DATE)
    mailBoxContent << "| " + processSpacing("From", @maxLengthFrom)
    mailBoxContent << "| " + processSpacing("Subject", @maxLengthSubject) + "|\n"
    mailBoxContent << printSeparatorLine(@maxLengthFrom, @maxLengthSubject)

    # Print all emails in Mailbox
    @mailBox.emails.each do |email|
      mailBoxContent << "| " + processSpacing(email.date, LENGTH_DATE)
      mailBoxContent << "| " + processSpacing(email.from, @maxLengthFrom)
      mailBoxContent << "| " + processSpacing(email.subject, @maxLengthSubject) + "|\n"
    end
    mailBoxContent << printSeparatorLine(@maxLengthFrom, @maxLengthSubject)
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
