class Email
  attr_reader :subject
  attr_reader :date
  attr_reader :from

  def initialize(subject, headers)
    @subject = subject
    @date = headers[:date]
    @from = headers[:from]
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
  # To add more columns, just modify the initialize method:
  #   -add the proper call to add_column
  #   -add the new email field to @email_to_row
  def initialize(mailbox)
    @mailbox = mailbox

    @column_lengths = { }
    add_column("Date") { |e| e.date }
    add_column("From") { |e| e.from }
    add_column("Subject") { |e| e.subject }

    @email_to_row = lambda { |e| [e.date, e.from, e.subject] }
  end

  def format
    puts "Mailbox: #{@mailbox.name}"
    puts

    print_row_separator
    print_row(@column_lengths.keys)
    print_row_separator

    @mailbox.emails.each { |e| print_row(@email_to_row.call(e)) }

    print_row_separator
  end

  private

  def add_column(column_name)
    column = @mailbox.emails.map { |e| yield e }
    @column_lengths[column_name] = [column.max_by(&:length).length, column_name.length].max
  end

  def print_row(row)
    row.each_index { |i| row[i] = " " + row[i] + " "*(@column_lengths.values[i] - row[i].length + 1) }
    generic_print_row(row , "|")
  end

  def print_row_separator
    row = []
    @column_lengths.values.each { |cl| row.push("-" * (cl + 2)) }
    generic_print_row(row, "+")
  end

  def generic_print_row(row, column_separator)
    output = column_separator
    row.each { |c| output += c + column_separator }
    puts output
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