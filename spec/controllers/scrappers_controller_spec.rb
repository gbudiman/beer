require 'rails_helper'

RSpec.describe ScrappersController, type: :controller do
  subject(:scrap!) do
    post :branches
  end

  it 'scraps' do
    scrap!
  end
end
