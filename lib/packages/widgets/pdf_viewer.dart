import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../views/widgets/appbar.dart';

class PdfViewer extends StatefulWidget {
  const PdfViewer({super.key, required this.url});

  final String url;

  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  bool isLoading = false;
  late File pFile;

  Future<void> loadNetwork() async {
    setState(() {
      isLoading = true;
    });
    final response = await http.get(Uri.parse(widget.url));
    final bytes = response.bodyBytes;
    final filename = basename(widget.url);
    final dir = await getApplicationDocumentsDirectory();
    var file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    setState(() {
      pFile = file;
    });

    debugPrint(pFile.path);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    loadNetwork();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(needsPop: true),
      body: Center(
        child: isLoading ? const Center(child: CircularProgressIndicator()) : Center(child: PDFView(filePath: pFile.path)),
      ),
    );
  }
}
