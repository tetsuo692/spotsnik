require 'spec_helper'

describe Spot do
  
  it { should validate_presence_of(:title) }
  
  it { should validate_presence_of(:long)}
  
  it { should validate_presence_of(:lat)}
end
