require 'test_helper'

class AttendeeCSVTest < ActiveSupport::TestCase

  test 'it exists' do
    assert AttendeeCSV
  end

  test 'it can load a csv file' do
    file = './test/models/full_event_attendees.csv'
    c = AttendeeCSV.new(file)
    assert_equal file, c.file
  end

  test 'parsing csv file stores each users data in an array' do
    file = './test/models/full_event_attendees.csv'
    c = AttendeeCSV.new(file)
    c.parse
    assert_equal ["Allison Nguyen", "20010"], c.data.first
  end

end
