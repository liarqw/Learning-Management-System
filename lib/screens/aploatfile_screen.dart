import 'package:flutter/material.dart';

class UploadFileScreen extends StatefulWidget {
  const UploadFileScreen({super.key});

  @override
  State<UploadFileScreen> createState() => _UploadFileScreenState();
}

class _UploadFileScreenState extends State<UploadFileScreen> {
  final List<String> _files = []; // List untuk menyimpan nama file dummy

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          "Upload File",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFB73E3E),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- INFO BOX ---
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.blue.shade200),
                    ),
                    child: const Text(
                      "Maksimum File 5MB, Maksimum Jumlah File 20",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  const Text(
                    "File yang akan di upload akan tampil di sini",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // TAMPILAN FILE (KOSONG ATAU ADA ISI)
                  _files.isEmpty ? _buildEmptyState() : _buildFileList(),
                ],
              ),
            ),
          ),

          // --- TOMBOL AKSI DI BAWAH ---
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _files.add("Tugas_UID_Kelompok_4.pdf");
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFB73E3E)),
                      foregroundColor: const Color(0xFFB73E3E),
                    ),
                    child: const Text("Pilih File"),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: _files.isEmpty
                        ? null
                        : () {
                            Navigator.pop(context); // Kembali setelah simpan
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFB73E3E),
                      disabledBackgroundColor: Colors.grey.shade300,
                    ),
                    child: const Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(50),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: const Center(
        child: Text(
          "Belum ada file dipilih",
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildFileList() {
    return Column(
      children: _files
          .map(
            (file) => Card(
              child: ListTile(
                leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
                title: Text(file, style: const TextStyle(fontSize: 14)),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.grey),
                  onPressed: () => setState(() => _files.clear()),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
