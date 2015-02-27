class Email
  attr_reader :date, :from, :subject

  def initialize(subject, headers)
    @subject, @date, @from = subject, headers[:date], headers[:from]
  end
end

class Mailbox
  attr_reader :name, :emails

  def initialize(name, emails)
    @name, @emails = name, emails
  end
end

class MailboxTextFormatter
  attr_reader :mailbox, :columns, :columns_width

  def initialize(mailbox)
    @mailbox = mailbox
    @columns = ["Date", "From", "Subject"]
    @columns_width = [10, 7, 22]
  end

  def format
    s_name << s_separator << s_header << s_separator << s_emails << s_separator
  end

  def s_emails
    str = ""
    mailbox.emails.each do |email|
      str << "| %s | %s | %s |" % [email.date, email.from.ljust(7), email.subject.ljust(22)] << "\n"
    end
    str
  end

  def s_header
    str = "|"
    columns.each_with_index do |column, index|
      str << " %s |" % [column.to_s.ljust(columns_width[index])]
    end
    str << "\n"
  end

  def s_name
    "Mailbox: #{mailbox.name}\n\n"
  end

  def s_separator
    str = "+"
    for index in 0 ... columns.size
      str << "%s+" % ["".ljust(columns_width[index]+2, '-')] # +2 to cover initial and final spaces
    end
    str << "\n"
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
