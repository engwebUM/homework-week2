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
    
    
    def initialize(name, emails)
        @name = name
        @emails = emails
    end
    
end

class MailboxTextFormatter


end


emails = [
Email.new("Homework this week", { :date => "2014-12-01", :from => "Ferdous" }),
Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Dajana" }),
Email.new("Re: Homework this week", { :date => "2014-12-02", :from => "Ariane" })
]
mailbox = Mailbox.new("Ruby Study Group", emails)
formatter = MailboxTextFormatter.new(mailbox)

puts formatter.format