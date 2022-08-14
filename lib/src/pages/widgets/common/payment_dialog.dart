import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../model/order_model.dart';
import '../../../services/utils_services.dart';

class PaymentDialog extends StatelessWidget {
  final OrderModel order;
  final UtilsServices utilsServices = UtilsServices();
  PaymentDialog({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          //Conteúdo
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //#Título
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Pagamento com Pix',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                //#QR code
                QrImage(
                  data: '1234567890080820221234568940cinhemat',
                  version: QrVersions.auto,
                  size: 200.0,
                ),
                //#Vencimento
                Text(
                  'Vencimento: ${utilsServices.formatDateTime(order.overdueDateTime)}',
                  style: const TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                //#Total
                Text(
                  'Total: ${utilsServices.priceToCurrency(order.total)}',
                  style: const TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                //# Botão Copia e Cola
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    side: const BorderSide(
                      width: 2,
                      color: Colors.green,
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.copy),
                  label: const Text(
                    'Copiar código Pix',
                    style: TextStyle(fontSize: 13.0),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.close,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
