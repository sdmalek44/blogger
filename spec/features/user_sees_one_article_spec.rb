require 'rails_helper'

describe 'user sees one article' do
  describe 'they link from the articles index' do
    it 'displays information for one object' do
      article = Article.create!(title: 'barf', body: 'barf is gross')

      visit articles_path

      click_link article.title

      expect(page).to have_content(article.title, article.body)
    end
    it 'displays information for one article' do
      article = Article.create!(title: "New Title", body: "New Body")
      comment_1 = article.comments.create(author_name: "Me", body: "Commenty coments")
      comment_2 = article.comments.create(author_name: "you", body: "Codafdfents")

      visit articles_path

      click_link article.title

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
      expect(page).to have_content(comment_1.author_name)
      expect(page).to have_content(comment_1.body)
      expect(page).to have_content(comment_2.author_name)
      expect(page).to have_content(comment_2.body)
    end
  end
end
