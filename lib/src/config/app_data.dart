import '../model/cart_item_model.dart';
import '../model/item_model.dart';
import '../model/order_model.dart';
import '../model/user_model.dart';

ItemModel apple = ItemModel(
  description:
      'A melhor maçã da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  imgUrl: 'assets/fruits/maca.png',
  itemName: 'Maçã',
  price: 5.5,
  unit: 'kg',
);

ItemModel grape = ItemModel(
  imgUrl: 'assets/fruits/uva.png',
  itemName: 'Uva',
  price: 7.4,
  unit: 'kg',
  description:
      'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel guava = ItemModel(
  imgUrl: 'assets/fruits/goiaba.png',
  itemName: 'Goiaba',
  price: 11.5,
  unit: 'kg',
  description:
      'A melhor goiaba da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel kiwi = ItemModel(
  imgUrl: 'assets/fruits/kiwi.png',
  itemName: 'Kiwi',
  price: 2.5,
  unit: 'un',
  description:
      'O melhor kiwi da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel mango = ItemModel(
  imgUrl: 'assets/fruits/manga.png',
  itemName: 'Manga',
  price: 2.5,
  unit: 'un',
  description:
      'A melhor manga da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel papaya = ItemModel(
  imgUrl: 'assets/fruits/mamao.png',
  itemName: 'Mamão papaya de manaus para brasil',
  price: 8,
  unit: 'kg',
  description:
      'O melhor mamão da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

// Lista de produtos
List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

List<String> categories = [
  'Frutas',
  'Grãos',
  'Verduras',
  'Temperos',
  'Cereais',
];

List<CartItemModel> cartItems = [
  CartItemModel(
    item: apple,
    quantity: 1,
  ),
  CartItemModel(
    item: papaya,
    quantity: 1,
  ),
  CartItemModel(
    item: grape,
    quantity: 3,
  ),
  CartItemModel(
    item: kiwi,
    quantity: 1,
  ),
  CartItemModel(
    item: mango,
    quantity: 1,
  ),
  CartItemModel(
    item: guava,
    quantity: 1,
  ),
  CartItemModel(
    item: kiwi,
    quantity: 1,
  ),
  CartItemModel(
    item: kiwi,
    quantity: 1,
  ),
];

UserModel userModel = UserModel(
  email: 'osiasmiranda@gmail.com',
  name: 'Osias Miranda',
  phone: '(92) 99102-0034',
  cpf: '123.456.789-00',
  password: '',
);

List<OrderModel> orders = [
  //@ Pedido 01
  OrderModel(
    copyAndPaste: 'q1w2e3r4t5y6',
    createdDateTime: DateTime.parse(
      '2022-06-26 10:00:10.458',
    ),
    overdueDateTime: DateTime.parse(
      '2023-07-31 11:00:10.458',
    ),
    id: 'asd6a54da6s2d1',
    status: 'pending_payment',
    total: 11.0,
    items: [
      CartItemModel(
        item: apple,
        quantity: 2,
      ),
      CartItemModel(
        item: mango,
        quantity: 2,
      ),
      CartItemModel(
        item: papaya,
        quantity: 5,
      ),
    ],
  ),

  //@ Pedido 02
  OrderModel(
    copyAndPaste: 'q1w2e3r4t5y6',
    createdDateTime: DateTime.parse(
      '2022-07-26 10:00:10.458',
    ),
    overdueDateTime: DateTime.parse(
      '2022-07-28 11:00:10.458',
    ),
    id: 'a65s4d6a2s1d6a5s',
    status: 'preparing_purchase',
    total: 11.5,
    items: [
      CartItemModel(
        item: guava,
        quantity: 1,
      ),
    ],
  ),
  //@Pedido 03
  OrderModel(
    copyAndPaste: 'q1w2e3r4t5y554',
    createdDateTime: DateTime.parse(
      '2022-07-25 10:00:10.458',
    ),
    overdueDateTime: DateTime.parse(
      '2022-07-28 11:00:10.458',
    ),
    id: 'a65s4d6a2s1d6a5s',
    status: 'delivered',
    total: 11.5,
    items: [
      CartItemModel(
        item: papaya,
        quantity: 1,
      ),
    ],
  ),
];
