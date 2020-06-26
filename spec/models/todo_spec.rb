require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Todo, type: :model do
  # Association test
  # ensure Todo model has a 1:m relationship with the Item model
  it { should have_many(:items).dependent(:destroy) }
  # Validation tests
  # ensure columns title and user_id are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:user_id) }
end
