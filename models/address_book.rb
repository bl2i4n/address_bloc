require_relative 'entry'
require "csv"

class AddressBook
  attr_reader :entries

  def initialize
      @entries = []
  end

  def add_entry(name, phone_number, email)
    index = 0
    entries.each do |entry|
      if name < entry.name
        break
      end
      index+= 1
    end

    entries.insert(index, Entry.new(name, phone_number, email))
  end

  def remove_entry(name, phone_number, email)
    #use index of match to remove entry from entries
    delete_entry = nil
    @entries.each do |entry|
      if name == entry.name && phone_number == entry.phone_number && email == entry.email
        delete_entry = entry
      end
    end
    @entries.delete(delete_entry)
  end

  #7
  def import_from_csv(file_name)
    #reads file using File.read
    csv_text = File.read(file_name)
    #parse file which then becomes CSV::Table
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)

    #8 iterate over CSV::Table object rows
    csv.each do |row|
      #create a hash for each row
      row_hash = row.to_hash
      #convert each row_hash to an entry using add_entry method
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end
  end

  #Search AddressBook for a specific entry by name
  def binary_search(name)
    #1 we save index of leftmost item in array called lower
    #index of rightmost item stored at upper
    lower = 0
    upper = entries.length - 1

    #2 loop while our lower index is less than or equal to our upper index
    while lower <= upper
      #3 find the middle index by taking sum of
      #lower and upper and dividing by teaisaweso#ruby truncates decimal numbers
      #retrieve name of entry at middle index and store it in mid_name
      mid = (lower + upper) / 2
      mid_name = entries[mid].name

      #4 compare name we are searching for to name of middle index mid_name
      if name == mid_name #found name we are looking for
        return entries[mid] #return entry ad index mid
      elsif name < mid_name #set upper to mid - 1 b/c name must be in lower half of array
        upper = mid - 1
      elsif name > mid_name #alphabetically after mid_name then we set lower
        lower = mid + 1 #lower is set to mid + 1 b/c name must be in the upper half of array
      end
    end

    #5 if we divide and conque until no match is found then return nil
    return nil
  end

end
