class Email
  attr_accessor :date,:from,:subject
  
  def initialize(subject, a)
    @Date = a[:date]
    @From = a[:from]
    @Subject = subject
  end
  def date
    return @Date
  end
  def from
    return @From
  end
  def subject
    return @Subject
  end
end

class Mailbox
  attr_accessor :name,:emails
  def initialize(name, emails)
    @Name = name
    @Emails = emails
  end
  def name
    return @Name
  end
  def emails
    return @Emails
  end
end

class MailboxTextFormatter
   attr_accessor :mailbox,:maxLengthDate,:maxLengthFrom,:maxLengthSubject, :max,:maxx

  def initialize(mailbox)
    @mailbox = mailbox
  end
  
  def BorderPrint(maxLengthDate,maxLengthFrom, maxLengthSubject, max)
    max=maxLengthDate+maxLengthFrom+maxLengthSubject+3
    arys=Array.new(max)
      for j in 0..max 
            arys[0]="+"
            arys[j]= "-"
            arys[maxLengthDate+1]="+"
            arys[maxLengthDate+maxLengthFrom+2]= "+"
            arys[max]="+\n"   
      end
      arys.each do |num|
        print num
      end
  end 

  def maxOfStrings(maxLengthDate,maxLengthFrom, maxLengthSubject)
    mailbox.emails.each do |email|
      if email.from.length > maxLengthFrom
          @maxLengthFrom=email.from.length     
      if email.subject.length > maxLengthSubject
          @maxLengthSubject=email.subject.length
      end
    end
        @maxLengthDate= email.date.length
    end
  end
  
  def format
    @maxLengthDate=0 #same size of date
    @maxLengthFrom=0 
    @maxLengthSubject=0
    @max=0
    #maxx=0
    ser=maxOfStrings(maxLengthDate,maxLengthFrom, maxLengthSubject)
    sDate="Date"
    sSubject="Subject"
    sFrom="From"
    maxOfStrings(maxLengthDate,maxLengthFrom, maxLengthSubject)
    #puts "#{maxLengthDate} #{maxLengthFrom} #{maxLengthSubject}"
    puts "Mailbox: #{mailbox.name}"
    BorderPrint(maxLengthDate,maxLengthFrom, maxLengthSubject, max)
    puts "|#{sDate.ljust(maxLengthDate)}|#{sFrom.ljust(maxLengthFrom)}|#{sSubject.ljust(maxLengthSubject)}|"
    BorderPrint(maxLengthDate,maxLengthFrom, maxLengthSubject, max)
    mailbox.emails.each do |email|
    puts "|#{email.date.ljust(maxLengthDate)}|#{email.from.ljust(maxLengthFrom)}|#{email.subject.ljust(maxLengthSubject)}|"
    BorderPrint(maxLengthDate,maxLengthFrom, maxLengthSubject, max)
    #maxx=maxLengthDate+maxLengthFrom+maxLengthSubject+4
    end
    #puts "#{maxx}"
  end
end

emails = [
  Email.new("Homework this week", { :date => "2014-12-01", :from => "Ferdous" }),
  Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Dajana" }),
  Email.new("Re: Homework this week", { :date => "2014-12-02", :from => "Ariane" })
]
mailbox = Mailbox.new("Ruby Study Group", emails)
formatter = MailboxTextFormatter.new(mailbox)
formatter.format
