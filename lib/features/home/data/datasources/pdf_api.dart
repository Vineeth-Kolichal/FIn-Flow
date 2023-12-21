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

import '../../domain/entities/transaction_entity.dart';

class PdfApi {
  static Future<File> generate(PdfParam param) async {
    try {
      final image =
          await imageFromAssetBundle('assets/images/fin_flow_logo.png');

      final fromDt = DateFormat('dd-MM-yyyy').format(param.fromDate);
      final toDt = DateFormat('dd-MM-yyyy').format(param.todate);
      final now = DateFormat('dd-MM-yyyy').format(DateTime.now());
      List<TransactionEntity> income =
          param.transactions.where((element) => element.isIncome).toList();
      List<TransactionEntity> expenses =
          param.transactions.where((element) => !element.isIncome).toList();

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
          pw.Divider(),
          if (income.isNotEmpty)
            transactionListWidget(transactions: income, isIncome: true),
          if (expenses.isNotEmpty)
            transactionListWidget(transactions: expenses, isIncome: false),
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

pw.Widget transactionListWidget({
  required List<TransactionEntity> transactions,
  required bool isIncome,
}) {
  double total = 0.0;
  for (var element in transactions) {
    total = total + element.amount;
  }
  return pw.Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      pw.Text(
        isIncome ? "Income" : "Expenses",
        style: pw.TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: PdfColor.fromHex(isIncome ? "#4CAF50FF" : "#F44336FF"),
        ),
      ),
      pw.Divider(color: PdfColor.fromHex("#9E9E9EFF")),
      pw.Container(
        height: 20,
        decoration: BoxDecoration(
            color: PdfColor.fromHex(isIncome ? '#EBFDECFF' : "#FDE0DEFF")),
        child: pw.Row(
          children: [
            pw.Flexible(
              flex: 1,
              child: pw.Center(
                child: pw.Text(
                  "No",
                  style: pw.TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            pw.Flexible(
              flex: 2,
              child: pw.Center(
                child: pw.Text(
                  "Date",
                  style: pw.TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            pw.Flexible(
              flex: 2,
              child: pw.Center(
                child: pw.Text(
                  "Category",
                  style: pw.TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            pw.Flexible(
              flex: 5,
              child: pw.Center(
                child: pw.Text(
                  "Description",
                  style: pw.TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            pw.Flexible(
              flex: 2,
              child: pw.Center(
                child: pw.Text(
                  "Amount",
                  style: pw.TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      pw.Divider(color: PdfColor.fromHex("#9E9E9EFF")),
      ...List.generate(
        transactions.length,
        (index) => transactionRow(index: index, entity: transactions[index]),
      ),
      pw.Divider(color: PdfColor.fromHex("#9E9E9EFF")),
      pw.Row(children: [
        pw.Spacer(),
        pw.Text('Total:'),
        pw.SizedBox(
          // width: 50,
          child: pw.Text("$total",
              style: pw.TextStyle(
                color: PdfColor.fromHex(isIncome ? "#4CAF50FF" : "#F44336FF"),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              )),
        ),
        pw.SizedBox(width: 20),
      ]),
      pw.Divider(color: PdfColor.fromHex("#9E9E9EFF")),
    ],
  );
}

pw.Container transactionRow(
    {required int index, required TransactionEntity entity}) {
  return pw.Container(
      //height: 20,
      decoration: BoxDecoration(
          color: (index % 2 == 1) ? PdfColor.fromHex('#F3F3F3FF') : null),
      child: pw.Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: pw.Row(
          children: [
            pw.Flexible(
              flex: 1,
              child: pw.Center(
                child: pw.Text(
                  "${index + 1}",
                  style: const pw.TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            pw.Flexible(
              flex: 2,
              child: pw.Center(
                child: pw.Text(
                  DateFormat('dd-MM-yyyy').format(entity.date!),
                  style: const pw.TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            pw.Flexible(
              flex: 2,
              child: pw.Center(
                child: pw.Text(
                  entity.category,
                  style: const pw.TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            pw.Flexible(
              flex: 5,
              child: pw.Center(
                child: pw.Text(
                  entity.description,
                  style: const pw.TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            pw.Flexible(
              flex: 2,
              child: pw.Center(
                child: pw.Text(
                  "${entity.amount}",
                  style: const pw.TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ));
}
