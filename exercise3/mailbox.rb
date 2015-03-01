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
  def processSpacing (phrase,maxlength)
    phrase += " "*(maxlength-phrase.length+1)
  end

  # Default Separator Line Printer
  def printSeparatorLine(maxlength_from, maxlength_subject)
    line = "+" + "-"*(LENGTH_DATE+2) # +2 means a empty space after/before the bars
    line << "+" + "-"*(maxlength_from+2)
    line << "+" + "-"*(maxlength_subject+2) + "+\n"
    return line
  end

  def format
    # Get the higher length of From and Subject column
    getHigherLength

    # Print Mailbox Name
    mailBoxContent = "Mailbox:   #{@mailbox.name}\n\n"
    mailBoxContent << printSeparatorLine(@maxlength_from, @maxlength_subject)

    # Print Title Header
    mailBoxContent << "| " + processSpacing("Date", LENGTH_DATE)
    mailBoxContent << "| " + processSpacing("From", @maxlength_from)
    mailBoxContent << "| " + processSpacing("Subject", @maxlength_subject) + "|\n"
    mailBoxContent << printSeparatorLine(@maxlength_from, @maxlength_subject)

    # Print all emails in Mailbox
    @mailbox.emails.each do |email|
      mailBoxContent << "| " + processSpacing(email.date, LENGTH_DATE)
      mailBoxContent << "| " + processSpacing(email.from, @maxlength_from)
      mailBoxContent << "| " + processSpacing(email.subject, @maxlength_subject) + "|\n"
    end
    mailBoxContent << printSeparatorLine(@maxlength_from, @maxlength_subject)
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
