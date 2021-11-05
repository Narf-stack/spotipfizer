FactoryBot.define do
  factory :search_reco do
    energy { 1 }
    valence { 1 }
    popularity { 1 }
    genres { "MyText" }
    playlist { nil }
  end
end
