import 'dart:io';

late String nama3;
late String? test1;
void main() {
  Object nama = "Chandra";
  nama = 20;
  print(nama);

  String? nama2;
  print(nama2);

  nama3 = "Putra";
  print(nama3);

  // test1 = stdin.readLineSync();
  // print(test1);

  var a = [1,2,3];
  var b = [5, ...a];
  print(b);

  String? message;
  String text = message ?? "Empty";

  List angka = [1,2,3,4,5];
  printList(angka);
}

void printList(List l) {
  for(var i = 0; i < l.length; i++){
    print(l[i]);
  }
}