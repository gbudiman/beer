# frozen_string_literal: true

module Concerns
  module Regionable
    extend ActiveSupport::Concern

    REGIONS = {
      UNSPECIFIED: 0,
      NATIONAL: 1,
      NA: 1,
      AL: 2,
      AK: 3,
      AS: 4,
      AZ: 5,
      AR: 6,
      CA: 7,
      SOCAL: 7,
      NOCA: 7,
      CO: 8,
      CT: 9,
      DE: 10,
      DC: 11,
      FL: 12,
      GA: 13,
      ATL: 13,
      GU: 14,
      HI: 15,
      ID: 16,
      IL: 17,
      IN: 18,
      IA: 19,
      KS: 20,
      KY: 21,
      LA: 22,
      ME: 23,
      MD: 24,
      MH: 25,
      MA: 26,
      MI: 27,
      FM: 28,
      MN: 29,
      MS: 30,
      MO: 31,
      MT: 32,
      NE: 33,
      NV: 34,
      NH: 35,
      NJ: 36,
      NM: 37,
      NY: 38,
      NC: 39,
      ND: 40,
      MP: 41,
      OH: 42,
      OK: 43,
      OR: 44,
      PW: 45,
      PA: 46,
      PR: 47,
      RI: 48,
      SC: 49,
      SD: 50,
      TN: 51,
      TX: 52,
      UT: 53,
      VT: 54,
      VA: 55,
      VI: 56,
      WA: 57,
      WV: 58,
      WI: 59,
      WY: 60,
      AB: 61,
      BC: 62,
      MB: 63,
      NB: 64,
      NL: 65,
      NT: 66,
      NS: 67,
      NU: 68,
      ON: 69,
      TO: 69,
      PE: 70,
      QC: 71,
      SK: 72,
      YT: 73
    }.with_indifferent_access
  end
end
