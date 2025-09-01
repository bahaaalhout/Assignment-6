import 'package:flutter/material.dart';

class AdsWidget extends StatelessWidget {
  const AdsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, const Color.fromARGB(255, 116, 177, 227)],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Todays Deal',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  Text(
                    '50% OFF',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    'Et provident eos est dolore. Eum libero eligendi molestias aut et quibusdam aspernatur.',
                    softWrap: true,

                    style: TextStyle(color: Color(0xFF5C6F81), fontSize: 11),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 150,
                    height: 35,
                    color: Colors.black,
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'BUY IT NOW',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Icon(Icons.arrow_forward, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Image.asset('assets/weman.png'),
          ],
        ),
      ),
    );
  }
}
