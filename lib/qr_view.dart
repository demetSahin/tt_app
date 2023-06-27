import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:tabiat_tarihi_app/utils.dart';
import 'description.dart';
import 'update.dart';

class QRView extends StatefulWidget {
  const QRView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewState();
}

class _QRViewState extends State<QRView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    double baseWidth = 414;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    MobileScannerController cameraController = MobileScannerController();
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Color(0xff252468),
        ),
        backgroundColor: const Color.fromRGBO(190, 232, 246, 1),
        title: Text(
          'QR Okuma',
          style: SafeGoogleFont(
            'Josefin Sans',
            fontSize: 30 * ffem,
            fontWeight: FontWeight.w700,
            height: 1 * ffem / fem,
            color: Color(0xff252468),
          ),
        ),
        actions: [
          IconButton(
            color: Color(0xff252468),
            icon: ValueListenableBuilder(
              valueListenable: cameraController.torchState,
              builder: (context, state, child) {
                if (state == TorchState.off) {
                  return const Icon(Icons.flash_off, color: Colors.grey);
                } else {
                  return const Icon(Icons.flash_on, color: Colors.yellow);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.toggleTorch(),
          ),
          IconButton(
            color: Color(0xff252468),
            icon: ValueListenableBuilder(
              valueListenable: cameraController.cameraFacingState,
              builder: (context, state, child) {
                if (state == CameraFacing.front) {
                  return const Icon(Icons.camera_front);
                } else {
                  return const Icon(Icons.camera_rear);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.switchCamera(),
          ),
        ],
      ),
      body: MobileScanner(
          controller: cameraController,
          onDetect: (barcode, args) {
            setState(() {
              if (barcode.rawValue == null) {
                debugPrint('QR kod okunurken hata oluştu.');
              } else {
                final String? code = barcode.rawValue;
                debugPrint('QR kod metni :  $code');
                //getEser(code);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Description(salon: code!),
                  ),
                );
              }
            });
          }),
    );
  }
}
