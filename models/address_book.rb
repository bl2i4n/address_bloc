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
end
