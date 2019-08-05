require 'rails_helper'

RSpec.describe CharactersController, type: :controller do
  let(:response_body) { JSON.parse(response.body).deep_symbolize_keys }

  it 'responds properly' do
    post(:xp, params: { skill_ids: [1,2,3] })
    expect(response_body[:skill_xp]).to eq(12)
    expect(response_body[:errors].length).to eq(0)
  end

  it 'responds with errors on invalid request' do
    post(:xp, params: { skill_ids: [1,21] })
    expect(response_body[:skill_xp]).to eq(nil)
    expect(response_body[:errors].length).to eq(1)
  end
end
