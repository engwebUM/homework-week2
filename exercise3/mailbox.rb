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
		
		max_from = def_max_from (mailbox)
		max_subject = def_max_subject (mailbox)
		espaco = ' '
		hifen = '-'
		
		puts
		puts
		puts "Mailbox: #{mailbox.name}"	
		puts "+#{hifen * 12}+-#{hifen * max_from}-+-#{hifen * max_subject}-+"
		puts "| Data #{espaco*6}| From#{espaco*(max_from - 4)} | Subject#{espaco*(max_subject - 7)} |"
		puts "+#{hifen*12}+-#{hifen * max_from}-+-#{hifen * max_subject}-+"
		mailbox.emails.each do |email|	
			puts "| #{email.date} | #{email.from}#{espaco*(max_from-(email.from.length))} | #{email.subject}#{espaco*(max_subject-(email.subject.length))} |"
		end
		puts "+#{hifen*12}+-#{hifen * max_from}-+-#{hifen * max_subject}-+"
	end
	
	def def_max_from (mailbox)
		max = 4
		mailbox.emails.each do |email|	
			if email.from.length > max	
				max = email.from.length
			else
				max
			end
		end
		return max
	end
	
	def def_max_subject (mailbox)
		max = 7
		mailbox.emails.each do |email|	
			if email.subject.length > max	
				max = email.subject.length
			else
				max
			end
		end
		return max
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

#
#	Outro teste com strings ainda maiores
#

emails2 = [
  Email.new("Homework this week", { :date => "2014-12-01", :from => "Ferdous" }),
  Email.new("Keep on coding! :):):):):):):):)", { :date => "2014-12-01", :from => "Dajana" }),
  Email.new("Re: Homework this week", { :date => "2014-12-02", :from => "Ariane Ariane Ariane Ariane" })
]

mailbox2 = Mailbox.new("Outra lista de email para testes", emails2)
formatter2 = MailboxTextFormatter.new(mailbox2)

puts formatter2.format






