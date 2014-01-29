class SunlightApi
  attr_reader :legislators


  def initialize(zipcode)
    Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"
    @api_data = Sunlight::Congress::Legislator.by_zipcode(zipcode)
    @legislators = []
  end

  def get_legislators
    api_data.map do |legislator|
      each_legislator= []
      each_legislator<< legislator.first_name
      each_legislator<< legislator.last_name
      each_legislator<< legislator.website
      legislators << each_one
    end
    legislators.to_json
  end
end
