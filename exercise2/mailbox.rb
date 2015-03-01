# In a new file mailbox.rb write a class that has a name and emails attribute. 
# Make it so that the these attributes can be populated through the initialize method 
# (name being a string, and emails being an array of Email instances).

# The following code

class Email
  # fill in this class body
	def initialize( subject, headers )
		#variáveis de instancia
		@subject = subject
		@date = headers[:date]
		@from = headers[:from]
	end
	
	
	def date
		@date
	end
	
	def from
		@from
	end
	
	def subject
		@subject
	end	
	# ou:
	# attr_reader :date
	# attr_reader :from
	# attr_reader :subject
end


class Mailbox
  # fill in this class body
	
	attr_reader :emails
	
	def initialize( name, emails)
		@name = name
		@emails = emails
	end
	
end

emails = [
  Email.new("Homework this week", { :date => "2014-12-01", :from => "Ferdous" }),
  Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Dajana" }),
  Email.new("Re: Homework this week", { :date => "2014-12-02", :from => "Ariane" })
]

mailbox = Mailbox.new("Ruby Study Group", emails)

mailbox.emails.each do |email|
  puts "Date:    #{email.date}"
  puts "From:    #{email.from}"
  puts "Subject: #{email.subject}"
  puts
end




# should then output the following:

# Date:    2014-12-01
# From:    Ferdous
# Subject: Homework this week

# Date:    2014-12-01
# From:    Dajana
# Subject: Keep on coding! :)

# Date:    2014-12-02
# From:    Arianne
# Subject: Re: Homework this week