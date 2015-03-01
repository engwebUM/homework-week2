class Email
    attr_accessor :subject, :date, :from

	def initialize(subject, options={})
   		@subject, @date, @from  = subject, options[:date], options[:from]
	end
end

class Mailbox
	attr_accessor :name

	def initialize(name, emails)
		@name, @emails = name, emails 
	end

	def emails
		@emails
	end
end

class MailboxTextFormatter
	def initialize(mailbox)
		@mailbox = mailbox
	end

	def getDimensionsTable(mailbox)
		dimensionsTable = {}
		dateRow = 0
		subjectRow = 0
		fromRow = 0
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
		stringT = ""
		dimensionsColumns = getDimensionsTable(@mailbox)
		dateRowDimension = dimensionsColumns[0]
		fromRowDimension = dimensionsColumns[2]
		subjectRowDimension = dimensionsColumns[1]
		totalWidthTable = dateRowDimension + fromRowDimension + subjectRowDimension + 10
		formatCells = '| %-' + dateRowDimension.to_s + 's | %-' + fromRowDimension.to_s + 's | %-' + subjectRowDimension.to_s + 's |'
		puts totalWidthTable.times.collect {'-'}.join()
		puts formatCells % ['Date', 'From', 'Subject']
		puts totalWidthTable.times.collect {'-'}.join()
		@mailbox.emails.map do |email| 
			puts formatCells % [email.date, email.from, email.subject]
		end
		puts totalWidthTable.times.collect {'-'}.join()

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