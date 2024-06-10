// import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
// import 'package:flutter_pos_app/core/extensions/int_ext.dart';
// import 'package:intl/intl.dart';

// import '../../presentation/home/models/order_item.dart';

// class CwbPrint {
//   CwbPrint._init();

//   static final CwbPrint instance = CwbPrint._init();

//   Future<List<int>> printOrder(
//     List<OrderItem> products,
//     int totalQuantity,
//     int totalPrice,
//     String paymentMethod,
//     int nominalBayar,
//     String namaKasir
    
//   ) async {
//     List<int> bytes = [];

//     final profile = await CapabilityProfile.load();
//     final generator = Generator(PaperSize.mm58, profile);

//     bytes += generator.reset();
//     bytes += generator.text('MOKO WARDAH PARFUM',
//         styles: const PosStyles(
//           bold: true,
//           align: PosAlign.center,
//           height: PosTextSize.size4,
//           width: PosTextSize.size4,
//         ));

//     bytes += generator.text('Jl. Jenderal Sudirman, Kalirejo',
//         styles: const PosStyles(bold: true, align: PosAlign.center));
//    bytes += generator.text(
//           'Date : ${DateFormat('dd-MM-yyyy HH:mm').format(DateTime.now())}',
//           styles: const PosStyles(bold: false, align: PosAlign.center));

//     bytes += generator.feed(1);
//     bytes += generator.text('Pesanan:',
//         styles: const PosStyles(bold: false, align: PosAlign.center));

//     //for from data
//     for (final product in products){
//       bytes += generator.text(product.product.name,
//         styles: const PosStyles(align: PosAlign.left));

//       bytes += generator.row([
//         PosColumn(
//           text: '${product.product.price} x ${product.quantity}',
//           width: 8,
//           styles: const PosStyles(align: PosAlign.left),
//         ),
//         PosColumn(
//           text: '${product.product.price * product.quantity}',
//           width: 4,
//           styles: const PosStyles(align: PosAlign.right),
//         ),
//       ],);
//     }
//     bytes += generator.feed(1);

//     bytes += generator.row([
//       PosColumn(
//         text: 'Total',
//         width: 6,
//         styles: const PosStyles(align: PosAlign.left),
//       ),
//       PosColumn(
//         text: totalPrice.currencyFormatRp,
//         width: 6,
//         styles: const PosStyles(align: PosAlign.right),
//       ),
//     ]);

//     bytes += generator.row([
//       PosColumn(
//         text: 'Bayar',
//         width: 6,
//         styles: const PosStyles(align: PosAlign.left),
//       ),
//       PosColumn(
//         text: nominalBayar.currencyFormatRp,
//         width: 6,
//         styles: const PosStyles(align: PosAlign.right),
//       ),
//     ]);

//     bytes += generator.row([
//       PosColumn(
//         text: 'Pembayaran',
//         width: 8,
//         styles: const PosStyles(align: PosAlign.left),
//       ),
//       PosColumn(
//         text: paymentMethod,
//         width: 4,
//         styles: const PosStyles(align: PosAlign.right),
//       ),
//     ]);

//     bytes += generator.feed(1);
//     bytes += generator.text('Terimakasih.',
//         styles: const PosStyles(bold: false, align: PosAlign.center));
//     bytes += generator.feed(3);

//     return bytes;
//   }
// }
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter_pos_app/core/extensions/int_ext.dart';
import 'package:intl/intl.dart';
// import 'package:image/image.dart' as img;
// import 'dart:typed_data';
// import 'package:flutter/services.dart' show rootBundle;

import '../../presentation/home/models/order_item.dart';

class CwbPrint {
  CwbPrint._init();

  static final CwbPrint instance = CwbPrint._init();

  Future<List<int>> printOrder(
    List<OrderItem> products,
    int totalQuantity,
    int totalPrice,
    String paymentMethod,
    int nominalBayar,
    String namaKasir
  ) async {
    List<int> bytes = [];

    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm58, profile);

    // // Load the image
    // final ByteData data = await rootBundle.load('assets/images/logo.png');
    // final Uint8List imgBytes = data.buffer.asUint8List();
    // final img.Image? image = img.decodeImage(imgBytes);

    // if (image != null) {
    //   // Resize the image to fit the paper width (384 pixels for 58mm paper width)
    //   final img.Image resizedImage = img.copyResize(image, width: 384);
    //   bytes += generator.image(resizedImage);
    // }

    bytes += generator.reset();
    bytes += generator.text('MOKO WARDAH PARFUM',
        styles: const PosStyles(
          bold: true,
          align: PosAlign.center,
          height: PosTextSize.size1,
          width: PosTextSize.size1,
        ));
    bytes += generator.text('Jl. Jenderal Sudirman, Kalirejo',
        styles: const PosStyles(bold: true, align: PosAlign.center));
    bytes += generator.text(
          'Date : ${DateFormat('dd-MM-yyyy HH:mm').format(DateTime.now())}',
          styles: const PosStyles(bold: false, align: PosAlign.center));
    bytes += generator.feed(1);
    bytes += generator.text('Pesanan:',
        styles: const PosStyles(bold: false, align: PosAlign.center));

    for (final product in products) {
      bytes += generator.text(product.product.name,
        styles: const PosStyles(align: PosAlign.left));
      bytes += generator.row([
        PosColumn(
          text: '${product.product.price} x ${product.quantity}',
          width: 8,
          styles: const PosStyles(align: PosAlign.left),
        ),
        PosColumn(
          text: '${(product.product.price * product.quantity).currencyFormatRp}',
          width: 4,
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]);
    }
    bytes += generator.feed(1);

    bytes += generator.row([
      PosColumn(
        text: 'Total',
        width: 6,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: totalPrice.currencyFormatRp,
        width: 6,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);

    bytes += generator.row([
      PosColumn(
        text: 'Bayar',
        width: 6,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: nominalBayar.currencyFormatRp,
        width: 6,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);

    bytes += generator.row([
      PosColumn(
        text: 'Pembayaran',
        width: 8,
        styles: const PosStyles(align: PosAlign.left),
      ),
      PosColumn(
        text: paymentMethod,
        width: 4,
        styles: const PosStyles(align: PosAlign.right),
      ),
    ]);

    bytes += generator.feed(1);
    bytes += generator.text('Terimakasih.',
        styles: const PosStyles(bold: false, align: PosAlign.center));
    bytes += generator.feed(3);

    return bytes;
  }
}

