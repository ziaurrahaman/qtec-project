//import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:qtec_test_project/model/product_details_model.dart';
import 'package:qtec_test_project/providers/product_details_provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _current = 0;
  // final CarouselController _controller = CarouselController();

  List<Widget> images = [];
  List<Color> colors = [Colors.black, Colors.yellow, Colors.red, Colors.blue];
  bool isColorButtonPressed = false;

  List<String> paymentMethods = [
    'Bkash',
    'Cash on Delivery not available',
    'Bkash',
    'Bkash',
    'Bkash'
  ];

  List<String> availableColor = ['Black', 'Yellow', 'Red', 'Yellow'];
  ProductDetailsModel details = ProductDetailsModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDFDDDD),
      appBar: AppBar(
          centerTitle: false,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          backgroundColor: Colors.white,
          title: const Text(
            'Product Details',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Image.asset('assets/images/share_image.png'),
          ]),
      body: FutureBuilder(
          future: context.read<ProductDetailsProvider>().getProductDetails(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.waiting) {
              details = context.read<ProductDetailsProvider>().productDetails;
            }
            return (snapshot.connectionState == ConnectionState.waiting)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductDetailsScreenTopCardWidget(details: details),
                        Padding(
                            padding: EdgeInsets.all(16),
                            child: Text('Delevery Information',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          child: Row(
                            children: [
                              Image.asset('assets/images/car_image.png',
                                  height: 24, width: 24),
                              SizedBox(
                                width: 4,
                              ),
                              RichText(
                                  text: TextSpan(
                                text: 'Sent from ',
                                style: TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                      text: 'Dhaka',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(text: 'will arrive in '),
                                  TextSpan(
                                      text: '7/10 ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(text: 'workdays.')
                                ],
                              ))
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.all(16),
                            child: Text('Payment Method (Supported)',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Wrap(
                            children: [
                              ...paymentMethods
                                  .map((e) => PaymentMethodWidget(
                                        methodName: e,
                                      ))
                                  .toList()
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.all(16),
                            child: Text('Description',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.circle,
                                      size: 8, color: Colors.grey),
                                  SizedBox(width: 8),
                                  Text('Fi')
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.circle,
                                      size: 8, color: Colors.grey),
                                  SizedBox(width: 8),
                                  Text('Dual Channel Abs')
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.all(16),
                            child: Text('Additional Information',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.circle,
                                      size: 8, color: Colors.grey),
                                  SizedBox(width: 8),
                                  Text('Color: Red, Yellow, Black, Blue')
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
          }),
    );
  }
}

class ProductDetailsScreenTopCardWidget extends StatelessWidget {
  const ProductDetailsScreenTopCardWidget({
    Key? key,
    required this.details,
  }) : super(key: key);

  final ProductDetailsModel details;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            color: Colors.white,
            shape: BoxShape.rectangle),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSlideshow(
              children: [
                ...details.detailImages
                    .map(
                      (e) => ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        child: Image.network(
                          e,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                    .toList()
              ],
              height: 280,
              width: MediaQuery.of(context).size.width,
              initialPage: 0,
              indicatorColor: Colors.grey,
            ),
            const SizedBox(height: 16),
            Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text(details.productName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 18))),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('BDT ${details.productPrice}',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text(
                    'BDT 350000',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        decoration: TextDecoration.lineThrough),
                  ),
                  Spacer(),
                  Chip(
                    //   padding: EdgeInsets.symmetric(vertical: 8),

                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    backgroundColor: Colors.red,
                    labelStyle: TextStyle(color: Colors.white),
                    label: Text((details.discountCharge == null)
                        ? '0%'
                        : '${details.discountCharge}%'),
                  )
                ],
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: RatingBarIndicator(
                itemSize: 24,
                unratedColor: Theme.of(context).accentColor,
                itemCount: 5,
                rating: details.productReviewAverage.toDouble(),
                itemBuilder: (context, i) {
                  return Icon(
                    Icons.star,
                    color: Colors.amber,
                  );
                },
                itemPadding: EdgeInsets.symmetric(horizontal: 4),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(16),
                child: Text('Select Color',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold))),
            SelectColorButtons(),
          ],
        ));
  }
}

class SelectColorButtons extends StatefulWidget {
  const SelectColorButtons({Key? key}) : super(key: key);

  @override
  _SelectColorButtonsState createState() => _SelectColorButtonsState();
}

class _SelectColorButtonsState extends State<SelectColorButtons> {
  List<Color> colors = [Colors.black, Colors.yellow, Colors.red, Colors.blue];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        height: 40,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      index = i;
                    });
                  },
                  child: Text(
                    (colors[i] == Colors.black)
                        ? 'Black'
                        : (colors[i] == Colors.yellow)
                            ? 'Yellow'
                            : (colors[i] == Colors.red)
                                ? 'Red'
                                : 'Blue',
                    style: TextStyle(
                        color: (index == i) ? Colors.white : Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: BorderSide(color: colors[i], width: 1)),
                      primary: (index == i) ? colors[index] : Colors.white),
                ),
              );
            },
            itemCount: colors.length),
      ),
    );
  }
}

class PaymentMethodWidget extends StatelessWidget {
  late final String methodName;

  PaymentMethodWidget({
    required this.methodName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Wrap(
        children: [
          (methodName == 'Bkash')
              ? Image.asset('assets/images/payment_supported_icon.png',
                  height: 24, width: 24)
              : Image.asset('assets/images/payment_not_supported_icon.png',
                  height: 24, width: 24),
          SizedBox(width: 4),
          Text(methodName, style: TextStyle(fontSize: 16))
        ],
      ),
    );
  }
}
