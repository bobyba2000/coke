import 'package:coke_platform/common/utility/string.dart';
import 'package:coke_platform/generated/l10n.dart';
import 'package:coke_platform/model/firebase/contestant/career/model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

enum EducationLevel {
  master,
  bachelor,
  college;

  @override
  String toString() {
    switch (this) {
      case master:
        return S.current.masterDegree;
      case bachelor:
        return S.current.bachelorDegree;
      case college:
        return S.current.collegeDegree;
    }
  }
}

enum GraduationYear {
  before2024,
  in2024,
  in2025,
  from2026;

  @override
  String toString() {
    switch (this) {
      case before2024:
        return S.current.before2024;
      case in2024:
        return S.current.within2024;
      case in2025:
        return S.current.within2025;
      case from2026:
        return S.current.above2026;
    }
  }
}

@JsonSerializable()
class EducationInfoModel {
  final EducationLevel education;
  final String university;
  final String major;
  final num gpa;
  final DateTime graduationYear;

  EducationInfoModel({
    required this.education,
    required this.university,
    required this.major,
    required this.gpa,
    required this.graduationYear,
  });

  num calculateMajorPoint(InternshipRole role) {
    List<String> fields = [];
    switch (role) {
      case InternshipRole.it:
        fields = [
          'Computer Science & Information Technology',
          'Machine Learning',
          'AI Engineering',
          'Information System',
          'Business Analyst',
          'Business Intelligence',
          'Data Science',
          'Data Analytics',
          'Data Engineering'
        ];
        break;
      case InternshipRole.procurement:
        fields = [
          'Mechanical Engineering',
          'Kỹ thuật Cơ khí',
          'Electrical Engineering',
          'Kỹ thuật Điện',
          'Electronics Engineering',
          'Kỹ thuật Điện tử',
          'Control & Automation Engineering',
          'Kỹ thuật Điều khiển & Tự động hóa',
          'Civil Engineering',
          'Kỹ thuật Xây dựng',
          'Chemical Engineering',
          'Kỹ thuật Hóa học',
          'Aerospace Engineering',
          'Kỹ thuật Hàng không Vũ trụ',
          'Biomedical Engineering',
          'Kỹ thuật Y sinh',
          'Computer Engineering',
          'Kỹ thuật Máy tính',
          'Environmental Engineering',
          'Kỹ thuật Môi trường',
          'Industrial Engineering',
          'Kỹ thuật Công nghiệp',
          'Materials Engineering',
          'Kỹ thuật Vật liệu',
          'Nuclear Engineering',
          'Kỹ thuật Hạt nhân',
          'Petroleum Engineering',
          'Kỹ thuật Dầu khí',
          'Software Engineering',
          'Kỹ thuật Phần mềm',
          'Structural Engineering',
          'Kỹ thuật Kết cấu'
        ];
        break;
      case InternshipRole.tradeMarketing:
        fields = [
          'Marketing and Integrated Communications',
          'Tiếp thị và Truyền thông Tích hợp',
          'Digital Marketing',
          'Tiếp thị Kỹ thuật số',
          'Brand Management',
          'Quản lý Thương hiệu',
          'Public Relations',
          'Quan hệ Công chúng',
          'Advertising',
          'Quảng cáo',
          'Market Research',
          'Nghiên cứu Thị trường',
          'Content Marketing',
          'Tiếp thị Nội dung',
          'Social Media Marketing',
          'Tiếp thị Truyền thông Xã hội',
          'Event Management',
          'Quản lý Sự kiện',
          'Sales Promotion',
          'Khuyến mãi Bán hàng',
          'Consumer Behavior',
          'Hành vi Người tiêu dùng'
        ];
        break;
      case InternshipRole.sales:
        return 5;
      default:
        fields = [
          'Economics',
          'Kinh tế học',
          'Business Administration',
          'Quản trị Kinh doanh',
          'Foreign Trade',
          'Thương mại Quốc tế',
          'International Business',
          'Kinh doanh Quốc tế',
          'Marketing and Integrated Communications',
          'Tiếp thị và Truyền thông Tích hợp',
          'Data Analysis',
          'Phân tích Dữ liệu',
          'Data Intelligence',
          'Trí tuệ Dữ liệu',
          'Finance - Banking',
          'Tài chính - Ngân hàng',
          'Accounting - Auditing',
          'Kế toán - Kiểm toán',
          'Supply Chain Management',
          'Quản lý Chuỗi cung ứng',
          'Human Resources Management',
          'Quản lý Nhân sự',
          'Strategic Management',
          'Quản lý Chiến lược',
          'Operations Management',
          'Quản lý Hoạt động',
          'Entrepreneurship',
          'Khởi nghiệp',
          'Business Analytics',
          'Phân tích Kinh doanh',
          'Risk Management',
          'Quản lý Rủi ro',
          'Investment Analysis',
          'Phân tích Đầu tư'
        ];
    }
    final isExist = fields.any((element) => StringUtility.compare(element, major) > 0.5);

    return isExist ? 5 : 0;
  }

  num calculatePoint(InternshipRole role) {
    num point = 0;

    if (role == InternshipRole.sales) {
      if (education != EducationLevel.master) {
        point += 5;
      }
    } else {
      if (education != EducationLevel.college) {
        point += 5;
      }
    }

    point += calculateMajorPoint(role);

    if (gpa >= 8.5) {
      point += 5;
    } else if (gpa >= 7) {
      point += 3;
    } else if (gpa >= 6) {
      if (role == InternshipRole.sales) {
        point += 3;
      }
    }

    if (graduationYear.isBefore(DateTime(2024))) {
      point += 0;
    } else if (graduationYear.isBefore(DateTime(2025))) {
      point += 5;
    } else if (graduationYear.isBefore(DateTime(2026))) {
      if (role == InternshipRole.sales) {
        point += 2;
      }
    }

    return point;
  }

  factory EducationInfoModel.fromJson(Map<String, dynamic> json) => _$EducationInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$EducationInfoModelToJson(this);
}
