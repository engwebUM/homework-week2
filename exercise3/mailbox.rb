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
      "Date" => ["Date".length, max_column_length(@mailbox.emails.map { |e| e.date })].max,
      "From" => ["From".length, max_column_length(@mailbox.emails.map { |e| e.from })].max,
      "Subject" => ["Subject".length, max_column_length(@mailbox.emails.map { |e| e.subject })].max
    }
    @column_lengths.values.map! { |cl| cl + 2 } # adds room for surrounding white spaces
  end

  def format
    puts "Mailbox: #{@mailbox.name}"
    puts

    print_line
    print_row(@column_lengths.keys, "|")
    print_line

    @mailbox.emails.each { |e| print_row([e.date, e.from, e.subject], "|") }

    print_line
  end

  private

  def max_column_length(column)
    (column.max_by { |w| w.length }).length
  end

  def print_line
    row = []
    @column_lengths.values.each { |cl| row.push("-" * cl)}
    print_row(row, "+")
  end

  def print_row(row, separator)
    output = separator
    row.each_index { |i| output += " " + row[i] + " "*(@column_lengths.values[i] - row[i].length + 1) + separator }
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