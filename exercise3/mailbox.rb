class Email
	def initialize(subject, headers)
		@subject=subject
		@date=headers[:date]
		@from=headers[:from]
	end	
	attr_reader :date, :from, :subject
end

class Mailbox
	def initialize(name, emails)
		@name=name
		@emails=emails
	end
	attr_reader :name, :emails
end

class MailboxTextFormatter
	
	def initialize(mailbox)
		@mailbox = mailbox
	end

  def dateSize
    minSize = 0
    for email in @mailbox.emails
      if email.date.length > minSize
        minSize=email.date.length
      end
    end
    return minSize
  end
  
  def fromSize
    minSize = 0
    for email in @mailbox.emails
      if email.from.length > minSize
        minSize=email.from.length
      end
    end
    return minSize
  end
  
  def subjectSize
    minSize = 0
    for email in @mailbox.emails
      if email.subject.length > minSize
        minSize=email.subject.length
      end
    end
    return minSize
  end
  
  
	def format
    dateLength = dateSize
    fromLength = fromSize
    subjectLength = subjectSize
		
		
		
		puts "Mailbox: "+mailbox.name
		puts
		
    puts "+-"+"-"*dateLength+"-+-"+"-"*fromLength+"-+-"+"-"*subjectLength+"-+"
    puts "| "+"Date"+" "*(dateLength-4)+" | "+"From"+" "*(fromLength-4)+" | "+"Subject"+" "*(subjectLength-7)+" |"
		puts "+-"+"-"*dateLength+"-+-"+"-"*fromLength+"-+-"+"-"*subjectLength+"-+"
		
    
    
    mailbox.emails.each do |email|
      puts "| "+email.date+" "*(dateLength-email.date.length)+" | "+email.from+" "*(fromLength-email.from.length)+" | "+email.subject+" "*(subjectLength-email.subject.length)+" |"
		end
		puts "+-"+"-"*dateLength+"-+-"+"-"*fromLength+"-+-"+"-"*subjectLength+"-+"
	end
	
  attr_reader :mailbox, :from, :subject
end


emails = [
  Email.new("Re: Homework this week", { :date => "2014-12-01", :from => "Ferdous" }),
	Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Dajana" }),
	Email.new("Re: Homework", { :date => "2014-12-02", :from => "Ariane" })
]
mailbox = Mailbox.new("Ruby Study Group", emails)
formatter = MailboxTextFormatter.new(mailbox)

puts formatter.format