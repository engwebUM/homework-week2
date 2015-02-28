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
  # How to add more columns:
  #   -in the initialize method, update @column_lengths
  #   -in the format method, add the new email field
  def initialize(mailbox)
    @mailbox = mailbox
    @column_lengths = {
      "Date" => max_column_length((@mailbox.emails.map { |e| e.date }).push("Date")),
      "From" => max_column_length((@mailbox.emails.map { |e| e.from }).push("From")),
      "Subject" => max_column_length((@mailbox.emails.map { |e| e.subject }).push("Subject"))
    }
  end

  def format
    puts "Mailbox: #{@mailbox.name}"
    puts

    print_row_separator
    print_row(@column_lengths.keys)
    print_row_separator

    @mailbox.emails.each { |e| print_row([e.date, e.from, e.subject]) }

    print_row_separator
  end

  private

  def max_column_length(column)
    (column.max_by { |w| w.length }).length
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