import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../product_details_screen/view/product_details_view.dart';
import '../view_model/home_screen_view_model.dart';


class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductViewModel>(context, listen: false).fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProductViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(title: const Text("Products")),
      body: Builder(
        builder: (_) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.error != null) {
            return Center(child: Text("Error: ${viewModel.error}"));
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 60.h),
                Padding(
                  padding:  EdgeInsets.only(left: 20.w,right: 20.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          height: 45.h,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.search, color: Colors.grey),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Search products",
                                    border: InputBorder.none,
                                    isDense: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      badges.Badge(
                        badgeContent: Text('1',
                            style:
                            TextStyle(color: Colors.white, fontSize: 10.sp)),
                        position: badges.BadgePosition.topEnd(top: -5, end: -5),
                        child: Icon(Icons.notifications_none, size: 28.sp),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),

              SizedBox(
                height: 120.h,
                // width: 400.w,
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildBanner("assets/images/banner1.jpg"),
                    _buildBanner("assets/images/banner2.jpg"),
                    _buildBanner("assets/images/banner1.jpg"),
                  ],
                ),
              ),
                SizedBox(height: 20.w,),
                Padding(
                  padding:  EdgeInsets.only(left: 20.w,),
                  child: Row(
                    children: [
                      Text("Products",style: TextStyle(
                        fontSize: 18.w,
                        fontWeight: FontWeight.w600
                      ),),
                    ],
                  ),
                ),
                SizedBox(height: 20.w,),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: viewModel.products.length,
                  itemBuilder: (context, index) {
                    final product = viewModel.products[index];
                    return ListTile(
                      leading: product.image.isNotEmpty
                          ? Image.network(
                        product.image,
                        width: 50,
                        height: 50,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset('assets/images/PM-RING-041.webp', width: 50.w, height: 50.w);
                        },
                      )
                          : Image.asset('assets/images/PM-RING-041.webp', width: 50.w, height: 50.w),
                      title: Text(product.title),
                      subtitle: Text("\$${product.price}"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailScreen(product: product),
                          ),
                        );
                      },
                    );

                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  Widget _buildBanner(String imageUrl) {
    return Container(
      margin: EdgeInsets.only(right: 20.w,left: 20.w),
      width: 300.w,
      height: 140.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

