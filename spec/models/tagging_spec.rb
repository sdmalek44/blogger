describe Tagging type: :model do
  describe 'relationships' do
    it {should_belong_to(:article)}
    it {should_belong_to(:tag)}
  end
end
