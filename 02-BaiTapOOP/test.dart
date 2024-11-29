import 'dienthoai.dart';
import 'hoadon.dart';
import 'cuahang.dart';

void main() {
  // 1. Test quản lý thông tin điện thoại
  print("\n--- Quản lý thông tin điện thoại ---");
  
  // Tạo đối tượng điện thoại
  DienThoai dt1 = DienThoai("DT-001", "iPhone 14", "Apple", 1000.0, 1500.0, 50, true);
  DienThoai dt2 = DienThoai("DT-002", "Samsung Galaxy S23", "Samsung", 800.0, 1200.0, 30, true);

  // Thêm điện thoại mới
  CuaHang cuaHang = CuaHang("Cửa hàng A", "123 Đường ABC");
  cuaHang.themDienThoai(dt1);
  cuaHang.themDienThoai(dt2);

  // Hiển thị danh sách điện thoại
  print("Danh sách điện thoại ban đầu:");
  cuaHang.hienThiDanhSachDienThoai();

  // Cập nhật thông tin điện thoại
  cuaHang.capNhatDienThoai("DT-002", "Samsung Galaxy S23 Ultra", 850.0, 1300.0, 40);
  print("Danh sách điện thoại sau cập nhật:");
  cuaHang.hienThiDanhSachDienThoai();

  // Kiểm tra validation
  dt1.giaNhap = 2000.0; 
  dt1.tenDT = ""; 
  print("Danh sách điện thoại sau kiểm tra validation:");
  cuaHang.hienThiDanhSachDienThoai();

  // 2. Test quản lý hóa đơn
  print("\n--- Quản lý hóa đơn ---");

  // Tạo hóa đơn
  HoaDon hoaDon1 = HoaDon("HD-001", DateTime.now(), dt1, 10, 1500.0, "Nguyễn Văn A", "0909123456");
  cuaHang.taoHoaDon(hoaDon1);

  // Kiểm tra ràng buộc (tồn kho, validation)
  HoaDon hoaDon2 = HoaDon("HD-002", DateTime.now(), dt2, 35, 1200.0, "Trần Văn B", "0912345678");
  cuaHang.taoHoaDon(hoaDon2); 

  // Hiển thị danh sách hóa đơn
  print("Danh sách hóa đơn:");
  cuaHang.hienThiDanhSachHoaDon();

  // Tính toán tiền và lợi nhuận
  print("Tổng tiền hóa đơn HD-001: \$${hoaDon1.tinhTongTien()}");
  print("Lợi nhuận thực tế hóa đơn HD-001: \$${hoaDon1.tinhLoiNhuanThucTe()}");

  // 3. Test thống kê báo cáo
  print("\n--- Thống kê báo cáo ---");

  // Doanh thu theo thời gian
  DateTime tuNgay = DateTime.now().subtract(Duration(days: 30));
  DateTime denNgay = DateTime.now();
  double doanhThu = cuaHang.tinhTongDoanhThu(tuNgay, denNgay);
  print("Doanh thu từ ${tuNgay} đến ${denNgay}: \$${doanhThu}");

  // Lợi nhuận theo thời gian
  double loiNhuan = cuaHang.tinhTongLoiNhuan();
  print("Tổng lợi nhuận: \$${loiNhuan}");

  // Top bán chạy
  cuaHang.danhSachDienThoai.sort((a, b) => b.slTonKho.compareTo(a.slTonKho));
  print("Sản phẩm bán chạy nhất: ${cuaHang.danhSachDienThoai[0].tenDT}");

  // Báo cáo tồn kho
  print("\n--- Báo cáo tồn kho ---");
  cuaHang.hienThiDanhSachDienThoai();
}
