import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guidix/features/scan_Screen/controller_repo/controller/scnner_controller.dart';
import 'package:guidix/features/scan_Screen/presentation/screen/scan_error.dart';
import 'package:guidix/features/scan_Screen/presentation/widget/scanned_barqode_lable.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodeScannerWithScanWindow extends StatefulWidget {
  const BarcodeScannerWithScanWindow({super.key, required this.controller});
  final MobileScannerController controller;

  @override
  State<BarcodeScannerWithScanWindow> createState() =>
      _BarcodeScannerWithScanWindowState();
}

class _BarcodeScannerWithScanWindowState
    extends State<BarcodeScannerWithScanWindow> {
  @override
  void didChangeDependencies() {
    widget.controller.start();
    _subscription = widget.controller.barcodes.listen((barcodes) {
      if (barcodes.barcodes.isNotEmpty) {
        Get.find<ScnnerController>().setBarCode(
          barcodes.barcodes.first.displayValue ?? '',
        );
        Get.back();
      }
    });
    super.didChangeDependencies();
  }

  StreamSubscription? _subscription;

  // TODO: Fix BoxFit.fill & BoxFit.fitHeight
  final boxFit = BoxFit.contain;

  @override
  Widget build(BuildContext context) {
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.sizeOf(context).center(const Offset(0, 0)),
      width: 200,
      height: 200,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('With Scan window')),
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          MobileScanner(
            fit: boxFit,
            scanWindow: scanWindow,
            controller: widget.controller,
            errorBuilder: (context, MobileScannerException e, error) {
              return ScannerErrorWidget(error: e);
            },
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.black38,
                  width: MediaQuery.sizeOf(context).height * .3,
                ),
                right: BorderSide(
                  color: Colors.black38,
                  width: MediaQuery.sizeOf(context).width * .1,
                ),
                top: BorderSide(
                  color: Colors.black38,
                  width: MediaQuery.sizeOf(context).height * .3,
                ),
                left: BorderSide(
                  color: Colors.black38,
                  width: MediaQuery.sizeOf(context).width * .1,
                ),
              ),
            ),
            child: const SizedBox(
              height: 200,
              width: 200,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              height: 100,
              color: const Color.fromRGBO(0, 0, 0, 0.4),
              child: ScannedBarcodeLabel(barcodes: widget.controller.barcodes),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    unawaited(widget.controller.stop());
    _subscription?.cancel();
    print("disposed Camera  controller------------------------------------");
    await widget.controller.dispose();
    
  }
}
