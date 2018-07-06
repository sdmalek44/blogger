describe Tag type: :model do
  describe 'relationships' do
    it 'has many articles' do
      it {should_have_many(:taggings)}
      it {should_have_many(:articles).through(:tagging)}
    end
  end
end
