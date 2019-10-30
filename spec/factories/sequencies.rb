FactoryBot.define do
  sequence :string, aliases: %i[title] do |n|
    "some-String-#{n}"
  end

  sequence :integer, aliases: %i[copies_in_stock] do |n|
    n
  end
end
