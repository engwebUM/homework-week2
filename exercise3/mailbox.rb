class Email
  attr_reader :subject, :date, :from

  def initialize(subject, headers)
    @subject = subject
    @date = headers[:date]
    @from = headers[:from]

  end
end


class Mailbox
  attr_reader :name, :emails

  def initialize(name, emails)
    @name = name
    @emails = [:email]
    @emails = emails
  end
end


class MailboxTextFormatter
  attr_reader :mailbox

  def initialize(mailbox)
    @mailbox = mailbox
  end

  def countDate
    size = 0
    mailbox.emails.each do |email|
        if email.date.length > size
            size = email.date.length
        end
    end
    
    return size
  end

  def countFrom
    size = 0
    mailbox.emails.each do |email|
        if email.from.length > size
            size = email.from.length
        end
    end

    return size
  end

  def countSubject
    size = 0
    mailbox.emails.each do |email|
        if email.subject.length > size
            size = email.subject.length
        end
    end

    return size
  end


  def format
    date_size = countDate
    from_size = countFrom
    subject_size = countSubject

    puts "MailBox: #{mailbox.name}"
    array = Array[]
    array.push("+-"+"-"*date_size+"-+"+"-"*from_size+"-+-"+"-"*subject_size+"-+")
    array.push("| Date"+" "* (date_size - "Date".length)+" | From"+" "* (from_size - "From".length)+"| Subject"+" "* (subject_size - "Subject".length)+" |")
    array.push("+-"+"-"*date_size+"-+"+"-"*from_size+"-+-"+"-"*subject_size+"-+")

    mailbox.emails.each do |email|
      array.push("| #{email.date} "+" "* (date_size - email.date.length)+"| #{email.from}"+" "* (from_size - email.from.length)+"| #{email.subject} "+" "* (subject_size - email.subject.length)+"|")
      array.push("+-"+"-"*date_size+"-+"+"-"*from_size+"-+-"+"-"*subject_size+"-+")
    end

    return array
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
