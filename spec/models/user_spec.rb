require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(name: 'Dario')

  it 'Test to prove user is valid' do
  expect(user).to b_valid
  end
end
