# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Branch, type: :model do
  let(:branch) { build(:branch) }

  context 'with unspecified state' do
    it 'creates branch with default unspecified state' do
      branch.save!
      expect(branch.state).to eq('UNSPECIFIED')
    end
  end

  context 'with specified state' do
    let(:branch) { build(:branch, state: state) }

    %w[MA NM SOCAL NORCAL NATIONAL].each do |region|
      context "with #{region}" do
        let(:state) { region }
        it "creates branch with state #{region}" do
          branch.save!
          expect(branch.state).to eq(region)
        end
      end
    end
  end
end
