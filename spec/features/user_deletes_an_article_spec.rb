require 'rails_helper'

describe 'Features' do
  context 'when user visits /articles/:id' do
    it 'can delete the article' do
      article_1 = Article.create!(title: 'pants', body: 'more pants')
      article_2 = Article.create!(title: 'barf', body: 'more barf')

      visit article_path(article_1)

      click_link "Delete"

      expect(current_path).to eq(articles_path)
      expect(page).to have_content(article_2.title)
      within("#articles") do
        expect(page).to_not have_content(article_1.title)
      end
      expect(page).to have_content("Article '#{article_1.title}' Deleted!")
    end
  end
end
