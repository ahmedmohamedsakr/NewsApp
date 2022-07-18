import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopTrendingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height *.6,
      child: Swiper(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Material(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12.0),
            child: InkWell(
              onTap: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: FancyShimmerImage(
                      imageUrl:
                          'https://images.unsplash.com/photo-1657835047328-d4f46cd0b9a6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=406&q=80',
                      errorWidget: Image.asset('assets/images/empty_image.png'),
                      height: MediaQuery.of(context).size.height * .33,
                      width: double.infinity,
                      boxFit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 20.0,
                    ),
                    child: Text(
                      'Title',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.link,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '16-7-2022',
                          style: GoogleFonts.montserrat(
                            fontSize: 15.0,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        itemCount: 10,
        index: 0,
        autoplay: true,
        autoplayDelay: 30000,
        autoplayDisableOnInteraction: true,
        layout: SwiperLayout.STACK,
        viewportFraction: .9,
        itemWidth: MediaQuery.of(context).size.height*.9,
      ),
    );
  }
}
