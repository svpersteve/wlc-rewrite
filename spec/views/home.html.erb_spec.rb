require 'rails_helper'

RSpec.describe 'pages/home.html.erb' do
  let(:next_meetup) { nil }
  let(:venue) { nil }

  before do
    assign(:next_meetup, next_meetup)
  end

  context 'when there is no upcoming meetup scheduled' do
    it 'shows a generic invitation to join us' do
      render
      expect(rendered).to have_content('Join us at our next meetup')
    end

    it 'shows YNAP as the default venue' do
      render
      expect(rendered).to have_link('1 THE VILLAGE OFFICES, WESTFIELD, WHITE CITY, LONDON', href: "http://maps.google.com/?q=1 THE VILLAGE OFFICES, WESTFIELD, ARIEL WAY LONDON, London")
    end
  end

  context 'when there is an upcoming meetup' do
    let(:scheduled_meetup) {
      {
        "venue" => venue,
        "time" => 1516455000000,
        "yes_rsvp_count" => 7
      }
    }
    let(:net_a_porter_venue) {
      {
        "name" => "YNAP",
        "address_1" => '1 THE VILLAGE OFFICES'
      }
    }

    let(:next_meetup) { scheduled_meetup }
    let(:venue) { net_a_porter_venue }

    it 'shows the date of the next meetup' do
      render
      expect(rendered).to have_content('Saturday 20th January at YNAP')
    end

    it 'shows the number of people attending the next meetup' do
      render
      expect(rendered).to have_content('Join 7 others')
    end

    it 'shows the venue address for the next meetup' do
      render
      expect(rendered).to have_link('1 THE VILLAGE OFFICES', href: "http://maps.google.com/?q=1 THE VILLAGE OFFICES")
    end
  end
end
