# As a visitor,
# When I visit '/markets'
# I see all markets listed with their name, city and state
# When I click a button to see more info on that market
# I'm taken to that market's show page '/markets/:id'

require 'rails_helper'

RSpec.describe 'Merchants Index Page', type: :feature do
  describe 'As a visitor' do
    describe 'When I visit "/markets"' do
      it 'Then I will see all markets listed with their name, city, and state', :vcr do
        visit '/markets'
        expect(page.status_code). to eq(200)

        expect(page).to have_content('Markets')
        expect(page).to have_button('More Info')
        expect(page).to have_content('')
        expect(page).to have_content('')
        expect(page).to have_content('')
        expect(page).to have_content('')
        
      end
    end

    describe 'When I click a button to see more info on that market' do
      it 'Then I am taken to that markets show page "/markets/:id"', :vcr do
        visit '/markets'
        expect(page.status_code). to eq(200)

        expect(page).to have_content('Markets')
        expect(page).to have_button('More Info')

        click_button 'More Info'

        expect(current_path).to eq("/markets/#{market.id}")
      end
    end
  end
end

