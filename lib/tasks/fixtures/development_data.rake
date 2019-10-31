namespace :data_migrations do
  desc 'create development seeds'
  task development_data: :environment do
    publisher = Publisher.find_or_create_by!(title: 'pub_title')

    shop_one = Shop.find_or_create_by!(name: 'shop1')
    shop_two = Shop.find_or_create_by!(name: 'shop2')

    book_one = Book.find_or_create_by!(title: 'book1', publisher: publisher)
    book_two = Book.find_or_create_by!(title: 'book2', publisher: publisher)

    BooksShop.find_or_create_by!(book: book_one, shop: shop_one, copies_in_stock: 3)
    BooksShop.find_or_create_by!(book: book_one, shop: shop_two, copies_in_stock: 0)
    BooksShop.find_or_create_by!(book: book_two, shop: shop_two, copies_in_stock: 5)
  end
end
