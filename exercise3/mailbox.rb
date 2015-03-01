class Email
  attr_accessor :subject
  attr_accessor :date
  attr_accessor :from

  def initialize(subject,headers)
    @subject=subject
    @date=headers[:date]
    @from=headers[:from]
  end
end

class Mailbox
  attr_accessor :name
  attr_accessor :emails

  def initialize(name,emails)
  	@name=name
  	@emails=emails
  end
end

class MailboxTextFormatter
	attr_accessor :mailbox

	def initialize(mailbox)
		@mailbox=mailbox
	end

	def countBiggestDate
		date_size=4
		for email in @mailbox.emails
			if email.date.length>date_size
				date_size=email.date.length
			end
		end
		return date_size
	end

	def countBiggestFrom
		from_size=4
		for email in @mailbox.emails
			if email.from.length>from_size
				from_size=email.from.length
			end
		end
		return from_size
	end

	def countBiggestSubject
		subject_size=7
		for email in @mailbox.emails
			if email.subject.length>subject_size
				subject_size=email.subject.length
			end
		end
		return subject_size
	end

  def format 
  	date_size = countBiggestDate
  	subject_size = countBiggestSubject
  	from_size = countBiggestFrom
  	puts date_size
  	puts subject_size
  	puts from_size
  	tabela="Mailbox: #{mailbox.name}"
  	tabela.concat("\n\n") 
  	tabela.concat("+-"+"-"*date_size+"-+-"+"-"*from_size+"-+-"+"-"*subject_size+"-+")
  	tabela.concat("\n")
  	tabela.concat("| "+"Date"+(" "*(date_size-"Date".length))+" | "+"From"+(" "*(from_size-"From".length))+" | "+"Subject"+(" "*(subject_size-"Subject".length))+" |")
	tabela.concat("\n")
	tabela.concat("+-"+"-"*date_size+"-+-"+"-"*from_size+"-+-"+"-"*subject_size+"-+")
	tabela.concat("\n")
	for email in @mailbox.emails
		tabela.concat("| "+email.date+(" "*(date_size-email.date.length))+" | "+email.from+(" "*(from_size-email.from.length))+" | "+email.subject+(" "*(subject_size-email.subject.length))+" |")
	tabela.concat("\n")
	end
	tabela.concat("+-"+"-"*date_size+"-+-"+"-"*from_size+"-+-"+"-"*subject_size+"-+")
  	
  	return tabela
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