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
    describe 'they fill in a comment form' do
      it 'displays the co,ment on the article show' do
        article = Article.create!(title: "New Title", body: "New Body")

        visit article_path(article)
        author_name = "ME!"
        body = "some thoughts"

        fill_in "comment[author_name]", with: "ME!"
        fill_in "comment[body]", with: "some thoughts"
        click_on "Submit"

        expect(current_path).to eq(articles_path)
        expect(page).to have_content("Post a Comment")
        expect(page).to have_content(author_name)
        expect(page).to have_content(body)
      end
    end
  end
end
