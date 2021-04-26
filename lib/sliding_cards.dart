import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

class SlidingCardsView extends StatefulWidget {
  @override
  _SlidingCardsViewState createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  PageController pageController;
  double pageOffset = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.8);
    pageController.addListener(() {
      setState(() => pageOffset = pageController.page);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      child: PageView(
        controller: pageController,
        children: <Widget>[
          SlidingCard(
            name: 'Abhinav',
            date: 'CSE ',
            assetName: 'https://lh3.googleusercontent.com/AYfugVoIvwIE3wrGHpWF0AccF4DLQBcGvN6Fovf-ojiLc3S3O-6FWdEO93tFcMqud-Wc9GispwGW-Mc-ScQgnGuezYg1K7wliM1kSGCwr_a26YEUctcIFxZgOKtXF-OznjhvAfipmdz9-2iWfUrAmF1oJOCyiygbX9pqUo4MNhLiLu3EsJXMUeM4RVYr3FnUWKVYxsT5WdedKig4I4c8324xws0z4xJFWJ9sj3ggNCLCTe7Wz-6Ouk9pJ7VW_nsl0wN0cMccz3TNKNnLf3SYvMAoI91q7pnJR8NSlIE793BJ66bDAn9xwR1WdjzWiXhXjL4eNKjkibcitEUP3FyXKVzIXNVhaenFRz3fMkIF8EbV7ZUpBdqq_gNfCwT9-HF8LcU1z7rv6kTXnwEN2pJbbHbmWVGEP0zwbDyUk1g3a_sJLPqlKBmwAzPAsAYFyl3NCTqyFXSiPpwZKlQq_2AF55HBNeLTdEiWWEf77IOC4EYEDFPEiBfc2CFmBTHSy5GK6lTq4_saZ03y6rRuo7C8YpNraQ1TMyRD0FY1blj_Y5DVqhXz9xyiGDywF9AHdtRrCr0E-y9TcGEN9jZc9crsMb1_XTnC4MGzVJ3rEnov-pL3eXtiYlSvFCt4nm1kw0CbWEBztz0XN8VcTC5-1Djkq6HVQH-zam-h4_GzThnG-XwDxTZGVhFMYEg27-n-ODkgfdI1ccalTygVPPfPqfZdCJY=w275-h183-no?authuser=2',
            offset: pageOffset,
          ),
          SlidingCard(
            name: 'Yadhav',
            date: 'ECE',
            assetName: 'https://lh3.googleusercontent.com/Vzy28saa6HerJhV528fUFrxsqNfsXZ2B3lt17ipWVkmN8iAIJWn2pY31OFdyTKhFK44VMw8SdtJNaMkM-peK9u0NIK-3rJy63Oe-ICwYorTCKC3h7Zf7ko0Vyxim18ZR9-T0o5FLGuhFEnC-O9aeNRKpPHLHtbtZ1XjaV8ZZXbcUhA_UhJeMVf6Gp_jvcrQlmbUZHhAT3sAK8-u3Lc0liUrm1aJXc-gmBY3YnKftpipdV-eCla-E9-PSpsLwJH6gjcBBNqYN2gLlhLerQA7PLF3POtkrwL_aleaVc4jUcTDyHuOnH1jlGS12oet1pQRlrJC54XilomKaXERbv4oTS9EdAa0LAKL-CPjjd9cV322tDZqx75HYYud7a2lYuqZtuc2VvQc5QpzjCVguw-PjiBx8W_lGHYnrLhxid7co8UYc3tPU1he9qpuQTkytYPZLrOo5qNAZiei6HiBGb5OyJSkEY7yBYhVK3a8g66Dkr4Ox7jyLryWYYHSKUsvAlAzInuMk2-nMl2_9Bj7rxGY_k7XSQ2EcOVH4yxYXpLiLwF8aDwE2dU8ZTRZUW_s8tvQQZZopKnrOn3WHpLU3EsK7rtzFoBGD1SKn-HQG0syBGLjBZvDgFFNTvVBimNArBxKU5P2bQRBRB9NGaMUmfxgDptVgtPYBFaRSYa4E7HLiHCuJzJ5WufiQ_74ME2ScNzpk4crK8WV2Z_RdvbfoTh3348I=s250-k-no',
            offset: pageOffset - 1,
          ),
           SlidingCard(
            name: 'Alan',
            date: 'MECH',
            assetName: 'https://lh3.googleusercontent.com/Vzy28saa6HerJhV528fUFrxsqNfsXZ2B3lt17ipWVkmN8iAIJWn2pY31OFdyTKhFK44VMw8SdtJNaMkM-peK9u0NIK-3rJy63Oe-ICwYorTCKC3h7Zf7ko0Vyxim18ZR9-T0o5FLGuhFEnC-O9aeNRKpPHLHtbtZ1XjaV8ZZXbcUhA_UhJeMVf6Gp_jvcrQlmbUZHhAT3sAK8-u3Lc0liUrm1aJXc-gmBY3YnKftpipdV-eCla-E9-PSpsLwJH6gjcBBNqYN2gLlhLerQA7PLF3POtkrwL_aleaVc4jUcTDyHuOnH1jlGS12oet1pQRlrJC54XilomKaXERbv4oTS9EdAa0LAKL-CPjjd9cV322tDZqx75HYYud7a2lYuqZtuc2VvQc5QpzjCVguw-PjiBx8W_lGHYnrLhxid7co8UYc3tPU1he9qpuQTkytYPZLrOo5qNAZiei6HiBGb5OyJSkEY7yBYhVK3a8g66Dkr4Ox7jyLryWYYHSKUsvAlAzInuMk2-nMl2_9Bj7rxGY_k7XSQ2EcOVH4yxYXpLiLwF8aDwE2dU8ZTRZUW_s8tvQQZZopKnrOn3WHpLU3EsK7rtzFoBGD1SKn-HQG0syBGLjBZvDgFFNTvVBimNArBxKU5P2bQRBRB9NGaMUmfxgDptVgtPYBFaRSYa4E7HLiHCuJzJ5WufiQ_74ME2ScNzpk4crK8WV2Z_RdvbfoTh3348I=s250-k-no',
            offset: pageOffset - 1,
          ),
        ],
      ),
    );
  }
}

