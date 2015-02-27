class Email
  attr_reader :date, :from, :subject

  def initialize(subject, headers)
    @subject, @date, @from = subject, headers[:date], headers[:from]
  end

  def print_email
    "| %s | %s | %s |" % [date, from.ljust(7), subject.ljust(22)]
  end
end

class Mailbox
  attr_reader :name, :emails, :columns, :columns_width

  def initialize(name, emails)
    @name, @emails = name, emails
    @columns = ["Date", "From", "Subject"]
    @columns_width = [10, 7, 22]
  end

  def print_emails
    str = ""
    emails.each do |email|
      str << email.print_email << "\n"
    end
    str
  end

  def print_header
    str = "|"
    columns.each_with_index do |column, index|
      str << " %s |" % [column.to_s.ljust(columns_width[index])]
    end
    str << "\n"
  end

  def print_name
    "Mailbox: #{name}\n\n"
  end

  def print_sep
    str = "+"
    for index in 0 ... columns.size
      str << "%s+" % ["".ljust(columns_width[index]+2, '-')] # +2 to cover initial and final spaces
    end
    str << "\n"
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
