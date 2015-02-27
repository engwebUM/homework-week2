class Email

	attr_reader :subject, :date, :from

	def initialize(subject, hash={})
		@subject=subject
		@date=hash[:date]
		@from=hash[:from]
	end
end

class Mailbox

	attr_reader :emails

	def initialize(name, emails)
		@name=name
		@emails=emails
	end  
end


class MailboxTextFormatter
	
	attr_reader :mailbox, :maxDate, :maxFrom,  :maxSubject, :addToFrom, :addToSubject, :output
 	
 	def initialize(mailbox)
	  @mailbox=mailbox
    end


    def format
    	@output = "+" # variable to print a border
    	@maxDate = 0
        @maxFrom = 0
        @maxSubject = 0
        @addToFrom = 0
        @addToSubject = 0
        
        count_max # function to count a max of characters for each field
        output_line # function to make a border line
        
        puts output
       	puts "| "+"Date".center( "Date".length + maxDate-4)+" | "+"From".center( "From".length + maxFrom-4)+" | "+"Subject".center( "Subject".length + maxSubject-7)+" |"
       	puts output
       	
       	mailbox.emails.each do |email|
       	
       	 	@addToFrom = maxFrom - email.from.length # verify a number of spaces needed to add in each "from" entry
			@addToSubject = maxSubject - email.subject.length # verify a number of spaces needed to add in each "subject" entry
	     	puts "| #{email.date.center( email.date.length + 0)} | #{email.from.center(email.from.length + addToFrom)} | #{email.subject.center(email.subject.length + addToSubject )} |"
	    end 
	    puts output
    end


    def output_line 

    	for current_iteration_number in 1..maxDate+2 do	
    		output.concat("-") 
		end

		output.concat("+")

		for current_iteration_number in 1..maxFrom+2 do	
    		output.concat("-")
		end

		output.concat("+")

		for current_iteration_number in 1..maxSubject+2 do	
    		output.concat("-")
		end

		output.concat("+")
    end

  
    def count_max 

    	 mailbox.emails.each do |email| # counting the greatest number of characters for the each field
       		
       		if email.from.length  > maxFrom then
				@maxFrom = email.from.length
			end

			if email.subject.length  > maxSubject then
				@maxSubject = email.subject.length
			end

			if email.date.length  > maxDate then
				@maxDate = email.date.length
			end
	    end 
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