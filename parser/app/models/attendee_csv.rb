require 'csv'
class AttendeeCSV
  attr_reader :file, :data

  def initialize(csv)
    @file = csv
    @data = []
  end

  def parse
    csv = CSV.open file, headers: true, header_converters: :symbol

    csv.each do |row|
      attendee = []
      attendee << row[:first_name] + " " + row[:last_name]
      attendee << clean_zipcode(row[:zipcode])
      data << attendee
    end
  end

  def clean_zipcode(zipcode)
    if zipcode
      zipcode.to_s.rjust(5,"0")[0..4]
    else
      zipcode = "00000"
    end
  end

end

