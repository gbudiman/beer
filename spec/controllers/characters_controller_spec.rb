require 'rails_helper'

RSpec.describe CharactersController, type: :controller do
  let(:response_body) { JSON.parse(response.body).deep_symbolize_keys }

  it 'responds to skill XP properly' do
    post(:xp, params: { skill_ids: [1,2,3] })
    expect(response_body[:skill_xp]).to eq(12)
    expect(response_body[:errors].length).to eq(0)
  end

  it 'responds with errors on invalid request' do
    post(:xp, params: { skill_ids: [1,21] })
    expect(response_body[:skill_xp]).to eq(nil)
    expect(response_body[:errors].length).to eq(1)
  end

  it 'ignores invalid skill ID' do
    post(:xp, params: { skill_ids: [-7, 1] })
    expect(response_body[:skill_xp]).to eq(2)
    expect(response_body[:errors].length).to eq(0)
  end

  it 'responds to non-array skill_ids' do
    post(:xp, params: { skill_ids: 2 })
    expect(response_body[:skill_xp]).to eq(2)
    expect(response_body[:errors].length).to eq(0)
  end

  it 'responds to null body request' do
    post(:xp)
    expect(response_body[:skill_xp]).to eq(0)
    expect(response_body[:errors].length).to eq(0)
  end

  it 'responds to stat XP properly' do
    post(:xp, params: { body: 7, mind: 7, resolve: 1, infection: 1 })
    expect(response_body[:stat_xp]).to eq(34)
    expect(response_body[:errors].length).to eq(0)
  end
end
