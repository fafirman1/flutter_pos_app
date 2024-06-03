import 'package:flutter/material.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/spaces.dart';
import '../../../core/constants/colors.dart';
import '../../home/models/product_model.dart';


class MenuProductItem extends StatelessWidget {
  final ProductModel data;
  const MenuProductItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 3, color: AppColors.blueLight),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: Image.asset(data.image,
                width: 74.0, height: 74.0, fit: BoxFit.cover),
          ),
          const SpaceWidth(22.0),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SpaceHeight(5.0),
                Text(
                  data.category.value,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SpaceHeight(10.0),
                Row(
                  children: [
                    Flexible(
                      child: Button.outlined(
                        onPressed: () {},
                        label: 'Detail',
                        fontSize: 8.0,
                        height: 31,
                      ),
                    ),
                    const SpaceWidth(6.0),
                    Flexible(
                      child: Button.outlined(
                        onPressed: () {
                          // context.push(EditProductPage(data: data));
                        },
                        label: 'Ubah Produk',
                        fontSize: 8.0,
                        height: 31,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
