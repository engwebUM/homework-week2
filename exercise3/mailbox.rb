class Email
  attr_reader :subject  
  attr_reader :headers

  def initialize (subject,headers)
    @subject = subject
    @headers = headers
  end

  def date
    headers[:date]
  end

  def from
    headers[:from]
  end
end

class Mailbox
	attr_reader :name
	attr_reader :emails

	def initialize(name,emails)
		@name = name
		@emails = emails
	end

end


class MailboxTextFormatter
  attr_reader :mailbox
  
  def initialize(mailbox)
    @mailbox = mailbox
  end

  def count_date_spaces
    date_spaces=4       #date tem 4 letras
    mailbox.emails.each do |email|
      date_spaces=[date_spaces,email.date.length].max
    end 
    return date_spaces+2
  end

  def count_from_spaces
    from_spaces=4       #from tem 4 letras
    mailbox.emails.each do |email|
      from_spaces=[from_spaces,email.from.length].max
    end 
    return from_spaces+2
  end

  def count_subject_spaces
    subject_spaces=7    #subject tem 7 letras
    mailbox.emails.each do |email|
      subject_spaces=[subject_spaces,email.subject.length].max
    end 
    return subject_spaces+2
  end

  def format
    string = ""
    string = string + "\n\nMailbox: #{mailbox.name}\n\n"

    #string = string + the table header
            
            # first line
    date_spaces = count_date_spaces()
    from_spaces = count_from_spaces()
    subject_spaces = count_subject_spaces()

    string = string + "+"
    while date_spaces > 0 do
      date_spaces = date_spaces - 1
      string = string + "-"
    end
    string = string + "+"
    while from_spaces > 0 do 
      from_spaces = from_spaces -1
      string = string + "-"
    end
    string = string + "+"
    while subject_spaces > 0 do 
      subject_spaces = subject_spaces -1
      string = string + "-"
    end
    string = string + "+\n"

            # second line
    date_spaces = count_date_spaces() -5
    from_spaces = count_from_spaces() -5
    subject_spaces = count_subject_spaces() -8
    string = string + "| Date"
    while date_spaces > 0 do 
      date_spaces = date_spaces -1
      string = string + " "
    end
    string = string + "| From"
    while from_spaces > 0 do
      from_spaces = from_spaces -1
      string = string + " "
    end
    string = string + "| Subject"
    while subject_spaces > 0 do
      subject_spaces = subject_spaces - 1
      string = string + " "
    end
    string = string + "|\n"
            
            # third line = first line
    date_spaces = count_date_spaces()
    from_spaces = count_from_spaces()
    subject_spaces = count_subject_spaces()

    string = string + "+"
    while date_spaces > 0 do
      date_spaces = date_spaces - 1
      string = string + "-"
    end
    string = string + "+"
    while from_spaces > 0 do 
      from_spaces = from_spaces -1
      string = string + "-"
    end
    string = string + "+"
    while subject_spaces > 0 do 
      subject_spaces = subject_spaces -1
      string = string + "-"
    end
    string = string + "+\n"    

    #string = string + table body
    mailbox.emails.each do |email|
      date_spaces = count_date_spaces()-2-email.date.length
      from_spaces = count_from_spaces()-2-email.from.length
      subject_spaces = count_subject_spaces()-2-email.subject.length
              # date
              string = string + "| "
              string = string + email.date
              while date_spaces > 0 do 
                date_spaces = date_spaces - 1
                string = string + " "
              end 
              # from
              string = string + " | "
              string = string + email.from
              while from_spaces > 0 do 
                from_spaces = from_spaces - 1
                string = string + " "
              end 
              #subject
              string = string + " | "
              string = string + email.subject
              while subject_spaces > 0 do 
                subject_spaces = subject_spaces - 1
                string = string + " "
              end 
      string = string + " |"
      string = string + "\n"
    end 

    #last line = third line = first line
    date_spaces = count_date_spaces()
    from_spaces = count_from_spaces()
    subject_spaces = count_subject_spaces()

    string = string + "+"
    while date_spaces > 0 do
      date_spaces = date_spaces - 1
      string = string + "-"
    end
    string = string + "+"
    while from_spaces > 0 do 
      from_spaces = from_spaces -1
      string = string + "-"
    end
    string = string + "+"
    while subject_spaces > 0 do 
      subject_spaces = subject_spaces -1
      string = string + "-"
    end
    string = string + "+\n"        

    # return
    return string
  end

end



# test 1
emails = [
  Email.new("Homework this week", { :date => "2014-12-01", :from => "Ferdous" }),
  Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Dajana" }),
  Email.new("Re: Homework this week", { :date => "2014-12-02", :from => "Ariane" })
]
mailbox = Mailbox.new("Ruby Study Group", emails)
formatter = MailboxTextFormatter.new(mailbox)

puts formatter.format


# test 2
emails2 = [
  Email.new(" ", { :date => " ", :from => " " }),
  Email.new(" ", { :date => " ", :from => " " }),
  Email.new(" ", { :date => " ", :from => " " })
]
mailbox2 = Mailbox.new("Table 2 - Test", emails2)
formatter2 = MailboxTextFormatter.new(mailbox2)

puts formatter2.format


# test 3

emails3 = [
  Email.new("This is an example of an email with enough characters", { :date => "1-03-01", :from => "Ferdous Wahid" }),
  Email.new("It seems that the exercise is correct", { :date => "01-03-01", :from => "Dajana Rads" }),
  Email.new("It was funny solve this problem", { :date => "1-March-02", :from => "Ariane Martell" })
]
mailbox3 = Mailbox.new("Table 3 - Test", emails3)
formatter3 = MailboxTextFormatter.new(mailbox3)

puts formatter3.format