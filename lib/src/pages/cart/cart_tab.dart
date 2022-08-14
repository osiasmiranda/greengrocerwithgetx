import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/app_data.dart' as app_data;

import '../../config/custom_colors.dart';
import '../../model/cart_item_model.dart';
import '../../services/utils_services.dart';
import '../widgets/common/payment_dialog.dart';
import 'components/cart_tile.dart';

class CartTab extends StatefulWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilsServices utilsServices = UtilsServices();

  void removeItemFromCart(CartItemModel cartItem) {
    setState(
      () {
        app_data.cartItems.remove(cartItem);
        utilsServices.showToast(
            message: '${cartItem.item.itemName} removido(a) do carrinho');
      },
    );
  }

  double cartTotalPrice() {
    double total = 0;

    for (var item in app_data.cartItems) {
      total += item.totalPrice();
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: app_data.cartItems.length,
              itemBuilder: (_, index) {
                return CartTile(
                  cartItem: app_data.cartItems[index],
                  remove: removeItemFromCart,
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Total Geral',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  utilsServices.priceToCurrency(cartTotalPrice()),
                  style: TextStyle(
                    fontSize: 23,
                    color: CustomColors.customSwatchColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: CustomColors.customSwatchColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () async {
                      bool? result = await showOrderConfirmation();
                      if (result ?? false) {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return PaymentDialog(
                              order: app_data.orders.first,
                            );
                          },
                        );
                      } else {
                        utilsServices.showToast(
                            message: 'Pedido não confirmado', isError: true);
                      }
                    },
                    child: const Text(
                      'CONCLUIR PEDIDO',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('CONFIRMAÇÃO'),
          content: const Text('Deseja confirmar o pedido?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Não'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Sim'),
            ),
          ],
        );
      },
    );
  }
}
