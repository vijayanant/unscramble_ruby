require 'rspec/given'
require './unscrambler'

RSpec::Given.use_natural_assertions

describe Unscrambler do
  Given(:unscrambler) {Unscrambler.new}

  describe  'initialisation' do 
    Then  {unscrambler != nil}
  end

  describe 'insert "a"' do
    When {unscrambler.add("a")}
    Then { expect(unscrambler.get("a")).to eq(["a"])}
  end
end
