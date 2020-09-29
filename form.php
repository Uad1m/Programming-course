<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
</head>
<body>

<h3>Введите необходимую сумму:</h3>
<form method="post" >
    <input type="int" name="sum" autofocus><br><br>
    <input type="submit" class="submit-button" value="Отправить">

    <br><br>


<?php

//берем массив наличных купюр в банкомате
$string_data = file_get_contents("data.txt");
$array = unserialize($string_data);
$a=$array;
$k= max(array_keys($a)); // количество банкнот в банкомате
$n=$_POST['sum']; // сумма которую надо выдать
error_reporting (E_ALL ^ E_NOTICE); // отключил отображение Notice: Undefined offset
echo "$n грн : "; //выводим введенную сумму для снятия
$p=0; //счетчик количества необходимых купюр к выдаче


$left=array_sum($a);
if ($n==0) {
	echo "Неверная сумма (ноль невозможно выдать) <br>";
}
while ($n>0) {
	

if ($n>$left) {
	echo "Недостаточно денег<br>";
	break;
}

if ($n %5 != 0) {
	echo "Неверно указана сумма (не кратна 5, невозможно выдать)<br>";
	break;
}
$temp=array();
$temp=$a;
$text=" ";

	if ($n>0 & $n>=1000){
		for ($i=0; $i<=$k; $i++) {
		if (($a[$i])==1000 & $n>=1000 & null !== isset($a[$i])) {
			$n=$n-1000;
			unset($a[$i]);
			$p++;
			}
		}
			$text=" $p x 1000, ";
		}

		$k=max(array_keys($a));
		$p=0;

		if ($n>0 & $n>=500) {

			for ($i=0; $i<=$k; $i++) { 		
			if (($a[$i])==500 & $n>=500 & null !== isset($a[$i])) {
			$n=$n-500;
			unset($a[$i]);
			$p++;
			}
		
		}
			$text=$text. " $p x 500, ";
		}

		$k=max(array_keys($a));
		$p=0;

		if ($n>0 & $n>=200) {
			for ($i=0; $i<=$k; $i++) {
			if (($a[$i])==200 & $n>=200 & null !== isset($a[$i])) {
			$n=$n-200;
			unset($a[$i]);
			$p++;
			}
		}
			$text=$text. " $p x 200, ";
		}

		$k=max(array_keys($a));
		$p=0;

		if ($n>0 & $n>=100) {
			for ($i=0; $i<=$k; $i++) { 
			if (($a[$i])==100 & $n>=100 & null !== isset($a[$i])) {
			$n=$n-100;
			unset($a[$i]);
			$p++;
				}
			}
			$text=$text. " $p x 100, ";
		}
		
		$k=max(array_keys($a));
		$p=0;

		if ($n>0 & $n>=50) {
			for ($i=0; $i<=$k; $i++) { 
			if (($a[$i])==50 & $n>=50 & null !== isset($a[$i])) {
			$n=$n-50;
			unset($a[$i]);
			$p++;
			}
		}
			$text=$text. " $p x 50, ";
		}

		$k=max(array_keys($a));
		$p=0;

		if ($n>0 & $n>=20) {
			for ($i=0; $i<=$k; $i++) { 
			if ($a[$i]==20 & $n>=20 & null !== isset($a[$i])) {
			$n=$n-20;
			unset($a[$i]);
			$p++;
			}
		}
			$text=$text. " $p x 20, ";
		}

		$k=max(array_keys($a));
		$p=0;

		if ($n>0 & $n>=10) {
			for ($i=0; $i<=$k; $i++) { 
			if (($a[$i])==10 & $n>=10 & null !== isset($a[$i])) {
			$n=$n-10;
			unset($a[$i]);
			$p++;
			}
		}
				$text=$text. " $p x 10, ";
		}

		$k=max(array_keys($a));
		$p=0;

		if ($n>0 or $n>=5 ) {
			for ($i=0; $i<=$k; $i++) { 
			if (($a[$i])==5 & $n>=5 & isset($a[$i]) == true ) {
			$n=$n-5;
			unset($a[$i]);
			$p++;
			}
		}
			$text=$text. " $p x 5 ";
		}
		//недостаточно мелких купюр, возврат суммы к предыдущему значению
		if($n>0){ 
		echo "Невозможно выдать (недостаточно мелких купюр) <br> ";
		$a=$temp;
		break;
		}
	echo "$text <br>"; //вывод необходимых купюр для выдачи суммы
}
	//Вывод остатка суммы денег в банкомате
	$left=array_sum($a); 
	echo "(Остаток : $left) <br>";
// помещаем в основной массив наличных купюр - новый массив из оставшихся купюр
$string_data = serialize($a);
file_put_contents("data.txt", $string_data);


?>


</body>
</html>