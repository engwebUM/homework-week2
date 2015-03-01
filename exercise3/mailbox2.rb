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


class NewColumn
  attr_reader :name
  attr_reader :values
  attr_reader :number_of_lines

  def initialize (name,values,number_of_lines)
    @name = name
    @values = values
    @number_of_lines=number_of_lines
  end
end



class MailboxTextFormatter
  attr_reader :mailbox
  attr_reader :new_column_hash
  
  def initialize(mailbox,new_column_hash)
    @mailbox = mailbox
    @new_column_hash= new_column_hash
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


  # return   {newcolumn1-> numberOfspaces , newcolumn2 -> numberOfSpaces}
  def column_spaces
    number = 1
    number2 = 1
    column_space= Hash.new
    new_column_hash.each do |column|
      column_space[number.to_s] = column.name.length
      column.values.each do |value|
        column_space[number.to_s]= [ column_space[number.to_s],(value.last).length].max
        number2=number2 + 1
      end
      number = number + 1
      number2 = 1
    end
    return column_space 
  end
      
  def write_pair
    number = 1
    list = Hash.new

    help = 1

    while help < (mailbox.emails.length * new_column_hash.length) do 
      new_column_hash.each do |column|
        aux =1 
        column.values.each do |v|
          if aux == help
            list [number.to_s] = v
            number = number + 1
            aux = aux +1 
          else 
            aux = aux +1
          end       
        end 
      end
      help = help + 1
    end
    #p list
    return list
  end


  def format
    string = ""
    string = string + "\n\nMailbox: #{mailbox.name}\n\n"

    #print the table header
            
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
    string = string + "+"

    # new columns code
    column_spaces.each do |sp|
      aux=sp.last+2
      while aux >0 do
        string = string + "-"
        aux = aux -1
      end
      string = string + "+"
    end

    string = string + "\n"

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
    string = string + "|"

    # new columns code

    #new_column_hash.each do |cn|
    countt = 1
    column_spaces.each do |sp|
      auxx = 1
      new_column_hash.each do |cn|
        if auxx == countt
         auxx2 = sp.last + 2 - cn.name.length
          string = string + " "
          string = string + cn.name
          while auxx2 > 1 do 
            string = string + " "
            auxx2 = auxx2 - 1
          end
          auxx = auxx +1
          string = string + "|"
        else 
          auxx = auxx + 1
        end
      end
      countt = countt + 1
    end




    string = string + "\n"
            
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
    string = string + "+"    

    #new columns code
     column_spaces.each do |sp|
      aux=sp.last+2
      while aux >0 do
        string = string + "-"
        aux = aux -1
      end
      string = string + "+"
    end

    string = string + "\n"




    linhas = 1 
    colunas = new_column_hash.length
    #print the table body
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

              #new columns body table

              count = 1
              while (count <= colunas) do 
                string = string + " "
                string = string + write_pair[linhas.to_s].last
                w_spaces = 1 + column_spaces[count.to_s] - write_pair[linhas.to_s].last.length 
                while w_spaces > 0 do 
                  string = string + " "
                  w_spaces = w_spaces -1
                end
                 string = string + "|"
                linhas += 1
                count +=1
              end

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



    string = string + "+"     

        # new columns code
    column_spaces.each do |sp|
      aux=sp.last+2
      while aux >0 do
        string = string + "-"
        aux = aux -1
      end
      string = string + "+"
    end

    string = string + "\n"   

    # return
    a = column_spaces

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

new_column_hash= [
  NewColumn.new("Have been Read", { :'1' => "check" , :'2' => " " , :'3' => "cheking"},emails.length),
  NewColumn.new("Second Column Test", { :'1' => "one" , :'2' => "two" , :'3' => "three"},emails.length),
  NewColumn.new("New Column", { :'1' => "star" , :'2' => " " , :'3' => "starrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr"},emails.length)
]

formatter = MailboxTextFormatter.new(mailbox,new_column_hash)

puts formatter.format