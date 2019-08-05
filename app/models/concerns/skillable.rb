module Concerns
  module Skillable
    extend ActiveSupport::Concern

    cattr_accessor :skills do
      {
        1 => { category: :wasteland, tier: 1 },
        11 => { category: :wasteland, tier: 2 },
        21 => { category: :wasteland, tier: 3 },
        2 => { category: :wasteland, tier: 1 },
        12 => { category: :wasteland, tier: 2 },
        22 => { category: :wasteland, tier: 3 },
        3 => { category: :wasteland, tier: 1 },
        13 => { category: :wasteland, tier: 2 },
        23 => { category: :wasteland, tier: 3 },
        4 => { category: :wasteland, tier: 1 },
        14 => { category: :wasteland, tier: 2 },
        24 => { category: :wasteland, tier: 3 },
        5 => { category: :wasteland, tier: 1 },
        15 => { category: :wasteland, tier: 2 },
        25 => { category: :wasteland, tier: 3 },
        6 => { category: :wasteland, tier: 1 },
        16 => { category: :wasteland, tier: 2 },
        26 => { category: :wasteland, tier: 3 },
        7 => { category: :wasteland, tier: 1 },
        17 => { category: :wasteland, tier: 2 },
        27 => { category: :wasteland, tier: 3 },
        8 => { category: :wasteland, tier: 1 },
        18 => { category: :wasteland, tier: 2 },
        28 => { category: :wasteland, tier: 3 },
        9 => { category: :wasteland, tier: 1 },
        19 => { category: :wasteland, tier: 2 },
        29 => { category: :wasteland, tier: 3 },
        10 => { category: :wasteland, tier: 1 },
        20 => { category: :wasteland, tier: 2 },
        30 => { category: :wasteland, tier: 3 },

        31 => { category: :combat, tier: 1 },
        32 => { category: :combat, tier: 1 },
        35 => { category: :combat, tier: 1 },
        36 => { category: :combat, tier: 1 },
        37 => { category: :combat, tier: 1 },
        38 => { category: :combat, tier: 1 },
        39 => { category: :combat, tier: 1 },
        40 => { category: :combat, tier: 1 },
        33 => { category: :combat, tier: 1 },
        42 => { category: :combat, tier: 2 },
        52 => { category: :combat, tier: 3 },
        34 => { category: :combat, tier: 1 },
        45 => { category: :combat, tier: 2 },
        55 => { category: :combat, tier: 3 },
        43 => { category: :combat, tier: 2 },
        53 => { category: :combat, tier: 3 },
        46 => { category: :combat, tier: 2 },
        56 => { category: :combat, tier: 3 },
        47 => { category: :combat, tier: 2 },
        57 => { category: :combat, tier: 3 },
        48 => { category: :combat, tier: 2 },
        58 => { category: :combat, tier: 3 },
        44 => { category: :combat, tier: 2 },
        54 => { category: :combat, tier: 3 },
        49 => { category: :combat, tier: 2 },
        59 => { category: :combat, tier: 3 },
        50 => { category: :combat, tier: 2 },
        60 => { category: :combat, tier: 3 },
        41 => { category: :combat, tier: 2 },
        51 => { category: :combat, tier: 3 },

        61 => { category: :civilized, tier: 1 },
        71 => { category: :civilized, tier: 2 },
        81 => { category: :civilized, tier: 3 },
        62 => { category: :civilized, tier: 1 },
        72 => { category: :civilized, tier: 2 },
        82 => { category: :civilized, tier: 3 },
        63 => { category: :civilized, tier: 1 },
        73 => { category: :civilized, tier: 2 },
        83 => { category: :civilized, tier: 3 },
        64 => { category: :civilized, tier: 1 },
        74 => { category: :civilized, tier: 2 },
        84 => { category: :civilized, tier: 3 },
        65 => { category: :civilized, tier: 1 },
        75 => { category: :civilized, tier: 2 },
        85 => { category: :civilized, tier: 3 },
        66 => { category: :civilized, tier: 1 },
        76 => { category: :civilized, tier: 2 },
        86 => { category: :civilized, tier: 3 },
        67 => { category: :civilized, tier: 1 },
        77 => { category: :civilized, tier: 2 },
        87 => { category: :civilized, tier: 3 },
        68 => { category: :civilized, tier: 1 },
        78 => { category: :civilized, tier: 2 },
        88 => { category: :civilized, tier: 3 },
        69 => { category: :civilized, tier: 1 },
        79 => { category: :civilized, tier: 2 },
        89 => { category: :civilized, tier: 3 },
        70 => { category: :civilized, tier: 1 },
        80 => { category: :civilized, tier: 2 },
        90 => { category: :civilized, tier: 3 },

        91 => { category: :anomaly, tier: 1 },
        101 => { category: :anomaly, tier: 2 },
        111 => { category: :anomaly, tier: 3 },
        92 => { category: :anomaly, tier: 1 },
        102 => { category: :anomaly, tier: 2 },
        112 => { category: :anomaly, tier: 3 },
        93 => { category: :anomaly, tier: 1 },
        103 => { category: :anomaly, tier: 2 },
        113 => { category: :anomaly, tier: 3 },
        94 => { category: :anomaly, tier: 1 },
        104 => { category: :anomaly, tier: 2 },
        114 => { category: :anomaly, tier: 3 },
        95 => { category: :anomaly, tier: 1 },
        105 => { category: :anomaly, tier: 2 },
        115 => { category: :anomaly, tier: 3 },
        96 => { category: :anomaly, tier: 1 },
        106 => { category: :anomaly, tier: 2 },
        116 => { category: :anomaly, tier: 3 },
        97 => { category: :anomaly, tier: 1 },
        107 => { category: :anomaly, tier: 2 },
        117 => { category: :anomaly, tier: 3 },
        98 => { category: :anomaly, tier: 1 },
        108 => { category: :anomaly, tier: 2 },
        118 => { category: :anomaly, tier: 3 },
        99 => { category: :anomaly, tier: 1 },
        109 => { category: :anomaly, tier: 2 },
        119 => { category: :anomaly, tier: 3 },
        100 => { category: :anomaly, tier: 1 },
        110 => { category: :anomaly, tier: 2 },
        120 => { category: :anomaly, tier: 3 },
      }
    end

    def compute_skill_xp
      Hash[
        *skill_ids
          .map { |id| skills[id] } # obtain only acquired skills
          .map { |x| Hash[x[:category], x[:tier]] } # split by category and tier
          .group_by { |x| x.keys.first } # group by category
          .map { |k, v| Hash[k, v.map { |x| x.values.first }] } # split the tier in each category
          .map { |x| Hash[x.keys.first, x.values.first.group_by { |d| d }] } # group the tier in each category
          .map { |x| x.map { |k, v| [k, v.map { |l, w| Hash[l, w.count] } ] } }.flatten(2) # count the tier in each category
      ].values.flatten.map { |x| x.map { |t, c| arithmetic_sum(t, c) } }.flatten.reduce(0) { |a, b| a + b } # tally and sum
    end

    def arithmetic_sum(tier, count)
      count * (2 * (tier + 1) + (count - 1) * (tier + 1)) / 2
    end
  end
end

# y.map{ |k,v| [k, v.map { |x| x.map { |t, c| Hash[t, arithmetic_sum(t, c)] } } ] }