# As a visitor,
# When I visit a market's show page 'markets/:id'
# I see that market's name and readable address
# And I also see a list of all the Vendors that are at that market
# Each vendor name is a link to that vendor's show page

require 'rails_helper'

RSpec.describe 'Merchants Show Page', type: :feature do
  describe 'As a visitor' do
    describe 'When I visit a markets show page "/markets/:id"' do
      it 'Then I will see that markets name and readable address as well asa list of all the vendors that are at that market as a link to the vendors show page', :vcr do
        build_list(:vendor, 10)
        
        market = build(:market)
 
        visit "/markets/#{market.market_id}"

        expect(page.status_code). to eq(200)

        expect(page).to have_content('2nd Street Farmers Market')
        expect(page).to have_content("194 second street")
        expect(page).to have_content("Amherst, Virgina 24521")
        expect(page).to have_content('Vendors At Our Market:')
        expect(page).to have_link('Orange Country Olive Oil')
        expect(page).to have_link('The Vodka Vault')    
      end
    end
  end
end