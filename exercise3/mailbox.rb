class Email
  def initialize (s = subject,h = headers)
    @subject = s
    @headers = h
  end

  def date
    headers[:date]
  end

  def from
    headers[:from]
  end

  def subject
    @subject
  end

  def headers
    @headers
  end
end


class Mailbox
  def initialize(n = name,e = emails)
    @name = n
    @emails = e
  end

  def name 
    @name
  end

  def emails 
    @emails
  end
end

class MailboxTextFormatter  
      def initialize(m = mailbox)
        @mailbox = m
      end
      
      def mailbox
        @mailbox
      end

      def format
            print "Mailbox: #{mailbox.name}\n"
            print
            print "+------------+---------+------------------------+\n"
            print "| Date       | From    | Subject                |\n"
            print "+------------+---------+------------------------+\n"

            mailbox.emails.each do |email|
              print  "| #{email.date} | #{email.from}" + " "*(9-email.from.length-2) + " | #{email.subject}" + " "*(24-email.subject.length-2) + " |" + "\n"
            end
            print "+------------+---------+------------------------+\n"
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
