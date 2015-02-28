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
  end

  def format
    maxlength_from    = 0
    maxlength_subject = 0

    # Get the higher length of From and Subject column
    @mailbox.emails.each do |email|
      if email.from.length > maxlength_from
        maxlength_from = email.from.length
      end

      if email.subject.length > maxlength_subject
        maxlength_subject = email.subject.length
      end
    end

    # print table
    puts "Mailbox:   #{@mailbox.name}"
    puts
    puts "+" + "-"*(LENGTH_DATE+2)  + "+" + "-"*(maxlength_from+2) + "+" + "-"*(maxlength_subject+2) + "+"
    puts "| " + ProcessSpaces("Date", LENGTH_DATE)+"| " + ProcessSpaces("From", maxlength_from) +"| " + ProcessSpaces("Subject", maxlength_subject) + "|"
    puts "+" + "-"*(LENGTH_DATE+2)  + "+" + "-"*(maxlength_from+2) + "+" + "-"*(maxlength_subject+2) + "+"

    # print all emails in Mailbox
    @mailbox.emails.each do |email|
      puts "| " + ProcessSpaces(email.date, LENGTH_DATE)+"| " + ProcessSpaces(email.from, maxlength_from) +"| " + ProcessSpaces(email.subject, maxlength_subject) + "|"
    end

    puts "+" + "-"*(LENGTH_DATE+2)  + "+" + "-"*(maxlength_from+2) + "+" + "-"*(maxlength_subject+2) + "+"
  end

  # add the missing spaces to fit the format of the table
  def ProcessSpaces (phrase,maxlength)
    for i in 0..maxlength-phrase.length
      phrase += " "
    end
    return phrase
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