class SlidingCard extends StatelessWidget {
  final String name;
  final String date;
  final String assetName;
  final double offset;

  const SlidingCard({
    Key key,
    @required this.name,
    @required this.date,
    @required this.assetName,
    @required this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) / 0.08));
    return Transform.translate(
      offset: Offset(-32 * gauss * offset.sign, 0),
      child: Card(
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 24,top: 15),
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
              child:Image.network('$assetName'),

              // child: Image.asset(
              //   'assets/$assetName',
              //   height: MediaQuery.of(context).size.height * 0.3,
              //   alignment: Alignment(-offset.abs(), 0),
              //   fit: BoxFit.none,
              // ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: CardContent(
                name: name,
                date: date,
                offset: gauss,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final String name;
  final String date;
  final double offset;

  const CardContent(
      {Key key,
      @required this.name,
      @required this.date,
      @required this.offset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Transform.translate(
            offset: Offset(8 * offset, 0),
            child: Text(name, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 8),
          Transform.translate(
            offset: Offset(32 * offset, 0),
            child: Text(
              date,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          
          Row(
            children: <Widget>[
              SizedBox(height:30.0),
              Text("First prize in Oil painting",style: TextStyle(fontSize: 20)),
              // Transform.translate(
              //   offset: Offset(48 * offset, 0),
              //   child: RaisedButton(
              //     color: Color(0xFFEF6C00),
              //     child: Transform.translate(
              //       offset: Offset(24 * offset, 0),
              //       child: Text('Reserve'),
              //     ),
              //     textColor: Colors.white,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(32),
              //     ),
              //     onPressed: () {},
              //   ),
              // ),
              // Spacer(),
              // Transform.translate(
              //   offset: Offset(32 * offset, 0),
              //   child: Text(
              //     '0.00 \$',
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 20,
              //     ),
              //   ),
              // ),
             
            ],
          )
        ],
      ),
    );
  }
}