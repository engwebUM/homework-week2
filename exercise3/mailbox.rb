class Email
  attr_reader :subject,:date,:from
  def initialize(sub,header={})
       @subject = sub
       @date = header[:date]
       @from = header[:from]

    end
end

class Mailbox
  attr_reader :emails
    def initialize(name,emails)
      @name=name
      @emails=emails
    end
end

# in alternative:
#require_relative '../exercise2/mailbox' 

class MailboxTextFormatter 
    def initialize(mailbox)
      @mailbox=mailbox 
    end
    def format
      printf "Date\t\tFrom\t\tSubject\n" 
      @mailbox.emails.each do |email|
        printf "#{email.date}\t#{email.from}\t\t#{email.subject}\n"
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