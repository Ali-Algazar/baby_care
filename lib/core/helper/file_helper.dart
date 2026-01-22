import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class UniversalFileHelper {
  final Dio _dio;
  final ImagePicker _picker = ImagePicker();

  UniversalFileHelper({Dio? dio}) : _dio = dio ?? Dio();

  /// 📸 دالة عامة لاختيار صورة
  /// [source]: تحدد عايز تفتح الكاميرا ولا المعرض (الافتراضي المعرض)
  Future<File?> pickImage({ImageSource source = ImageSource.gallery}) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        return File(image.path);
      }
      return null;
    } catch (e) {
      print("⚠️ UniversalFileHelper Error (Pick): $e");
      return null;
    }
  }

  /// 🚀 دالة عامة لرفع أي ملف
  /// [file]: الملف اللي اخترته
  /// [endpoint]: رابط الرفع (مثلاً /upload/image)
  /// [fieldName]: اسم المفتاح اللي الباك إند مستنيه (Default: "file")
  /// [token]: لو الرفع محتاج توكن خاص
  Future<dynamic> uploadFile({
    required File file,
    required String endpoint,
    String fieldName = "file", // ده اللي بيحل مشكلة Field name missing
    String? token,
  }) async {
    try {
      String fileName = file.path.split('/').last;

      // تجهيز الـ FormData بشكل ديناميكي
      FormData formData = FormData.fromMap({
        fieldName: await MultipartFile.fromFile(file.path, filename: fileName),
      });

      // إعدادات الهيدر (لو فيه توكن)
      Options options = Options(
        headers: {
          'Content-Type': 'multipart/form-data',
          if (token != null) 'Authorization': 'Bearer $token',
        },
      );

      // الإرسال
      Response response = await _dio.post(
        endpoint,
        data: formData,
        options: options,
      );

      // بنرجع الـ Data كاملة عشان أنت اللي تقرر هتاخد منها إيه في مشروعك
      return response.data;
    } on DioException catch (e) {
      print("❌ UniversalFileHelper Error (Upload): ${e.message}");
      // ممكن ترجع null أو ترمي الخطأ حسب ما تحب
      return null;
    } catch (e) {
      print("❌ Unknown Error: $e");
      return null;
    }
  }
}
