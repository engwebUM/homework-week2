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
    @columns = [:date, :from, :subject] # change this line to add, delete or reorder columns
    @columns_width = set_columns_width
  end

  def format
    s_name << s_separator << s_header << s_separator << s_emails << s_separator
  end

  def set_columns_width
    arr = columns.map{|item| item.length} # in case columns' titles are bigger or there are no emails
    mailbox.emails.each do |email|
      columns.each_with_index do |column, index|
        arr[index] = [arr[index], email.instance_variable_get("@#{column}").to_s.length].max
      end
    end
    arr
  end

  def s_emails
    str = ""
    mailbox.emails.each do |email|
      str << "|"
      columns.each_with_index do |column, index|
        str << " %s |" % [email.instance_variable_get("@#{column}").to_s.ljust(columns_width[index])]
      end
      str << "\n"
    end
    str
  end

  def s_header
    str = "|"
    columns.each_with_index do |column, index|
      str << " %s |" % [column.to_s.capitalize.ljust(columns_width[index])]
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
