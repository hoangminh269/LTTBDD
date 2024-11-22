void main(){
  Object obj = 'Hello';

  //Kiem tra kieu String
  if(obj is String){
    print('obj la String');
  }

  //Kiem tra khong phai kieu int
  if(obj is! int){
    print('obj khong phai la int');
  }

  //Ep kieu
  String str = obj as String;
  print(str.toUpperCase());
}