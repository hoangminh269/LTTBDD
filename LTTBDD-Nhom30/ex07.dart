//BT07: Viet chuong trinh tinh tong cac uoc so cua mot so nguyen duoc nhap tu ban phim.

import 'dart:io';

void main(){
  //Nhap so nguyen duong tu ban phim
  stdout.write('Nhap mot so nguyen duong(n>=1): ');
  int? n = 
  int.tryParse(stdin.readLineSync()!);
  if(n==null || n<1){
  print("Nhap mot so hop le!");
  return;
  }
  

  //Tinh tong cac uoc so
  int sum = 0;
  for(int i=1;i<=n;i++){
    if(n%i==0){
      
      sum += i; //Cong uoc so vao tong
    }
  }
  
  print('Tong cac uoc so cua $n la: $sum');
}