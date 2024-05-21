require 'rails_helper'

# [type: :feature]
# Automatically Include Helpers:
# It includes the necessary Capybara helpers and configuration settings that are specific to feature tests.
# This means methods like `visit, click_on, find_all, within` are available without needing to include them explicitly.
RSpec.describe 'Archives', type: :feature do

  describe "Results page" do
    before do
      create(:page, :published, created_at: '2022-05-10')
    end

    it "renders archives search results" do
      visit root_path
      click_on 'May 2022'

      articles = find_all 'article'
      expect(articles.size).to eq(1)

      within articles.first do
        expect(page).to have_css 'h2', text: Page.last.title
      end
    end
  end
end
