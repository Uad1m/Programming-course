<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
</head>
<body>

<h3>Введите условия банка</h3>
<form method="post" >
    Название банка: <input type="text" name="bank_name" /><br><br>
    Сумма кредита: <input type="int" name="crdt_s" /><br><br>
    Процентная ставка: <input type="int" name="pers" /><br><br>
    Комиссия банка: <input type="int" name="commis" /><br><br>
    Дополнительная плата: <input type="int" name="addfee" /><br><br>

    <input type="submit" class="submit-button" value="Отправить">
    <br><br>
</form>
<div>
<?php
			if(isset($_POST['bank_name']) 
					&& isset($_POST['pers']) 
					&& isset($_POST['crdt_s']) 
					&& isset($_POST['commis'])
					&& isset($_POST['addfee'])
			){
 
    $bank_name=$_POST['bank_name'];
    $pers = $_POST['pers'];
    $crdt_s = $_POST['crdt_s'];
    $commis = $_POST['commis'];
    $addfee = $_POST['addfee'];

    //Вычесляем количество месяцев, сумму выплаты банку, итоговую сумму выплаты.
    		$bal_crdt = $crdt_s + $addfee;
    		$smonth = 0;
    		$bank_fee = 0;
    		$bank_fee_total = 0;
    		$s_total = 0;
    		$p = 5000;//разовая ежемесячная выплата
			
				while ($bal_crdt > 0) {

				
//echo "Сейчас идет $smonth месяц<br>";
				$bal_crdt= $bal_crdt-$p; // вычитываем разовую выплату в месяц с кредитного баланса
//echo "после выплаты 5000 наш баланс : $bal_crdt<br>";
				$bal_crdt= $bal_crdt + $commis;//считаем кредитный баланс с добавлением ежемесячной комиссии
//echo "Мы платим 500 за комиссю и наша сумма теперь: $bal_crdt<br>";
				$bank_fee = ($bal_crdt / 100) * $pers; //комиссия банка в этом месяце
//echo "комиссия банка в этом месяце: $bank_fee<br>";
				$bal_crdt= $bal_crdt + $bank_fee; //считаем кредитный баланс + процент за месяц
//echo "наш кредит составляет: $bal_crdt<br>";

				$bank_fee_total =$bank_fee_total + $bank_fee+$commis; // считаем сумму выплат в банк по процентам и ежемесячной комиссии
//echo "Сумма комиссии 500+%: $bank_fee_total<br><br>";
				$smonth = $smonth + 1; // счетчик количества месяцев
				

				if ($bal_crdt<$p) {   // сравниваем остаток тела кредита с ежимесячным платежем, если меньше то добавляем общей сумме выплат
						$s_total=round($bal_crdt);
//echo "остаток суммы для выплаты $s_total<br>";
						$bal_crdt=0;

						$bank_fee_total=round($bank_fee_total);
//echo "Общая сумма это $s_total + $bank_fee_total + ($smonth * $p)";
						$s_total =$s_total + $bank_fee_total+ $smonth * $p ;//считаем общую сумму выплат по кредиту

					}
				}
			
//    echo "Банк: $bank_name <br> 
//    Сумма кредита: $crdt_s <br> 
//    Процентная ставка: $pers % <br>
//    Комиссия банка: $commis <br>
//    Количество месяцев для выплаты: $smonth <br>
//    Итоговая сумма выплат по кредиту: $s_total <br>
//    "
//    ;
	}
//	$info = array(
//    "$s_total"  => $bank_name,

//);
//  $min= min($info);
//  echo "Самое выгодное предложение: $min <br><br>";
//	foreach ($info as $k => $value) {
//		echo "<br>$k $value";
		
//	}


try {
    $dataStr = file_get_contents('data.json');
    $dataArray = json_decode($dataStr, true);
} catch (Exception $ex) {
    $dataArray = [];
}

$dataArray[] = ['Bank name: '=> $bank_name,
					 'Credit sum: ' => $crdt_s, 
					 'Percent rate: ' => $pers , 
					 'Commission of the bank: ' => $commis,
					 'Additional fee: ' => $addfee,
					 'Months to pay off the loan: ' => $smonth+1,
					 'Payment to the bank total: '=> $bank_fee_total,
					 'The total amount of payments on the loan: '=> $s_total];
$newDataSrt = json_encode($dataArray, JSON_PRETTY_PRINT);
$result = file_put_contents('data.json', $newDataSrt);


try {
            $dataStr = file_get_contents('data.json');
            $dataArray = json_decode($dataStr, true);
        } catch (Exception $ex) {
            $dataArray = [];
        }

        foreach ($dataArray as $dataRow) {
            echo "Название банка: " . $dataRow['Bank name: '] . "<br>";
//            echo "Сумма кредита: " . $dataRow['Credit sum: '] . "<br>";
//            echo "Процентная ставка: " . $dataRow['Percent rate: '] . "<br>";
//            echo "Комиссия банка: " . $dataRow['Commission of the bank: '] . "<br>";
//            echo "Дополнительная плата: " . $dataRow['Additional fee: '] . "<br>";
            echo "Количество месяцев для выплаты: " . $dataRow['Months to pay off the loan: '] . "<br>";
//            echo "Выплата банку итог: " . $dataRow['Payment to the bank total: '] . "<br>";
            echo "Итоговая сумма выплат по кредиту: " . $dataRow['The total amount of payments on the loan: '] . "<br><br>";


        } 
?>


</div>

</body>
</html>