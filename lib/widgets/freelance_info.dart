import 'package:first_app/widgets/rate_section.dart';
import 'package:flutter/material.dart';

class FreelanceInfo extends StatelessWidget {
  const FreelanceInfo({
    super.key,
    required this.image,
    required this.profilePic,
    required this.name,
    required this.onpressed,
    required this.bio,
    required this.type,
    required this.rate,
  });
  final String image;
  final String profilePic;
  final String name;
  final String bio;
  final String type;
  final double rate;
  final void Function() onpressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 154,
            width: 197,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(image)),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Positioned(
            left: 142,
            top: 16,
            child: Container(
              height: 123,
              width: 216,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Color(0xffdae5f2b2), blurRadius: 16),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(backgroundImage: AssetImage(profilePic)),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            type,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xff827BEB),
                            ),
                          ),
                          Text(
                            bio,
                            softWrap: true,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Color(0xff6B6B6B),
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              RateSection(rate: rate),
                              SizedBox(width: 7),
                              SizedBox(
                                height: 31,

                                child: ElevatedButton(
                                  onPressed: onpressed,
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    backgroundColor: Color(0xff827BEB),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    'Book Now',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
