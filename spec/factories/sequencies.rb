FactoryBot.define do
  sequence :string, aliases: %i[title name] do |n|
    "some-String-#{n}"
  end

  sequence :integer, aliases: %i[copies_in_stock books_sold_count] do |n|
    n
  end
end
