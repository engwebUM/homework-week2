class Email
    attr_reader :subject, :date, :from

	def initialize(subject, options={})
   		@subject, @date, @from  = subject, options[:date], options[:from]
	end
end

class Mailbox
	attr_reader :name

	def initialize(name, emails)
		@name, @emails = name, emails 
	end

	def emails
		@emails
	end
end

class MailboxTextFormatter
	attr_reader :mailbox

	def initialize(mailbox)
		@mailbox = mailbox
	end

	def getDimensionsTable(mailbox)
		dimensionsTable = {}
		dateRow = 4
		subjectRow = 4
		fromRow = 7
		@mailbox.emails.map do |email| 
			if email.date.size > dateRow
	 			dateRow = email.date.size
	 		end
	 		if email.subject.size > subjectRow
	 			subjectRow = email.subject.size
	 		end
	 		if email.from.size > fromRow
	 			fromRow = email.from.size
	 		end
		end
		@dimensionsTable = [dateRow, subjectRow, fromRow]
	end

	def format
		content = []
		dimensionsColumns = getDimensionsTable(@mailbox)
		dateRowDimension = dimensionsColumns[0]
		fromRowDimension = dimensionsColumns[2]
		subjectRowDimension = dimensionsColumns[1]
		totalWidthTable = dateRowDimension + fromRowDimension + subjectRowDimension + 8
		formatCells = '| %-' + dateRowDimension.to_s + 's | %-' + fromRowDimension.to_s + 's | %-' + subjectRowDimension.to_s + 's |'
		formatSeparator = formatCells.gsub('|', '+')
		separator = formatSeparator % ['-' * dateRowDimension, '-' * fromRowDimension, '-' * subjectRowDimension]
		content << 'Mailbox: ' + @mailbox.name
		content << ''
		content << separator
		content << formatCells % ['Date', 'From', 'Subject']
		content << separator
		@mailbox.emails.map do |email| 
			content << formatCells % [email.date, email.from, email.subject]
		end
		content << separator
		content << ''
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

addNewEmail = Email.new("Add a new email for test, bla, bla, bla", { :date => "2015-03-01", :from => "Sandro" })
formatter.mailbox.emails << addNewEmail

puts formatter.format