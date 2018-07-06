require 'rails_helper'

describe 'features' do
  context 'user visits article show' do
    it 'can edit an article' do
      article_1 = Article.create!(title: 'snap', body: 'crack')

      visit article_path(article_1)

      click_link "Edit"
      expect(current_path).to eq(edit_article_path(article_1))

      title = 'new title'
      body = 'new body'

      fill_in "article[title]", with: title
      fill_in "article[body]", with: body

      click_on "Update Article"

      expect(current_path).to eq(article_path(article_1))
      expect(page).to have_content(title)
      expect(page).to have_content(body)
      expect(page).to have_content("Article '#{title}' Updated!")
    end
    it 'user can link to to tag show page' do
      article = Article.create!(title: "New Title", body: "New Body")
      tag = article.tags.create!(name: "Name")

      visit article_path(article)

      click_link tag.name

      expect(current_path).to eq(tag_path(tag))
    end
  end
end
