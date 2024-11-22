
import 'dart:io';


//BT06: Viet chuong trinh chuyen doi 1 so nguyen (n>=1) duoc nhap tu ban phim thanh so nhi phan.
void main(){
// Nhap so nguyen duong tu ban phim
stdout.write('Nhap mot so nguyen (n>=1): ');
int? n = 
int.tryParse(stdin.readLineSync()!);
if(n == null || n < 1){
  print('Vui long nhap mot so hop le!');
  return;
}
//Chuyen doi sang he nhi phan
String binary = n.toRadixString(2);
print('So nhi phan cua $n la: $binary');

}