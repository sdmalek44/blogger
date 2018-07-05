require 'rails_helper'

describe 'user sees one article' do
  describe 'they link from the articles index' do
    it 'displays information for one object' do
      article = Article.create!(title: 'barf', body: 'barf is gross')

      visit articles_path

      click_link article.title

      expect(page).to have_content(article.title, article.body)
    end
  end
end
