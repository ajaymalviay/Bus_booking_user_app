import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:quick_pay/Components/entry_field.dart';
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/colors.dart';

import '../../Routes/routes.dart';

class ScanQRPage extends StatefulWidget {
  @override
  _ScanQRPageState createState() => _ScanQRPageState();
}

class _ScanQRPageState extends State<ScanQRPage> {

  String _scanBarcode = 'Unknown';

  @override
  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
        '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => print(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
//barcode scanner flutter ant
    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanResult;
    try {
      barcodeScanResult = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanResult);
    } on PlatformException {
      barcodeScanResult = 'Failed to get platform version.';
    }
    if (!mounted) return;
    
    setState(() {
      _scanBarcode = barcodeScanResult;
    });
  }

  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        centerTitle: true,
        iconTheme: IconThemeData(color: scaffoldBackgroundColor),
      ),
      body: FadedSlideAnimation(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.vertical -
                AppBar().preferredSize.height,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14.0, vertical: 14),
                  child: TextField(

                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: locale.enterPhoneNumber,
                        hintStyle: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: hintColor, fontSize: 22),
                        suffixIcon:Icon(
                          Icons.perm_contact_calendar_rounded,
                          color: Theme.of(context).primaryColorLight,
                        )
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 14.0),
                      //   child: GestureDetector(
                      //       onTap: () {
                      //         Navigator.pushNamed(
                      //             context, PageRoutes.enterPromoCodePage);
                      //       },
                      //       child: Text(
                      //         "",
                      //         style: Theme.of(context)
                      //             .textTheme
                      //             .subtitle1!
                      //             .copyWith(
                      //             color: Theme.of(context)
                      //                 .primaryColorLight),
                      //       )
                      //   ),
                      // ),
                    ),
                  ),
                ),
                Container(
                alignment: Alignment.center,
                child: Flex(
                    direction: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // ElevatedButton(
                      //     onPressed: () => scanBarcodeNormal(),
                      //     child: const Text('Barcode scan')),
                      InkWell(
                        onTap:(){
                          scanQR();
                        },
                        child: Container(
                         height: 40,
                          width: 100,
                          decoration: BoxDecoration(color: primary,borderRadius: BorderRadius.circular(10)),
                          child: Center(child:const Text("QR scan",style: TextStyle(color: Colors.white,fontSize: 20),)),
                        ),
                      ),
                      // ElevatedButton(
                      //     onPressed: () => scanQR(),
                      //     child: const Text('QR scan')),
                      // ElevatedButton(
                      //     onPressed: () => startBarcodeScanStream(),
                      //     child: const Text('Barcode scan stream')),
                      Text('Scan result : $_scanBarcode\n',
                          style: const TextStyle(fontSize: 20))
                    ])),
                // Column(
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.symmetric(
                //           horizontal: 14.0, vertical: 14),
                //       child: TextField(
                //
                //         keyboardType: TextInputType.number,
                //         decoration: InputDecoration(
                //           hintText: locale.enterPhoneNumber,
                //           hintStyle: Theme.of(context)
                //               .textTheme
                //               .headline5!
                //               .copyWith(color: hintColor, fontSize: 22),
                //           suffixIcon:Icon(
                //             Icons.perm_contact_calendar_rounded,
                //             color: Theme.of(context).primaryColorLight,
                //           )
                //           // Padding(
                //           //   padding: const EdgeInsets.symmetric(vertical: 14.0),
                //           //   child: GestureDetector(
                //           //       onTap: () {
                //           //         Navigator.pushNamed(
                //           //             context, PageRoutes.enterPromoCodePage);
                //           //       },
                //           //       child: Text(
                //           //         "",
                //           //         style: Theme.of(context)
                //           //             .textTheme
                //           //             .subtitle1!
                //           //             .copyWith(
                //           //             color: Theme.of(context)
                //           //                 .primaryColorLight),
                //           //       )
                //           //   ),
                //           // ),
                //         ),
                //       ),
                //     ),
                //     // Padding(
                //     //   padding: const EdgeInsets.symmetric(horizontal: 18.0),
                //     //   child: EntryField(
                //     //       locale.enterPhoneNumber,
                //     //       Icon(
                //     //         Icons.perm_contact_calendar_rounded,
                //     //         color: Theme.of(context).primaryColorLight,
                //     //       )),
                //     // ),
                //     SizedBox(height: 24),
                //     Expanded(
                //       child: Image.asset(
                //         'assets/imgs/Layer 1347.png',
                //         width: MediaQuery.of(context).size.width,
                //         fit: BoxFit.fill,
                //       ),
                //     ),
                //     // Expanded(
                //     //   child: GestureDetector(
                //     //     onTap: () => Navigator.pushNamed(
                //     //         context, PageRoutes.paymentSuccessfulPage),
                //     //     child: Image.asset(
                //     //       'assets/imgs/Layer 1347.png',
                //     //       fit: BoxFit.cover,
                //     //     ),
                //     //   ),
                //     // ),
                //   ],
                // ),
                // Column(
                //   children: [
                //     SizedBox(height: 112),
                //     Text(
                //       locale.scanQrCode!,
                //       style: Theme.of(context).textTheme.bodyText1,
                //     ),
                //     Spacer(),
                //     Stack(
                //       alignment: Alignment.center,
                //       children: [
                //         Image.asset(
                //           'assets/icons/qr code scanner.png',
                //           scale: 3.5,
                //         ),
                //         Container(
                //           width: MediaQuery.of(context).size.width / 1.4,
                //           height: 2,
                //           color: Theme.of(context).primaryColorLight,
                //         ),
                //       ],
                //     ),
                //     Spacer(),
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         // IconButton(
                //         //     icon: Icon(
                //         //       Icons.flash_off,
                //         //       color: scaffoldBackgroundColor,
                //         //     ),
                //         //     onPressed: () {}),
                //         // IconButton(
                //         //     icon: Icon(
                //         //       Icons.photo,
                //         //       color: scaffoldBackgroundColor,
                //         //     ),
                //         //     onPressed: () {}),
                //       ],
                //     ),
                //     SizedBox(height: 36),
                //   ],
                // ),
              ],
            ),
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
      // body: Column(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 18.0),
      //       child: EntryField(
      //           'Enter Phone Number',
      //           Icon(
      //             Icons.perm_contact_calendar_rounded,
      //             color: Theme.of(context).primaryColorLight,
      //           )),
      //     ),
      //     SizedBox(height: 24),
      //     GestureDetector(
      //       onTap: () =>
      //           Navigator.pushNamed(context, PageRoutes.paymentSuccessfulPage),
      //       child: Stack(
      //         alignment: Alignment.center,
      //         children: [
      //           Image.asset(
      //             'assets/imgs/Layer 1347.png',
      //             width: MediaQuery.of(context).size.width,
      //             fit: BoxFit.fill,
      //           ),
      //           Stack(
      //             alignment: Alignment.center,
      //             children: [

      //             ],
      //           ),
      //           Positioned.directional(
      //               top: 40,
      //               textDirection: Directionality.of(context),
      //               child:

      //           Positioned.directional(
      //               textDirection: Directionality.of(context),
      //               bottom: MediaQuery.of(context).size.height / 4,
      //               child:

      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

}
