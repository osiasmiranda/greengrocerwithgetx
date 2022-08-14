import 'package:flutter/material.dart';

import '../../config/custom_colors.dart';
import '../../model/item_model.dart';
import '../../services/utils_services.dart';
import '../widgets/common/quantity_widget.dart';

class ProductScreen extends StatefulWidget {
  final ItemModel item;

  const ProductScreen({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final UtilsServices utilsServices = UtilsServices();
  int cartItemQuantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Stack(
        children: [
          //#Conteúdo
          Column(
            children: [
              Expanded(
                child: Hero(
                  tag: widget.item.imgUrl,
                  child: Image.asset(widget.item.imgUrl),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        offset: const Offset(0, 2),
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //#Nome - Quantidade
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.item.itemName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          QuantityWidget(
                            suffixText: widget.item.unit,
                            value: cartItemQuantity,
                            result: ((quantity) {
                              setState(() {
                                cartItemQuantity = quantity;
                              });
                            }),
                          )
                        ],
                      ),
                      //#Preço
                      Row(
                        children: [
                          Text(
                            utilsServices.priceToCurrency(widget.item.price),
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: CustomColors.customSwatchColor,
                            ),
                          ),
                          Text(
                            '/${widget.item.unit}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade500,
                              // color: CustomColors.customSwatchColor.shade500,
                            ),
                          ),
                        ],
                      ),

                      //#Descrição
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            widget.item.description,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              height: 1.5,
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                      ),
                      //#Bottom
                      SizedBox(
                        height: 55,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {},
                          label: Text(
                            'Adicionar ao carrinho'.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          icon: const Icon(
                            Icons.add_shopping_cart_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: 10,
            left: 10,
            child: SafeArea(
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
