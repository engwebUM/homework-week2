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
  attr_reader :name
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
      puts "#{@mailbox.name}"
      puts ""
      @xtot=0 # total size
      @xfrom=0 #size to from
      @mailbox.emails.each do |email|
        @size=email.subject.size
        @sizefrom=email.from.size
        if @xtot<@size 
          @xtot=@size
        end
        if @xfrom<@sizefrom
          @xfrom=@sizefrom
        end
      end
      @xtot+=@xfrom+20 #20 - size characters Date and spaces
      @xfrom+=16    #16 - size characters Date and spaces to 'from'
      separator
      printHeader
      separator
      printRows(@mailbox)
      separator
      return ""
    end

    def printHeader
      print "| Date"
      loop(6,12," ")
      print "| From"
      loop(20,@xfrom," ")
      print "| Subject"
      loop(@xfrom+11,@xtot," ")
      print "|"
      puts ""
    end

    def printRows (mailbox)
      @mailbox.emails.each do |email|
        print "| #{email.date}"
        loop(1,1," ")
        print "| #{email.from}"
        loop(15,@xfrom-email.from.size-1," ")
        print "| #{email.subject}"
        loop(@xfrom,@xtot-email.subject.size-4," ")
        print "|"
        puts ""
      end
    end 

    def separator
      print "+"
      loop(1,12,"-")
      print "+"
      loop(15,@xfrom,"-")
      print "+"
      loop(@xfrom,@xtot-3,"-")
      print "+" 
      puts ""
    end 

    def loop (p_start, p_end, c_Print)
      for i in p_start..p_end
        print c_Print
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