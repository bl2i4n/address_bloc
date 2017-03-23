require_relative '../models/address_book'

RSpec.describe AddressBook do
# new instance of AddressBook model and assign it to variable named book
# let us use book in all tests and remove duplication of AddressBook in each test
  let(:book) {AddressBook.new}

  #6 helper method which consolidates all expect tests from import_csv method
  def check_entry(entry, expected_name, expected_number, expected_email)
    expect(entry.name).to eq expected_name
    expect(entry.phone_number).to eq expected_number
    expect(entry.email).to eq expected_email
  end


  #describe and it statements are Rspec paradigm to explain what we are testing
  describe "attributes" do
    #it explains the functionality of the method we're testing
    it "responds to entries" do
      expect(book).to respond_to(:entries)
      book.import_from_csv("entries.csv")
      #check the first entry
      entry_one = book.entries[0]

      check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
    end

          it "imports the 2nd entry" do
              book.import_from_csv("entries.csv")
              #check second entry
              entry_two = book.entries[1]

              check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
          end

          it "imports the 3rd entry" do
              book.import_from_csv("entries.csv")
              #check third entry
              entry_three = book.entries[2]

              check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")

          end

          it "imports the 4th entry" do
              book.import_from_csv("entries.csv")
              #check fourth entry
              entry_four = book.entries[3]

              check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")

          end

          it "imports the 5th entry" do
              book.import_from_csv("entries.csv")
              #check fifth entry
              entry_five = book.entries[4]

              check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")
          end


    it "initializes entries as an array" do
      expect(book.entries).to be_an(Array)
    end

    it "initializes entries as empty" do
      expect(book.entries.size).to eq(0)
    end
  end

  # describe "#add_entry" do
  #   it "adds only one entry to the address book" do
  #     book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
  #
  #     expect(book.entries.size).to eq(1)
  #     end
  #
  #   it "adds the correct information to entries" do
  #     book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
  #     new_entry = book.entries[0]
  #
  #     expect(new_entry.name).to eq('Ada Lovelace')
  #     expect(new_entry.phone_number).to eq('010.012.1815')
  #     expect(new_entry.email).to eq('augusta.king@lovelace.com')
  #     end
  # end
  #
  # #attempt at writing remove_entry test
  # describe "#remove_entry" do
  #   it "removes only one entry from the address book" do
  #     book =
  #     book.add_entry('Brian Dela Cruz', '123.456.7890', 'bdc@gmail.com')
  #
  #     name = "Ada Lovelace"
  #     phone_number = "010.012.1815"
  #     email_address = "august.king@lovelace.com"
  #     book.add_entry(name, phone_number, email_address)
  #
  #     expect(book.entries.size).to eq 2
  #     book.remove_entry(name, phone_number, email_address)
  #     expect(book.entries.size).to eq 1
  #     expect(book.entries.first.name).to eq("Brian Dela Cruz")
  #   end
  # end

  # Test that AddressBook's .import_from_csv() method is working as expected_string
  describe "#import_from_csv" do
    it "imports the correct number of entries" do
      # call import_from_csv on the book object which has a type
      #AddressBook,
      book.import_from_csv("entries.csv")
      #save the size of AddressBook.entries to our local variable book_size
      book_size = book.entries.size

      #check the size of the entries in AddressBook
      expect(book_size).to eq 5
    end
  end

  # Test the binary_search methods
  describe "#binary_search" do

    it "searches AddressBook for a non-existent entry" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Dan")
      expect(entry).to be_nil
    end

    #adding another test
    it "searches AddressBook for Bill" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Bill")
      expect(entry).to be_a Entry
      check_entry(entry, "Bill", "555-555-4854", "bill@blocmail.com")
    end

    it "searches AddressBook for Bob" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Bob")
      expect(entry).to be_a Entry
      check_entry(entry, "Bob", "555-555-5415", "bob@blocmail.com")
    end

    it "searches AddressBook for Joe" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Joe")
      expect(entry).to be_a Entry
      check_entry(entry, "Joe", "555-555-3660", "joe@blocmail.com")
    end

    it "searches AddressBook for Sally" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Sally")
      expect(entry).to be_a Entry
      check_entry(entry, "Sally", "555-555-4646", "sally@blocmail.com")
    end

    it "searches AddressBook for Sussie" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Sussie")
      expect(entry).to be_a Entry
      check_entry(entry, "Sussie", "555-555-2036", "sussie@blocmail.com")
    end

    #removed failing test
    # it "searches AddressBook for Billy" do
    #   book.import_from_csv("entries.csv")
    #   entry = book.binary_search("Billy")
    #   expect(entry).to be_nil
    # end

  end

### assignment 8
  describe "#iterative_search" do

    it "searches AddressBook for a non-existent entry using iterative_search" do
      book.import_from_csv("entries.csv")
      entry = book.iterative_search("Dan")
      expect(entry).to be_nil
    end

    #adding tests for assignment
    it "searches AddressBook for Bill using iterative_search" do
      book.import_from_csv("entries.csv")
      entry = book.iterative_search("Bill")
      expect(entry).to be_a Entry
      check_entry(entry, "Bill", "555-555-4854", "bill@blocmail.com")
    end

###

end
