RSpec.describe Character, type: :model do
  describe '#compute_skill_xp' do
    describe 'no skill' do
      let(:char) { build(:character) }
      it { expect(char.compute_skill_xp).to eq(0) }
    end
    describe 'single skill' do
      let(:char) { build(:character, skill_ids: [67]) }
      it { expect(char.compute_skill_xp).to eq(2) }
    end
    describe 'single category dual tier' do
      let(:char) { build(:character, skill_ids: [91,101]) }

      it { expect(char.compute_skill_xp).to eq(5) }
      # anomaly: { 1: [91], 2: [101]}
    end
    describe 'dual category single tier' do
      let(:char) { build(:character, skill_ids: [61,91]) }
      it { expect(char.compute_skill_xp).to eq(4) }
      # civilized: { 1: [61] }
      # anomaly: { 1: [91] }
      # total => 2 + 2 = 4
    end
    describe 'dual category multi tier' do
      let(:char) { build(:character, skill_ids: [61,71,91,101,111]) }
      # civilized: { 1: [61], 2: [71] } => 2 + 3 = 5
      # anomaly: { 1: [91], 2: [101], 3: [111] } => 2 + 3 + 4 = 9
      # total => 5 + 9 = 14
      it { expect(char.compute_skill_xp).to eq(14) }
    end

    describe 'crazy stuffs' do
      let(:char) { build(:character, skill_ids: [1,11,21,2,12,22,31,61,99,98]) }

      it { expect(char.compute_skill_xp).to eq(37) }
      # wasteland: { 1: [1,2], 2: [11,12], 3: [21,22] } => 6 + 9 + 12 = 27
      # combat: { 1: [31] } => 2
      # civilized: { 1: [61] } => 2
      # anomaly: { 1: [99,98] } => 6
      # total = 27 + 2 + 2 + 6 = 37
    end
  end

  describe '#validates_dependencies' do
    before { char.validates_dependencies }
    describe 'no skill' do
      let(:char) { build(:character) }
      it { expect(char.errors.messages.length).to eq(0) }
    end
    describe 'single skill' do
      let(:char) { build(:character, skill_ids: [31]) }
      it { expect(char.errors.messages.length).to eq(0) }
    end
    describe 'missing T1' do
      let(:char) { build(:character, skill_ids: [45]) }
      it { expect(char.errors.messages.length).to eq(1) }
    end
    describe 'missing T2' do
      let(:char) { build(:character, skill_ids: [91, 111]) }
      it { expect(char.errors.messages.length).to eq(1) }
    end
    describe 'included T1->3' do
      let(:char) { build(:character, skill_ids: [91, 101, 111]) }
      it { expect(char.errors.messages.length).to eq(0) }
    end
    describe 'innate T2' do
      let(:char) { build(:character, skill_ids: [43]) }
      it { expect(char.errors.messages.length).to eq(0) }
    end
    describe 'innate T2 but missing T2' do
      let(:char) { build(:character, skill_ids: [53]) }
      it { expect(char.errors.messages.length).to eq(1) }
    end
  end
end
