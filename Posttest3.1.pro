PREDICATES
/*
	dibawah ini adalah kumpulan predikat yang akan digunakan dibagian Clauses
	pada setiap predikat ini dapat diisi oleh String
*/
putra(STRING,STRING)
saudara_perempuan(STRING,STRING)
saudara_laki(STRING,STRING)
menikah(STRING,STRING)
ayah(STRING ayah,STRING putra)
kakek(STRING kakek,STRING cucu)
nondeterm ipar_perempuan(STRING,STRING)
CLAUSES
/*dibawah ini adalah pendeklarasian fakta yaitu : 
Ikhsan adalah putra dari Bendatng
Dini adalah saudara perempuan dari Dina
Adi adalah Saudara Laki-laki Lintang
Ikhsan Menikah dengan Dini
Lintang Menikah dengan Surga*/
putra("Ikhsan","Bentang"). 
saudara_perempuan("Dini","Dina").
saudara_laki("Adi","Lintang").
menikah("Ikhsan","Dini").
menikah("Lintang","Surga").
/*dibawah ini adalah sekelompok Rules
	A adalah Ayah dari B jika B adalah putra dari A
	A adalah kakek dari B jika A adalah ayah dari C dan C adalah ayah dari B
	A adalah ipar perempuan dari B jika A menikah dengan C dan C adalah saudara perempuan dari B
	A adalah ipar perempuan dari B jika A adalah saudara laki-laki dari C dan C menikah dengan B
*/
ayah(A,B):-putra(B,A).
kakek(A,B):-ayah(A,C), ayah(C,B).
ipar_perempuan(A,B):-menikah(A,C), saudara_perempuan(C,B).
ipar_perempuan(A,B):-saudara_laki(A,C), menikah(C,B).
GOAL
ipar_perempuan("Ikhsan",X).
/*Goal yang dicari adalah siapakah ipar perempuan dari Ikhsan
	karena pada rules diatas ipar perempuan dapat dicari jika A menikah dengan C dan C adalah saudara perempuan dengan B
	atau jika A adalah saudara laki-laki dari C dan DC menikah dengan B
	maka hasil yang akan didapatkan adalah Dina karena Ikhsan menikah dengan Dini yang merupakan saudara perempuan dari Dina
*/