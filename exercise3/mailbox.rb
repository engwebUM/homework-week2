class Email
  attr_reader :date, :from, :subject

  def initialize(subject, headers)
    @subject, @date, @from = subject, headers[:date], headers[:from]
  end

  def print_email
    "| %s | %s | %s |\n" % [date, from.ljust(7), subject.ljust(22)]
  end
end

class Mailbox
  attr_reader :name, :emails

  def initialize(name, emails)
    @name, @emails = name, emails
  end

  def print_emails
    str = ""
    emails.each do |email|
      str << email.print_email
    end
    str
  end

  def print_header
    "| %s | %s | %s |\n" % ["Date".ljust(10), "From".ljust(7), "Subject".ljust(22)]
  end

  def print_name
    "Mailbox: #{name}\n\n"
  end

  def print_sep
    "+%s+%s+%s+\n" % ["".ljust(10+2,'-'), "".ljust(7+2,'-'), "".ljust(22+2,'-')]
  end
end

class MailboxTextFormatter
  attr_reader :mailbox

  def initialize(mailbox)
    @mailbox = mailbox
  end

  def format
    "#{mailbox.print_name}#{mailbox.print_sep}#{mailbox.print_header}#{mailbox.print_sep}#{mailbox.print_emails}#{mailbox.print_sep}"
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
