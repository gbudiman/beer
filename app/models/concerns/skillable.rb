# frozen_string_literal: true

module Concerns
  module Skillable
    extend ActiveSupport::Concern

    cattr_accessor :skills do
      {
        1 => { category: :wasteland, tier: 1 },
        11 => { category: :wasteland, tier: 2, dep: 1 },
        21 => { category: :wasteland, tier: 3, dep: 11 },
        2 => { category: :wasteland, tier: 1 },
        12 => { category: :wasteland, tier: 2, dep: 2 },
        22 => { category: :wasteland, tier: 3, dep: 12 },
        3 => { category: :wasteland, tier: 1 },
        13 => { category: :wasteland, tier: 2, dep: 3 },
        23 => { category: :wasteland, tier: 3, dep: 13 },
        4 => { category: :wasteland, tier: 1 },
        14 => { category: :wasteland, tier: 2, dep: 4 },
        24 => { category: :wasteland, tier: 3, dep: 14 },
        5 => { category: :wasteland, tier: 1 },
        15 => { category: :wasteland, tier: 2, dep: 5 },
        25 => { category: :wasteland, tier: 3, dep: 15 },
        6 => { category: :wasteland, tier: 1 },
        16 => { category: :wasteland, tier: 2, dep: 6 },
        26 => { category: :wasteland, tier: 3, dep: 16 },
        7 => { category: :wasteland, tier: 1 },
        17 => { category: :wasteland, tier: 2, dep: 7 },
        27 => { category: :wasteland, tier: 3, dep: 17 },
        8 => { category: :wasteland, tier: 1 },
        18 => { category: :wasteland, tier: 2, dep: 8 },
        28 => { category: :wasteland, tier: 3, dep: 18 },
        9 => { category: :wasteland, tier: 1 },
        19 => { category: :wasteland, tier: 2, dep: 9 },
        29 => { category: :wasteland, tier: 3, dep: 19 },
        10 => { category: :wasteland, tier: 1 },
        20 => { category: :wasteland, tier: 2, dep: 10 },
        30 => { category: :wasteland, tier: 3, dep: 20 },

        31 => { category: :combat, tier: 1 },
        32 => { category: :combat, tier: 1 },
        35 => { category: :combat, tier: 1 },
        36 => { category: :combat, tier: 1 },
        37 => { category: :combat, tier: 1 },
        38 => { category: :combat, tier: 1 },
        39 => { category: :combat, tier: 1 },
        40 => { category: :combat, tier: 1 },
        33 => { category: :combat, tier: 1 },
        42 => { category: :combat, tier: 2, dep: 33 },
        52 => { category: :combat, tier: 3, dep: 42 },
        34 => { category: :combat, tier: 1 },
        45 => { category: :combat, tier: 2, dep: 34 },
        55 => { category: :combat, tier: 3, dep: 45 },
        43 => { category: :combat, tier: 2 },
        53 => { category: :combat, tier: 3, dep: 43 },
        46 => { category: :combat, tier: 2 },
        56 => { category: :combat, tier: 3, dep: 46 },
        47 => { category: :combat, tier: 2 },
        57 => { category: :combat, tier: 3, dep: 47 },
        48 => { category: :combat, tier: 2 },
        58 => { category: :combat, tier: 3, dep: 48 },
        44 => { category: :combat, tier: 2 },
        54 => { category: :combat, tier: 3, dep: 44 },
        49 => { category: :combat, tier: 2 },
        59 => { category: :combat, tier: 3, dep: 49 },
        50 => { category: :combat, tier: 2 },
        60 => { category: :combat, tier: 3, dep: 50 },
        41 => { category: :combat, tier: 2 },
        51 => { category: :combat, tier: 3, dep: 51 },

        61 => { category: :civilized, tier: 1 },
        71 => { category: :civilized, tier: 2, dep: 61 },
        81 => { category: :civilized, tier: 3, dep: 71 },
        62 => { category: :civilized, tier: 1 },
        72 => { category: :civilized, tier: 2, dep: 62 },
        82 => { category: :civilized, tier: 3, dep: 72 },
        63 => { category: :civilized, tier: 1 },
        73 => { category: :civilized, tier: 2, dep: 63 },
        83 => { category: :civilized, tier: 3, dep: 73 },
        64 => { category: :civilized, tier: 1 },
        74 => { category: :civilized, tier: 2, dep: 64 },
        84 => { category: :civilized, tier: 3, dep: 74 },
        65 => { category: :civilized, tier: 1 },
        75 => { category: :civilized, tier: 2, dep: 65 },
        85 => { category: :civilized, tier: 3, dep: 75 },
        66 => { category: :civilized, tier: 1 },
        76 => { category: :civilized, tier: 2, dep: 66 },
        86 => { category: :civilized, tier: 3, dep: 76 },
        67 => { category: :civilized, tier: 1 },
        77 => { category: :civilized, tier: 2, dep: 67 },
        87 => { category: :civilized, tier: 3, dep: 77 },
        68 => { category: :civilized, tier: 1 },
        78 => { category: :civilized, tier: 2, dep: 68 },
        88 => { category: :civilized, tier: 3, dep: 78 },
        69 => { category: :civilized, tier: 1 },
        79 => { category: :civilized, tier: 2, dep: 69 },
        89 => { category: :civilized, tier: 3, dep: 79 },
        70 => { category: :civilized, tier: 1 },
        80 => { category: :civilized, tier: 2, dep: 70 },
        90 => { category: :civilized, tier: 3, dep: 80 },

        91 => { category: :anomaly, tier: 1 },
        101 => { category: :anomaly, tier: 2, dep: 91 },
        111 => { category: :anomaly, tier: 3, dep: 101 },
        92 => { category: :anomaly, tier: 1 },
        102 => { category: :anomaly, tier: 2, dep: 92 },
        112 => { category: :anomaly, tier: 3, dep: 102 },
        93 => { category: :anomaly, tier: 1 },
        103 => { category: :anomaly, tier: 2, dep: 93 },
        113 => { category: :anomaly, tier: 3, dep: 103 },
        94 => { category: :anomaly, tier: 1 },
        104 => { category: :anomaly, tier: 2, dep: 94 },
        114 => { category: :anomaly, tier: 3, dep: 104 },
        95 => { category: :anomaly, tier: 1 },
        105 => { category: :anomaly, tier: 2, dep: 95 },
        115 => { category: :anomaly, tier: 3, dep: 105 },
        96 => { category: :anomaly, tier: 1 },
        106 => { category: :anomaly, tier: 2, dep: 96 },
        116 => { category: :anomaly, tier: 3, dep: 106 },
        97 => { category: :anomaly, tier: 1 },
        107 => { category: :anomaly, tier: 2, dep: 97 },
        117 => { category: :anomaly, tier: 3, dep: 107 },
        98 => { category: :anomaly, tier: 1 },
        108 => { category: :anomaly, tier: 2, dep: 98 },
        118 => { category: :anomaly, tier: 3, dep: 108 },
        99 => { category: :anomaly, tier: 1 },
        109 => { category: :anomaly, tier: 2, dep: 99 },
        119 => { category: :anomaly, tier: 3, dep: 109 },
        100 => { category: :anomaly, tier: 1 },
        110 => { category: :anomaly, tier: 2, dep: 100 },
        120 => { category: :anomaly, tier: 3, dep: 110 }
      }
    end

    def validates_dependencies
      skill_ids.map { |id| skills[id] }.compact.map { |x| x[:dep] }.compact
        .map { |dep| skill_ids.include?(dep) ? nil : errors.add(:base, "Missing dependency: #{dep}") }
    end

    def validates_boundaries
      y = skill_ids.uniq.map { |id| skills[id] }.compact.map { |x| x[:tier] }.uniq
      ap y
    end

    def compute_skill_xp
      Hash[*skill_ids.uniq
        .map { |id| skills[id] }.compact # obtain only acquired skills
        .map { |x| Hash[x[:category], x[:tier]] } # split by category and tier
        .group_by { |x| x.keys.first } # group by category
        .map { |k, v| Hash[k, v.map { |x| x.values.first }] } # split the tier in each category
        .map { |x| Hash[x.keys.first, x.values.first.group_by { |d| d }] } # group the tier in each category
        .map { |x| x.map { |k, v| [k, v.map { |l, w| Hash[l, w.count] }] } }.flatten(2) # count the tier in each category
      ].values.flatten.map { |x| x.map { |t, c| arithmetic_sum(t, c) } }.flatten.reduce(0) { |a, b| a + b } # tally and sum
    end

    def arithmetic_sum(tier, count)
      count * (2 * (tier + 1) + (count - 1) * (tier + 1)) / 2
    end
  end
end
