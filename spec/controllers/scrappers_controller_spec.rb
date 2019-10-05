# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ScrappersController, type: :controller do
  let(:branch_payload) { JSON.parse(IO.read(Rails.root.join('spec', 'samples', 'branches.json'))) }
  let(:branch_wrapper) { OpenStruct.new(parsed_response: branch_payload) }
  let(:location_payload) { JSON.parse(IO.read(Rails.root.join('spec', 'samples', 'locations.json'))) }
  let(:location_wrapper) { OpenStruct.new(parsed_response: location_payload) }
  let(:event_payload) { JSON.parse(IO.read(Rails.root.join('spec', 'samples', 'events_1.json'))) }
  let(:event_wrapper) { OpenStruct.new(parsed_response: event_payload) }

  describe 'branches scrapper' do
    before { allow(HTTParty).to receive(:get).and_return(branch_wrapper) }

    subject(:scrap!) { post :branches }

    it 'scraps and saves' do
      scrap!
      expect(Branch.count).to eq(branch_payload['items'].count)
      expect(Branch.last.id).to eq(branch_payload['items'].count)
    end

    it 'does not double load' do
      scrap!
      scrap!
      expect(Branch.last.id).to eq(branch_payload['items'].count)
    end
  end

  describe 'locations scrapper' do
    before do
      allow(HTTParty).to receive(:get).and_return(branch_wrapper)
      post :branches

      allow(HTTParty).to receive(:get).and_return(location_wrapper)
    end

    subject(:scrap!) { post :locations }

    it 'scraps and saves' do
      scrap!
      expect(Location.count).to eq(location_payload['items'].count - 2)
      expect(Location.last.id).to eq(22)
      expect(BranchLocation.count).to eq(location_payload['items'].count - 2)
    end
  end

  describe 'events scrapper' do
    before do
      allow(HTTParty).to receive(:get).and_return(branch_wrapper)
      post :branches

      allow(HTTParty).to receive(:get).and_return(location_wrapper)
      post :locations

      allow(HTTParty).to receive(:get).and_return(event_wrapper)
    end

    subject(:scrap!) { post :events, params: { page: 1 } }

    it 'scraps and saves' do
      scrap!
      expect(Event.count).to eq(12)
    end
  end
end
