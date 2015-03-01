class Email
    
    attr_reader :subject
    attr_reader :date
    attr_reader :from
    
    
    def initialize(subject, headers)
        @subject = subject
        @date = headers[:date]
        @from = headers[:from]
    end
    
end


class Mailbox
    
    attr_reader :emails
    attr_reader :name
    
    
    def initialize(name, emails)
        @name = name
        @emails = emails
    end
    
end


class MailboxTextFormatter
    
    attr_reader :mailbox
    
    
    def initialize (mailbox)
        @mailbox = mailbox
    end
    
    
    def biggestSubject mailbox
        biggestSubject = 9
        
        mailbox.emails.each do |email|
            biggestSubject = email.subject.length unless email.subject.length <= biggestSubject
        end
        
        return biggestSubject
    end
    
    
    def biggestDate mailbox
        biggestDate = 6
        
        mailbox.emails.each do |email|
            biggestDate = email.date.length unless email.date.length <= biggestDate
        end
        
        return biggestDate
    end
    
    
    def biggestFrom mailbox
        biggestFrom = 6
        
        mailbox.emails.each do |email|
            biggestFrom = email.from.length unless email.from.length <= biggestFrom
        end
        
        return biggestFrom
    end
    
    
    def format
        
        biggestSubject = biggestSubject mailbox
        biggestDate = biggestDate mailbox
        biggestFrom = biggestFrom mailbox

        puts "Mailbox: #{mailbox.name}"
        puts "+-#{'-' * biggestDate}-+-#{'-' * biggestFrom}-+-#{'-' * biggestSubject}-+"
        puts "| Date#{' ' * (biggestDate - 4)} | From#{' ' * (biggestFrom - 4)} | Subject#{' ' * (biggestSubject - 7)} |"
        puts "+-#{'-' * biggestDate}-+-#{'-' * biggestFrom}-+-#{'-' * biggestSubject}-+"
        
        
        mailbox.emails.each do |email|
            puts "| #{email.date}#{' ' * (biggestDate - (email.date.length))} | #{email.from}#{' ' * (biggestFrom - (email.from.length))} | #{email.subject}#{' ' * (biggestSubject - (email.subject.length))} |"
        end
        
        
        puts "+-#{'-' * biggestDate}-+-#{'-' * biggestFrom}-+-#{'-' * biggestSubject}-+"
    end
    
    
    
    
end


emails = [
Email.new("Homework this week", { :date => "2014-12-01", :from => "Ferdous" }),
Email.new("Keep on coding!", { :date => "2014-12-01", :from => "Dajana" }),
Email.new("Re: Homework this week", { :date => "2014-12-02", :from => "Ariane" })
]
mailbox = Mailbox.new("Ruby Study Group", emails)
formatter = MailboxTextFormatter.new(mailbox)

puts formatter.format