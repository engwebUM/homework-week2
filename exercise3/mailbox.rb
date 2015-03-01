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
		dateRow = 4 # initialize in 4 because string length of "date" (first value of header) is 4
		subjectRow = 4 # initialize in 4 because string length of "from" (second value of header) is 4
		fromRow = 7 # initialize in 7 because string length of "subject" (third value of header) is 7
		# calculate max length of each attribute value
		mailbox.emails.map do |email| 
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
		# return array with max dimension of each three attributes
		dimensionsTable = [dateRow, subjectRow, fromRow]
	end

	def format
		content = [] # variable that contains array that should be returned
		dimensionsColumns = getDimensionsTable(@mailbox) # array that contains width dimensions of cells (date, from and subject)
		dateRowDimension = dimensionsColumns[0] # value of width (size(int)) date cell 
		fromRowDimension = dimensionsColumns[2] # value of width (size(int)) from cell
		subjectRowDimension = dimensionsColumns[1] # value of width (size(int)) subject cell
		# format cells of table, is like a template
		formatCells = '| %-' + dateRowDimension.to_s + 's | %-' + fromRowDimension.to_s + 's | %-' + subjectRowDimension.to_s + 's |'
		# format separators of table, reuse the content of variable "formatCells", is like a template
		formatSeparator = formatCells.gsub('|', '+')
		# fill the template "formatSeparator" with "-" character, the number of times that the char is added, is equal of width cells (date, from and subject)
		separator = formatSeparator % ['-' * dateRowDimension, '-' * fromRowDimension, '-' * subjectRowDimension]
		# start append content that should be returned
		content << 'Mailbox: ' + @mailbox.name
		content << ''
		content << separator
		content << formatCells % ['Date', 'From', 'Subject']
		content << separator
		@mailbox.emails.map do |email| 
			# fill the template "formatCells" values (date, from, subject) of each email
			content << formatCells % [email.date, email.from, email.subject]
		end
		content << separator
		# return all content. The ruby return variable "content" because is the last called of method, not need write "return"
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