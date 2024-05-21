require 'rails_helper'

RSpec.describe 'Search', type: :feature do
  describe "Searching" do
    before do
      create(:page, :published, content: 'Page content')
    end

    context "with no result term" do
      it 'returns no results' do
        visit root_path

        within 'form' do
          fill_in 'term', with: ''
          click_button 'Search'
        end

        expect(page).to have_current_path(search_path(term: ''))
        expect(page).to have_css('p', text: 'No results found')
      end
    end

    context "with a result term" do
      it 'renders results'  do
        visit root_path

        within 'form' do
          fill_in 'term', with: 'content'
          click_button 'Search'
        end

        expect(page).to have_current_path(search_path(term: 'content'))

        articles = find_all 'article'
        expect(articles.size).to eq 1

        within articles.first do
          expect(page).to have_css 'h2', text: Page.last.title
        end
      end
    end


  end

end
