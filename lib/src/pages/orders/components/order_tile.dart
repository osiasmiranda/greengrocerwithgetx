import 'package:flutter/material.dart';
import 'package:greengrocer/src/model/order_model.dart';

import '../../../model/cart_item_model.dart';
import '../../../services/utils_services.dart';
import '../../widgets/common/payment_dialog.dart';
import 'order_status_widget.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;
  final UtilsServices utilsServices = UtilsServices();

  OrderTile({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: order.status == 'pending_payment',
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pedido: ${order.id}'),
              Text(
                utilsServices.formatDateTime(order.createdDateTime),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  //#Lista de Produtos
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        children: order.items.map(
                          ((orderItem) {
                            return _OrderItemWidget(
                              utilsServices: utilsServices,
                              orderItem: orderItem,
                            );
                          }),
                        ).toList(),
                      ),
                    ),
                  ),
                  VerticalDivider(
                    thickness: 1,
                    color: Colors.grey.shade300,
                    width: 8,
                  ),
                  //# Status do pedido
                  Expanded(
                    flex: 2,
                    child: OrderStatusWidget(
                      status: order.status,
                      isOverdue: order.overdueDateTime.isBefore(DateTime.now()),
                    ),
                  ),
                ],
              ),
            ),
            //#Total Pagamento
            Text.rich(
              TextSpan(
                style: const TextStyle(fontSize: 20),
                children: [
                  const TextSpan(
                    text: 'Total ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: utilsServices.priceToCurrency(order.total),
                  ),
                ],
              ),
            ),
            //#Botão Pagamento

            Visibility(
              visible: order.status == 'pending_payment',
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return PaymentDialog(
                        order: order,
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.pix,
                ),
                label: const Text(
                  'Ver QR Code Pix',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget({
    Key? key,
    required this.utilsServices,
    required this.orderItem,
  }) : super(key: key);

  final UtilsServices utilsServices;
  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        children: [
          Text(
            '${orderItem.quantity} ${orderItem.item.unit} - ',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: Text(
              orderItem.item.itemName,
              overflow: TextOverflow.ellipsis,
              // maxLines: 2,
            ),
          ),
          Text(
            utilsServices.priceToCurrency(orderItem.totalPrice()),
          ),
        ],
      ),
    );
  }
}
