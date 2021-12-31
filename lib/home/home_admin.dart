import 'package:flutter/material.dart';
import 'package:helpink_u/main.dart';
import 'carousel.dart';
import 'package:helpink_u/saran/view_saran.dart';
import 'package:helpink_u/saran/saran1.dart';
import 'package:helpink_u/saran/main_view_saran.dart';
import 'package:helpink_u/saran/main_form_saran.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({Key? key}) : super(key: key);

  @override
  _HomeAdminState createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const CarouselHome(),
          //CARD MENU
          Flexible(
            fit: FlexFit.tight,
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              children: <Widget>[
                //1. Feedback untuk user
                Card(
                  margin: const EdgeInsets.all(15.0),
                  color: myColor1,
                  child: InkWell(
                    //onTap: (),
                    splashColor: myColor1,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget> [
                          Icon(Icons.mode_edit_outline, size: 70, color: myColor2,),
                          Text("Feedback Pengajuan", style: TextStyle(fontSize: 20, color: myColor2)),
                          Text("\nBerupa penyetujuan atau penolakan pemberian bantuan", style: TextStyle(fontSize: 8, color: myColor2)),
                        ],
                      ),
                    ),
                  ),
                ),
                //2. Donasi
                Card(
                  margin: const EdgeInsets.all(15.0),
                  color: myColor1,
                  child: InkWell(
                    //onTap: (),
                    splashColor: myColor1,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget> [
                          Icon(Icons.monetization_on_sharp, size: 70, color: myColor2,),
                          Text("Total Donasi", style: TextStyle(fontSize: 20, color: myColor2)),
                          Text("\nBanyaknya bantuan yang akan disalurkan", style: TextStyle(fontSize: 8, color: myColor2)),
                        ],
                      ),
                    ),
                  ),
                ),
                //3. Lihat kritik
                Card(
                  margin: const EdgeInsets.all(15.0),
                  color: myColor1,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return SaranProvide();
                      }));
                    },
                    splashColor: myColor1,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget> [
                          Icon(Icons.add_reaction_rounded, size: 70, color: myColor2,),
                          Text("Lihat Saran", style: TextStyle(fontSize: 20, color: myColor2)),
                          Text("\nKritik dan saran untuk HelPINK U", style: TextStyle(fontSize: 8, color: myColor2)),
                        ],
                      ),
                    ),
                  ),
                ),
                //4. masukkan kritik
                Card(
                  margin: const EdgeInsets.all(15.0),
                  color: myColor1,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return const FormTampil();
                      }));
                    },
                    splashColor: myColor1,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget> [
                          Icon(Icons.add_comment, size: 70, color: myColor2,),
                          Text("Kritik dan Saran", style: TextStyle(fontSize: 20, color: myColor2)),
                          Text("\nbantu kami perbaiki HelPINK U", style: TextStyle(fontSize: 8, color: myColor2)),
                        ],
                      ),
                    ),
                  ),
                ),
              ]
              ),
          )
          //FINISH
        ],
      ),
    );
  }
}

//Container(
                //   decoration: BoxDecoration(
                //     color: myColor1, borderRadius: BorderRadius.circular(10)
                //    ),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: <Widget>[
                //       Icon(Icons.add_reaction_rounded, size: 70,),
                //       SizedBox(height: 14),
                //       Text("Berikan Kritik", style:TextStyle(color: myColor2, fontSize: 16),),
                //       SizedBox(height: 8),
                //       Text("disini kalian dapat memberikan kritik dan saran yang bisa membantu kami dalam memperbaiki HelPINK U", style:TextStyle(color: myColor2, fontSize: 10),)
                //     ] ,),
                // )

