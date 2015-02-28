class Email
  # your class from the last exercise
  	attr_reader :subject, :date, :from

	def initialize(subject, headers)
		@subject = subject
		@date = headers[:date]
		@from = headers[:from]
	end
end

class Mailbox
  # your class from the last exercise
  attr_reader :name, :emails

  def initialize(name, emails)
		@name = name
		@emails = emails
	end
end

class MailboxTextFormatter
	# fill in this class body
	def initialize(mailbox)
	@mailbox = mailbox
	@column_lengths = { }
	add_column("Date") { |a| a.date }
	add_column("From") { |a| a.from }
	add_column("Subject") { |a| a.subject }
	@email_to_row = lambda { |a| [a.date, a.from, a.subject] }
	end

	def format
	puts "Mailbox: #{@mailbox.name}"
	puts
	print_row_separator
	print_row(@column_lengths.keys)
	print_row_separator
	@mailbox.emails.each { |a| print_row(@email_to_row.call(a)) }
	print_row_separator
	end

	def add_column(column_name)
	column = @mailbox.emails.map { |a| yield a }
	@column_lengths[column_name] = [column.max_by(&:length).length, column_name.length].max
	end

	def print_row(row)
	row.each_index { |b| row[b] = " " + row[b] + " "*(@column_lengths.values[b] - row[b].length + 1) }
	generic_print_row(row , "|")
	end

	def print_row_separator
	row = []
	@column_lengths.values.each { |c| row.push("-" * (c + 2)) }
	generic_print_row(row, "+")
	end

	def generic_print_row(row, column_separator)
	output = column_separator
	row.each { |d| output += d + column_separator }
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