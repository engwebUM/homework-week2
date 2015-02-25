require 'terminal-table'
#run on the console: 'gem install terminal-table' to get terminal-table 
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
      rows1 = []
      @mailbox.emails.each do |email|
      rows1 << [email.date, email.from, email.subject]
      end
      table = Terminal::Table.new :headings => ['Date', 'From', 'Subject'], :rows => rows1
      puts table
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