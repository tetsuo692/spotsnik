class Spot
  include Mongoid::Document
  field :title, type: String
  field :location, type: Array, default: [nil, nil]
  
  index({ location: "2d" }, { min: -200, max: 200 })
  
  validates_presence_of :title
  
  validates_presence_of :long
  validates_presence_of :lat
  
  def long
    location.first
  end
  
  def lat
    location.last
  end
  
  def long=(value)
    location[0] = value.to_f if value
  end
  
  def lat=(value)
    location[1] = value.to_f if value
  end
end
