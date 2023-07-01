import 'package:single_salon/data_layer/models/carttest.dart';
import 'package:single_salon/presentation_layer/screen/cart_screen/cart_controller/cart_controller.dart';
import 'package:single_salon/presentation_layer/resources/color_manager.dart';
import 'package:single_salon/presentation_layer/resources/font_manager.dart';
import 'package:single_salon/presentation_layer/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    this.index,
    this.cart,
  }) : super(key: key);
  final CartItem? cart;

  final int? index;
  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: const EdgeInsets.all((10)),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(
                  cart!.image,
                  width: 200,
                  height: 210,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  cart!.name, textAlign: TextAlign.right,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                  // maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              // RichText(
              //   text: TextSpan(
              //     text: 'السعر :',
              //     style: MangeStyles().getBoldStyle(
              //       color: ColorManager.kTextblack,
              //       fontSize: FontSize.s14,
              //     ),
              //     children: <TextSpan>[
              //       TextSpan(
              //         text: 'AED',
              //         style: MangeStyles().getRegularStyle(
              //           color: ColorManager.kPrimary,
              //           fontSize: FontSize.s16,
              //         ),
              //       ),
              //       TextSpan(
              //         text: cart!.price.toString(),
              //         style: MangeStyles().getBoldStyle(
              //           color: ColorManager.kPrimary,
              //           fontSize: FontSize.s18,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              GetBuilder<CartController>(
                builder: (controller) {
                  return IncrasingorDecrasing(
                    fontsize: 25,
                    count: cart!.count,
                    size: 30,
                    onTapAdd: () {
                      cartController.icrasingCount(index!, 20.0);
                    },
                    onTapmuns: () {
                      cartController.decrasingCount(index!, 20.0);
                    },
                  );
                },
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          // IconButton(
          //   onPressed: () {},
          //   icon: SvgPicture.asset('assets/icons/trash.svg'),
          // )
        ],
      ),
    );
  }
}

class IncrasingorDecrasing extends StatelessWidget {
  const IncrasingorDecrasing({
    super.key,
    required this.size,
    this.onTapAdd,
    this.onTapmuns,
    required this.fontsize,
    required this.count,
  });
  final double size;
  final void Function()? onTapAdd;
  final void Function()? onTapmuns;
  final double fontsize;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ButtonChange(
          size: size,
          icon: Icons.add,
          x: true,
          onTap: onTapAdd,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            count.toString(),
            style: MangeStyles().getRegularStyle(
              color: ColorManager.kTextblack,
              fontSize: fontsize,
            ),
          ),
        ),
        ButtonChange(
          size: size,
          icon: Icons.minimize,
          onTap: onTapmuns,
        ),
      ],
    );
  }
}

class ButtonChange extends StatelessWidget {
  const ButtonChange({
    Key? key,
    required this.icon,
    this.onTap,
    this.x,
    required this.size,
  }) : super(key: key);
  final IconData icon;
  final void Function()? onTap;
  final bool? x;
  final double size;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: x == null ? Alignment.topCenter : Alignment.center,
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: ColorManager.grey2,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon),
      ),
    );
  }
}
