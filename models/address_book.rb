require_relative 'entry'

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
    index = 0
    entries.each do |entry|
      if entry == entries[0]
        entries.remove(index, entries[0])
      end
    end
  end

end
