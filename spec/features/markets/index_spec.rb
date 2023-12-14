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
        expect(page).to have_content('Name')
        expect(page).to have_content('City')
        expect(page).to have_content('State')

        within('#market322458') do
          expect(page).to have_content("14&U Farmers' Market")
          expect(page).to have_content('Washington')
          expect(page).to have_content('District of Columbia')
          expect(page).to have_button('More Info')
        end

        within('#market322474') do
          expect(page).to have_content("2nd Street Farmers' Market")
          expect(page).to have_content('Amherst')
          expect(page).to have_content('Virginia')
          expect(page).to have_button('More Info')
        end    
      end
    end

    describe 'When I click a button to see more info on that market' do
      it 'Then I am taken to that markets show page "/markets/:id"', :vcr do  
        visit '/markets'
        
        expect(page.status_code). to eq(200)

        within('#market322458') do
          click_button 'More Info'
          expect(current_path).to eq('/markets/322458')
        end

        visit '/markets'

        within('#market322474') do
          click_button 'More Info'
          expect(current_path).to eq('/markets/322474')
        end
      end
    end
  end
end

