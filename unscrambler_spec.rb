require 'rspec/given'
require './unscrambler'

RSpec::Given.use_natural_assertions

describe Unscrambler do
  Given(:unscrambler) {Unscrambler.new}

  Then  {unscrambler != nil}
end
