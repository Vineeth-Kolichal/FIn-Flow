import 'dart:io';
import 'package:fin_flow/core/error/exception.dart';
import 'package:fin_flow/features/home/domain/usecases/generate_report_usecase.dart';
import 'package:intl/intl.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

class PdfApi {
  static Future<File> generate(PdfParam param) async {
    try {
      final image =
          await imageFromAssetBundle('assets/images/fin_flow_logo.png');

      final fromDt = DateFormat('dd-MM-yyyy').format(param.fromDate);
      final toDt = DateFormat('dd-MM-yyyy').format(param.todate);
      final now = DateFormat('dd-MM-yyyy').format(DateTime.now());
      final pdf = pw.Document();

      pdf.addPage(pw.MultiPage(
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        build: (context) => [
          pw.Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              pw.Image(image, height: PdfPageFormat.cm * 1.5),
              pw.Text("SL No: ${DateTime.now().millisecondsSinceEpoch ~/ 1000}")
            ],
          ),
          pw.Text(
            "Transactions Report",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          pw.Divider(),
          pw.Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              pw.Text("From date: $fromDt"),
              pw.Text("Generated on: $now")
            ],
          ),
          pw.SizedBox(height: 5),
          pw.Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              pw.Text("To date: $toDt"),
            ],
          ),
          pw.Container(
            height: 20,
            decoration: BoxDecoration(color: PdfColor.fromHex('#F3F3F3FF')),
            child: pw.Row(
              children: [
                pw.Text('Test'),
              ],
            ),
          ),
          pw.Divider(),
          ...List.generate(100, (index) => pw.Text("$index"))
        ],
      ));

      return saveDocument(
          name: 'fin_flow_report_${DateTime.now().millisecondsSinceEpoch}.pdf',
          pdf: pdf);
    } catch (e) {
      throw DataException(e.toString());
    }
  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    try {
      final bytes = await pdf.save();
      final dir = await getDownloadsDirectory();
      final file = File('${dir?.path}/$name');
      await file.writeAsBytes(bytes);
      return file;
    } catch (e) {
      throw DataException(e.toString());
    }
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}
