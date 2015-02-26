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
  def initialize(mailbox)
    @mailbox = mailbox
  end

  def format
    puts "Mailbox: #{@mailbox.name}"
    puts
    max_widths = [
      [((@mailbox.emails.map { |e| e.date}).max_by { |d| d.length}).length, "Date".length].max,
      [((@mailbox.emails.map { |e| e.from}).max_by { |d| d.length}).length, "From".length].max,
      [((@mailbox.emails.map { |e| e.subject}).max_by { |d| d.length}).length, "Subject".length].max
    ]
    #prints the header
    print_row_separator(max_widths)
    print_row(["Date", "From", "Subject"], max_widths)
    print_row_separator(max_widths)
    #prints the rows
    @mailbox.emails.each { |email| print_row([email.date, email.from, email.subject], max_widths)}
    #prints bottom
    print_row_separator(max_widths)
  end

  private

  def print_row(row, columns_width)
    output = "|" 
    row.each_index { |i| output += " " + row[i] + " "*(columns_width[i] - row[i].length) + " |"}
    puts output
  end

  def print_row_separator(columns_width)
    output = "+"
    columns_width.each { |column| output += "-"*(column+2) + "+" }
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