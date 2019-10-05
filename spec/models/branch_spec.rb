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

    [['MA'],
     ['NM'],
     %w[SOCAL CA],
     %w[NOCA CA],
     ['NATIONAL']].each do |region|
      context "with #{region[0]}" do
        let(:state) { region[0] }
        it "creates branch with state #{region[1] || region[0]}" do
          branch.save!
          expect(branch.state).to eq(region[1] || region[0])
        end
      end
    end
  end
end
