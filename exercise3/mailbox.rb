class Email
    def initialize(subject, params = {})
    @date = params[:date]
    @from = params[:from] 
    @subject = subject
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
end

class Mailbox
  def initialize(name, emails)
    @name = name
    @emails = emails
  end
  
  def name
    @name
  end
  
  def emails
    @emails
  end    
end

class MailboxTextFormatter
  def initialize(mailbox)
    @mailbox = mailbox
  end
  
  def mailbox
    @mailbox
  end
  
  def format
    res ="\n"
    numDate = dateMax(mailbox)
    numFrom = fromMax(mailbox)
    numSubject = subjectMax(mailbox)

    tracosDate = tracos(numDate)
    tracosFrom = tracos(numFrom)
    tracosSubject = tracos(numSubject)

    espacosDate = espacos(numDate -4)
    espacosFrom = espacos(numFrom -4)
    espacosSubject = espacos(numSubject -7)


    res << "Mailbox: #{mailbox.name}\n"
    res << "\n"
    res << "+ " 
    res << tracosDate
    res << " + " 
    res << tracosFrom
    res << " + "
    res << tracosSubject
    res << " + \n"
    
    res << "| Date"
    res << espacosDate
    res << " | From"
    res << espacosFrom
    res << " | Subject"
    res << espacosSubject
    res << " |\n"
    res << "+ " 
    res << tracosDate
    res << " + " 
    res << tracosFrom
    res << " + "
    res << tracosSubject
    res << " + \n"
   
    mailbox.emails.each do |email|
      res << "| #{email.date} "
      res << espacos(numDate - size(email.date))
      res << "| #{email.from }"
      res << espacos(numFrom - size(email.from))
      res << " | #{email.subject }"
      res << espacos(numSubject - size(email.subject))
      res << " |\n"  
    end

    res << "+ " 
    res << tracosDate
    res << " + " 
    res << tracosFrom
    res << " + "
    res << tracosSubject
    res << " + \n"
   

    return res
  end


  def size string
    return string.size    
  end


  def tracos num
    res = ""
    for i in 0..num
      if i==num
        break
      end
      res = res + "-"
    end
    return res  
  end

  def espacos num
    res = ""
    for i in 0..num
      if i==num
        break
      end
      res = res + " "
    end
    return res  
  end  

  def dateMax mailbox
    res = 0  

    mailbox.emails.each do |email|
      if res<size(email.date)
        res = size(email.date)
      end
    end

    return res
  end

  def fromMax mailbox
    res = 0  

    mailbox.emails.each do |email|
      if res<size(email.from)
        res = size(email.from)
      end
    end

    return res
  end 

  def subjectMax mailbox
    res = 0  

    mailbox.emails.each do |email|
      if res<size(email.subject)
        res = size(email.subject)
      end
    end

    return res
  end 
end



emails = [
  Email.new("Homework this week", { :date => "2014-12-01", :from => "Ferdousa" }),
  Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Dajana" }),
  Email.new("Re: Homework this week", { :date => "2014-12-02", :from => "Ariane" })
]
mailbox = Mailbox.new("Ruby Study Group", emails)
formatter = MailboxTextFormatter.new(mailbox)

puts formatter.format

