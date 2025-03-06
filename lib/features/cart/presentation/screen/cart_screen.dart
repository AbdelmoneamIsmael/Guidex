import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guidix/core/widgets/guidix_app_bar.dart';
import 'package:guidix/gen/assets.gen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GuidixAppBar(
        title: "CartScreen",
        // actions: [
        //   CupertinoButton(
        //     child: const Icon(Icons.search),
        //     onPressed: () {
        //       for (var v = 0; v < 10; v++) {
        //         generateID();
        //       }
        //       // e4d0a0lemn72m01939ob21761A2
        //       //  4712me31m021e2db5n967o94Ala
        //       //  45a411o2m226b10d9911elme7An
        //       //  e6la612224m715mdo2nbA10499e
        //       //  A13d09aem22216e94m7581nb9lo
        //       //  a7b502m95Ae81e492n112mldo06
        //       //  4d61mo91556A2b52e92le710nam
        //       //  ml69775ae121bA0mod2294241ne
        //       //  o72ae8124ml25md01b5n969Ae21
        //       //  21727n9me96m945oda21l6bA01e
        //     },
        //   ),
        // ],
      ),
      body: Center(
        child: SvgPicture.asset(Assets.icons.emptyCartSvg),
      ),
    );
  }

  void generateID() {
    String text = "Abdelmoenam";
    String date = DateTime.now().microsecondsSinceEpoch.toString();
    List<String> list = [];
    list.addAll(text.split(""));
    list.addAll(date.split(""));
    list.shuffle();

    String id = list.join();

    print(id);
  }
}
