import 'package:e_commerce_app/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../cart_screen/view/cart_screen_view.dart';
import '../../cart_screen/view_model/cart_screen_view_model.dart';
import '../../home_screen/model/home_screen_hot_products_model.dart';
import '../view_model/product_view_model.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({Key? key, required this.product})
      : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    final cartViewModel = Provider.of<CartViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white, title: Text(widget.product.title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.network(widget.product.image, height: 200.w)),
              SizedBox(height: 20.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PrimaryButton(
                    width: 80.w,
                    color: Colors.orange,
                    onTap: () {
                      if (quantity > 0) {
                        setState(() {
                          quantity--;
                        });
                      }
                    },
                    child: Text(
                      "Remove",
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    quantity.toString(),
                    style: TextStyle(fontSize: 18.sp),
                  ),
                  PrimaryButton(
                    width: 80.w,
                    color: Colors.orange,
                    onTap: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    child: Text(
                      "Add",
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.w),
              Text(widget.product.title,
                  style:
                      TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold)),
              SizedBox(height: 10.w),
              Text("\$${widget.product.price}",
                  style: TextStyle(fontSize: 18.sp, color: Colors.green)),
              SizedBox(height: 20.w),
              Text(widget.product.description),
              SizedBox(height: 20.w),
              PrimaryButton(
                color: Colors.orange,
                onTap: () {
                  cartViewModel.addToCart(widget.product, quantity);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Added to cart')),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreenView(),
                    ),
                  );
                },
                child: Text(
                  "Add to Cart $quantity",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
