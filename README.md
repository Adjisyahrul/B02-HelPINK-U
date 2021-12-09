[![Pre-Release](https://github.com/Adjisyahrul/B02-HelPINK-U/actions/workflows/pre-release.yml/badge.svg)](https://github.com/Adjisyahrul/B02-HelPINK-U/actions/workflows/pre-release.yml)
[![Release](https://github.com/Adjisyahrul/B02-HelPINK-U/actions/workflows/release.yml/badge.svg)](https://github.com/Adjisyahrul/B02-HelPINK-U/actions/workflows/release.yml)

<!-- HelPINK U -->

# Project UAS B02
- Link Github: https://github.com/Adjisyahrul/B02-HelPINK-U
- Link Download APK: https://github.com/Adjisyahrul/B02-HelPINK-U/releases/tag/1.0.0%2B1

## Anggota kelompok B02

1. Atifah Nabilla Al Qibtiyah - 2006462802
2. Febrian Rayhan Aryadianto - 2006482520
3. Irham Wahyu Arieffadhila - 2006485863
4. Nabila Aulia Rahardja - 2006482243
5. Muhammad Syahrul Adji - 2006463805
6. Omarenzo Zafira Thahir - 2006484785
7. Nafidz Abiyyu Hanief - 2006485850

## Tema 
Aplikasi pendataan mahasiswa terkena covid 

## Aplikasi dan Manfaat
**HelPINK U** mewadahi mahasiswa yang terkena COVID-19 untuk meminta dan menerima bantuan penanganan lebih lanjut. Selain itu, terdapat opsi bagi mereka yang ingin memberi bantuan berupa dana yang nantinya akan kami salurkan baik dengan uang maupun obat-obatan. Website ini juga menerima permintaan bantuan tempat untuk isolasi mandiri dan permintaan bantuan penanganan dari RSUI. Nantinya, pengumpulan dana akan dilakukan oleh pemberi bantuan dan tindak lanjut akan permintaan bantuan dilakukan oleh fakultas selaku admin.

## Fitur
### 1. Masuk
Fitur ini membuat halaman login dan landing page untuk masing-masing jenis pengguna.
- **Penyusun** = Omarenzo Zafira Thahir
- **Detail implementasi** =
Pada implementasinya, akan terdapat form yang berisikan data-data yang diperlukan untuk masuk/login, yaitu username dan password. Akan juga terdapat widget `RaisedButton` yang ketika diklik maka akan mengecek data yang telah dimasukkan. Data yang dimasukkan pada form tersebut akan diintegrasikan dan diautentikasi kan dengan database yang terdapat pada Django. Jika user sudah memiliki akun dan memasukkan data yang benar, maka akan diarahkan ke page yang sesuai dengan role dari user tersebut. Jika belum memiliki akun ataupun salah dalam memasukkan data, maka akan muncul peringatan berupa message bahwa data yang dimasukkan salah.

### 2. Profil (edit)
Fitur ini membuat profil untuk masing-masing pengguna dan mengimplementasikan fitur edit profil.
- **Penyusun** = Atifah Nabilla Al Qibtiyah
- **Detail implementasi** =
Pada fitur profil, terdapat dua halaman di mobile app, yaitu halaman edit profil dan ringkasan profil. Untuk halaman edit profil, terdapat `Form` untuk input data diri menggunakan `TextFormField` dalam implementasinya. Data diri user akan disimpan di database django. Selanjutnya, user akan diarahkan ke halaman ringkasan profil untuk melihat hasil input dari page edit profil. Jika user telah mengedit profilnya via web, maka kami akan mengambil database django dari model Profil untuk nantinya ditampilkan di halaman ringkasan profil. 

### 3. Daftar
Fitur ini membuat form akun login untuk masing-masing jenis pengguna.
- **Penyusun** = Muhammad Syahrul Adji
- **Detail implementasi** : 
Pada modul daftar ini terdapat beberapa widget `Text` dalam child `Form` untuk memasukkan email, username, serta password. Data yang dimasukkan pada textField tersebut telah diintegrasikan pada Django admin website aplikasi HelPINK-U. Setelah beberapa widget Text yang disusun berdasarkan listView, terdapat widget `radioButton` untuk memilih role dari pengguna yang ingin mendaftar. Role tersebut terdiri dari pengaju dan penerima yang akan menjadi syarat autentikasi dalam login untuk memunculkan berbagai halaman yang telah diizinkan berdasarkan role yang telah dipilih. Jika proses daftar gagal akan mengirimkan pesan gagal mendaftar sesuai dengan widget `Text`-nya masing-masing dan jika berhasil akan mengirimkan data yang telah dimasukkan yang akan ditampilkan setelah klik tombol daftar.

### 4. Saran
Fitur ini membuat form saran dari Mahasiswa Fasilkom dan Warga Fasilkom ke admin yang nantinya akan dimunculkan dalam bentuk card pada page admin.
- **Penyusun** = Nabila Aulia Rahardja
- **Detail implementasi** =
Pada implementasinya di mobile app, pada page saran, akan terdapat form dengan implementasi textformfield dan dropdown. Pengisian saran yang berisi inputan role, keluhan, saran, serta rating. akan terdapat widget `elevatedButton` untuk mengirim hasil inputan. Hasil inputan yang diberikan user akan disimpan pada database django. Selain terdapat form saran, terdapat pula page untuk menampilkan saran-saran yang sudah diberikan user. Untuk menampilkannya, kami akan mengambil dari database django berupa data-data seperti pesan, role, keluhan, dan rating yang kemudian menampilkannya di page kritik saran yang terdapat pada page yang dimiliki role admin.

### 5. Pengajuan isolasi, pengajuan dana & bantuan penanganan medis
Fitur ini membuat form dari Mahasiswa Fasilkom yang berisi latar belakang dari pengajuan yang dilakukan oleh Mahasiswa Fasilkom.
- **Penyusun** : Irham Wahyu Arieffadhila
- **Detail implementasi** :

### 6. Dana
Fitur ini membuat form pengisian dana, daftar pilihan rekening, dan menampilkan data-data tersebut di page admin.
- **Penyusun** =
- **Detail implementasi** :
Implementasi awal menggunakan widget yang akan me return sebuah form dengan 3 `TextFormField` dan 3 `ListTile`. `TextFormField` terdiri dari request 2 text berisikan nama bank dan nomor rekening, kemudian 1 request jumlah donasi berupa angka. `ListTile` sebagai opsi radio yang berisikan `SingingCharacter` berupa opsi bank yang akan di transfer. Terdapat 3 opsi bank yaitu mandiri, BCA, dan BNI sehingga terdapat 3 ListTile untuk menampilkan masing-masing opsi. Kemudian terdapat button submit untuk memasukkan data yang sudah diinput. Response klik akan memunculkan snackbar dengan text ‘Processing Data’ sebagai tanda bahwa benar inputan sedang di proses ke database. 

### 7. Mengirim feedback status oleh admin
Fitur ini membuat sistem pengiriman feedback status oleh admin berdasarkan pengajuan yang dilakukan pengaju bahwa telah disetujui ataupun ditolak.
- **Penyusun** : Febrian Rayhan Aryadianto
- **Detail implementasi** : 
Implementasi di mobile app akan terdapat beberapa halaman yang menampilkan fungsi seperti form pengisian data, edit form, delete form, dan halaman utama yang menampilkan data-data form feedback admin yang terdapat fungsi penyetujuan maupun penolakan. Untuk bagian tombol submisi, create, delete, dll. akan menggunakan widget `elevated/outlined button`. Selain itu, saat input telah diterima oleh aplikasi akan muncul sebuah teks ‘Data Telah `<insertuserhere>` Tersimpan’  dengan menggunakan widget `snackbar`. Untuk edit form dan pengisian data akan diimplementasikan widget `textformfield` untuk memunculkan kotak input tulisan. Untuk menampilkan data pada halaman utama, data yang telah disimpan dari database django akan connect atau implementasikan pada tabel data utama.

### 8. Landing Page (Fitur Tambahan)
- **Detail implementasi** : 
Fitur ini akan menampilkan kumpulan tombol yang mengarahkan pengguna ke page-page yang ingin dikunjungi. Page ini akan tersusun atas widget `button`. Selain itu akan terdapat carousel berisi infografis mengenai helPINK U.

