// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Register());
  }
}

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        const Text('data'),
        ElevatedButton(
            onPressed: () {
              String email = 'example@example.com';
              String password = 'password123';
              registerUser(email, password);
            },
            child: const Text('Register')),
        Expanded(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('doctor').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Terjadi kesalahan: ${snapshot.error}');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasData) {
                // Mengakses daftar dokumen
                List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
                    snapshot.data!.docs;

                // Gunakan daftar dokumen untuk membangun UI
                return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (BuildContext context, int index) {
                    // Mengakses data dari setiap dokumen
                    Map<String, dynamic> data = documents[index].data();
                    print(data);

                    // Membangun widget yang sesuai berdasarkan data
                    return ListTile(
                      title: Text(documents[index].id),
                      subtitle: Text('Umur: ${data['umur']}'),
                      leading: Text(data['nama']),
                    );
                  },
                );
              }
              return const Text('data');
            },
          ),
        ),
        // Expanded(child: child)
      ],
    )));
  }
}

Future<void> registerUser(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    FirebaseFirestore.instance
        .collection('doctor')
        .doc(userCredential.user!.uid)
        .set({'nama': 'example', 'umur': 0}).then((value) {
      print('Data berhasil ditambahkan dengan ID: ${userCredential.user!.uid}');
    }).catchError((error) {
      print('Gagal menambahkan data: $error');
    });

    // Registrasi berhasil, lakukan tindakan selanjutnya
    // misalnya menampilkan pesan berhasil, navigasi ke halaman berikutnya, dll.
    print('Registrasi berhasil. UserID: ${userCredential.user!.uid}');
  } catch (e) {
    // Tangani kesalahan saat pendaftaran pengguna
    // misalnya menampilkan pesan kesalahan, melakukan logging, dll.
    print('Gagal mendaftarkan pengguna: $e');
  }
}
