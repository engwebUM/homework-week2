#Use the mailbox.rb file. Fill in and complete the following class definitions:


class Email
  # your class from the last exercise
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
  # your class from the last exercise
  # fill in this class body
	attr_reader :emails
	attr_reader :name
	
	def initialize( name, emails)
		@name = name
		@emails = emails
	end
end

class MailboxTextFormatter
  # fill in this class body
	attr_reader :mailbox
  
	
		
	def initialize (mailbox)
		@mailbox = mailbox
	end	
	
	def format
		# precisamos de saber o tamanho máximo de cada tipo de dados de entrada
		# basta saber o tamanho máximo dos campos from e subject
		# max têm no minimo o tamanho dos nomes das colunas
		
		max_from = 20
		max_subject = 25
		espaco = ' '
		hifen = '-'
		
		puts "Mailbox: #{mailbox.name}"	
		puts "+#{hifen*12}+-#{hifen * max_from}-+-#{hifen * max_subject}-+"
		puts "| Data #{espaco*6}| From#{espaco*(max_from - 4)} | Subject#{espaco*(max_subject - 7)} |"
		puts "+#{hifen*12}+-#{hifen * max_from}-+-#{hifen * max_subject}-+"
		mailbox.emails.each do |email|	
			puts "| #{email.date} | #{email.from}#{espaco*(max_from-(email.from.length))} | #{email.subject}#{espaco*(max_subject-(email.subject.length))} |"
		end
		puts "+#{hifen*12}+-#{hifen * max_from}-+-#{hifen * max_subject}-+"
	end
	
	def def_max_from
	
	end
	
	def def_max_subject
	
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

# Your goal is to complete the code in a way so it outputs the following:

# Mailbox: Ruby Study Group

# +------------+---------+------------------------+
# | Date       | From    | Subject                |
# +------------+---------+------------------------+
# | 2014-12-01 | Ferdous | Homework this week     |
# | 2014-12-01 | Dajana  | Keep on coding! :)     |
# | 2014-12-02 | Ariane  | Re: Homework this week |
# +------------+---------+------------------------+
# You are allowed to add as many methods to the classes Email, Mailbox and 
# MailboxTextFormatter as you deem useful. In your final solution you are 
# not allowed to change any of the code outside (after) the class definitions. 
# For debugging purposes, you can, of course, change all the code you want.

# Try to come up with a working solution first. It does not matter how elegant, 
# generic, or pretty it is. Whatever produces the required output is fine for a 
# first solution. Then, later, look at your code, and try to improve it by cleaning 
# up everything that you do not like, or deem ugly.

# Eventually, one goal to aim for would be: Adding another column to the table only 
# requires minimal changes, e.g. changes to one or two places in your formatter class.