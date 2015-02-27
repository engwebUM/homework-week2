
class Email
  def initialize(subject, hash)
    @subject = subject
    @date = hash[:date]
    @from = hash[:from]
  end

  def subject
    @subject
  end

  def date
    @date
  end

  def from
    @from
  end
end

class Mailbox
  def initialize(name, emails)
    @name = name
    @emails = emails
  end

  def emails
    @emails
  end

  def name
    @name
  end
end

class MailboxTextFormatter
  def initialize(mailbox)
    @mailbox = mailbox
  end

  def format
    i=0
    arr = @mailbox.emails

    d = "Date".length
    f = "From".length
    s = "Subject".length
    while i<arr.count

      date = arr[i].date
      if(d<date.length)
        d = date.length
      end

      subject = arr[i].subject
      if(s<subject.length)
        s = subject.length
      end

      from = arr[i].from
      if(f<from.length)
        f = from.length
      end

      i = i + 1
    end
    mf =[]
    mf << "+"+"-"+"-"*(d)+"-"+"+"+"-"+"-"*f+"-"+"+"+"-"+"-"*s+"-"+"+"
    mf << "| "+"Date"+" "*(d-"Date".length)+" | "+"From"+" "*(f-"From".length)+" | "+"Subject"+" "*(s-"Subject".length)+" |"
    mf << "+"+"-"+"-"*(d)+"-"+"+"+"-"+"-"*f+"-"+"+"+"-"+"-"*s+"-"+"+"
    i=0
    while i<arr.count
      mf << "| "+"#{arr[i].date}"+" "*(d-arr[i].date.length)+" | "+"#{arr[i].from}"+" "*(f-arr[i].from.length)+" | "+"#{arr[i].subject}"+" "*(s-arr[i].subject.length)+" |"
      i=i+1
    end
    mf << "+"+"-"+"-"*(d)+"-"+"+"+"-"+"-"*f+"-"+"+"+"-"+"-"*s+"-"+"+"

    puts "Mailbox: #{@mailbox.name}"
    puts "\n"
    mf.each do |x|
      "#{x}"
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
