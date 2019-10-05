# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:branch) { build(:branch, state: :FL, name: 'Florida') }
  let(:location) { build(:location, state: :FL) }
  let(:event) do
    build(
      :event,
      branch: branch,
      location: location,
      start: 5.days.ago,
      end: 3.days.ago
    )
  end
  let(:response_body) { JSON.parse(response.body) }

  before do
    branch.save!
    location.save!
    event.save!
  end

  describe '#index' do
    context 'with no filter' do
      it 'retrieves all events' do
        get :index
        expect(response_body.first['id']).to eq(event.id)
      end
    end

    context 'with branch filter' do
      it 'retrieves matching branches' do
        get :index, params: { branches: ['Florida'] }
        expect(response_body.first['id']).to eq(event.id)
      end

      it 'does not return unmatched branches' do
        get :index, params: { branches: ['Texas'] }
        expect(response_body).to be_empty
      end
    end

    context 'with after filter' do
      it 'retrieves matching events' do
        get :index, params: { after: 7.days.ago }
        expect(response_body.first['id']).to eq(event.id)
      end

      it 'does not return unmatched events' do
        get :index, params: { after: 1.days.ago }
        expect(response_body).to be_empty
      end
    end

    context 'with before filter' do
      it 'retrieves matching events' do
        get :index, params: { before: 4.days.ago }
        expect(response_body.first['id']).to eq(event.id)
      end

      it 'does not return unmatched events' do
        get :index, params: { before: 10.days.ago }
        expect(response_body).to be_empty
      end
    end

    context 'with combo before-after filter' do
      it 'retrieves matching events' do
        get :index, params: { after: 8.days.ago, before: 2.days.ago }
        expect(response_body.first['id']).to eq(event.id)
      end
    end
  end
end
