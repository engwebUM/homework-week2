class Email
	attr_accessor :subject, :date, :from

	def initialize(s, args)
		@subject = s
		args.each do |k,v|
      		instance_variable_set("@#{k}", v) unless v.nil?
    	end
	end
end

class Mailbox
	attr_accessor :nome, :emails

	def initialize(n, e)
		@nome = n
		@emails = e
	end
end

class MailboxTextFormatter
	attr_accessor :mails, :ndata, :nfrom, :nsubject

	def initialize(mb)
		@mails = mb
		@ndata = 4
		@nfrom = 4
		@nsubject = 7
	end

	def format
		mails.emails.each do |email|
			if email.date.length > @ndata
				@ndata = email.date.length
			end
			if email.from.length > @nfrom
				@nfrom = email.from.length
			end
			if email.subject.length > @nsubject
				@nsubject = email.subject.length
			end
		end
		puts
		puts "MailBox: " + mails.nome
		puts
		puts "+-" + "-"*ndata + "-|-" + "-"*nfrom + "-|-" + "-"*nsubject + "-+"
		puts "| Date" + " "*(ndata - 4) + " | From" + " "*(nfrom - 4) + " | Subject" + " "*(nsubject - 7) + " |"
		puts "+-" + "-"*ndata + "-|-" + "-"*nfrom + "-|-" + "-"*nsubject + "-+"

		mails.emails.each do |email|
			puts "| #{email.date}"+" "*(ndata-email.date.length)+" | #{email.from}"+" "*(nfrom-email.from.length)+" | #{email.subject}"+" "*(nsubject-email.subject.length)+" |" 
		end
		puts "+-" + "-"*ndata + "-|-" + "-"*nfrom + "-|-" + "-"*nsubject + "-+"
	end

	def adicionarMail(novoEmail)
		mails.emails.push(novoEmail)
	end

	def eliminarMail(x)
		if (x-1) < mails.emails.size
			mails.emails.delete_at(x-1)
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

puts "\n"
puts "+--------------------------------------------+"
puts "| Adicionar um novo Email à caixa de correio |"
puts "+--------------------------------------------+"
m = Email.new("Novo email", { :date => "2015-02-26", :from => "Jorge" })
formatter.adicionarMail(m)
puts formatter.format

puts
puts "+-----------------------------------------+"
puts "| Eliminar o 2º Email da caixa de correio |"
puts "+-----------------------------------------+"
formatter.eliminarMail(2)
puts formatter.format