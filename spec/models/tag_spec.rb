describe Tag, type: :model do
  describe 'relationships' do
    it {should have_many(:taggings)}
    it {should have_many(:articles).through(:taggings)}
  end
  describe 'instance methods' do
    it 'can get the tag name string' do
      tag = Tag.create(name: 'blah')

      expect(tag.to_s).to eq('blah')
    end
  end
end
