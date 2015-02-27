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
  attr_reader :mailbox, :columns

  def initialize(mailbox)
    @mailbox = mailbox
    @columns = [:date, :from, :subject] # change this line to add, delete or reorder columns (use strings or symbols)
    @columns = set_columns_width # NOTE: from this point on, @columns becomes an hash with columns' names and widths like {col1: 10, colN: 21}
  end

  def format
    s_name << s_separator << s_header << s_separator << s_emails << s_separator
  end

  def set_columns_width
    hash = columns.map{|val| [val.to_s.downcase, val.length]}.to_h  # in case columns' titles are bigger or there are no emails
    mailbox.emails.each do |email|
      hash.update(hash){|key, value| [hash[key], email.instance_variable_get("@#{key}").to_s.length].max}
    end
    hash
  end

  def s_emails
    str = ""
    mailbox.emails.each do |email|
      str << "|"
      columns.keys.each do |key|
        str << " %s |" % [email.instance_variable_get("@#{key}").to_s.ljust(columns[key])]
      end
      str << "\n"
    end
    str
  end

  def s_header
    str = "|"
    columns.keys.each do |key|
      str << " %s |" % [key.to_s.capitalize.ljust(columns[key])]
    end
    str << "\n"
  end

  def s_name
    "Mailbox: #{mailbox.name}\n\n"
  end

  def s_separator
    str = "+"
    columns.keys.each do |key|
      str << "%s+" % ["".ljust(columns[key]+2, '-')] # +2 to cover initial and final spaces
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
