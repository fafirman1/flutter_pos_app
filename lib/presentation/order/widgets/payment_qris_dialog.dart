import 'package:flutter/material.dart';
import 'package:flutter_pos_app/core/extensions/build_context_ext.dart';

import '../../../core/components/spaces.dart';
import '../../../core/constants/colors.dart';


class PaymentQrisDialog extends StatefulWidget {
  const PaymentQrisDialog({super.key});

  @override
  State<PaymentQrisDialog> createState() => _PaymentQrisDialogState();
}

class _PaymentQrisDialogState extends State<PaymentQrisDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      contentPadding: const EdgeInsets.all(0),
      backgroundColor: AppColors.primary,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Pembayaran QRIS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          const SpaceHeight(6.0),
          Container(
            width: context.deviceWidth,
            padding: const EdgeInsets.all(14.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: AppColors.white,
            ),
            child:  Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // SizedBox(
                //   width: 256.0,
                //   height: 256.0,
                //   child: QrImageView(
                //     data: 's.id/batch11',
                //     version: QrVersions.auto,
                //   ),
                // ),
                Container(
                  width: 256,
                  height: 256,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                  ),
                  child: const Center(
                    child: Text(
                      'QRIS', 
                      style: TextStyle(
                        fontSize: 24, 
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                ),
                const SpaceHeight(5.0),
                const Text(
                  'Scan QRIS untuk melakukan pembayaran',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
