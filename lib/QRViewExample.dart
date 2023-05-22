import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'Description.dart';
import 'dart:developer';
import 'dart:io';

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');


  @override
  Widget build(BuildContext context) {
    MobileScannerController cameraController = MobileScannerController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Okuma'),
        actions: [
          IconButton(
            color: Colors.white,
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
            color: Colors.white,
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
          //allowDuplicates: true,
          controller: cameraController,
          onDetect: (barcode, args) {
            setState(() {
              if (barcode.rawValue == null) {
                debugPrint('QR kod okunurken hata oluştu.');
              } else {
                final String? code = barcode.rawValue;
                debugPrint('QR kod metni :  $code');
                
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

  void _redirectPage(String code) {
    // controller?.pauseCamera();
    // controller?.dispose();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Description(salon: code),
      ),
    );
  }
}
