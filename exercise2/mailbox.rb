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

emails = [
  Email.new("Homework this week", { :date => "2014-12-01", :from => "Ferdous" }),
  Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Dajana" }),
  Email.new("Re: Homework this week", { :date => "2014-12-02", :from => "Ariane" })
]
mailbox = Mailbox.new("Ruby Study Group", emails)

mailbox.emails.each do |email|
  puts "Date:    #{email.date}"
  puts "From:    #{email.from}"
  puts "Subject: #{email.subject}"
  puts
end

