require "rails_helper"

describe Article, type: :model do
  describe 'relationships' do
    it {should have_many(:comments)}
    it {should have_many(:taggings)}
    it {should have_many(:tags).through(:taggings)}
  end
  describe "validations" do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:body)}
  end
  describe "#tag_list" do
    it 'turns associated tags into a string' do
      article = Article.create(title: "Tall Tables", body: "they are tough for the short legged")
      article.tags.create(name: 'furniture')
      article.tags.create(name: 'opinions')

      expect(article.tag_list).to eq("furniture, opinions")
    end
  end
end
