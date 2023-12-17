CREATE DEFINER=`root`@`localhost` PROCEDURE `getAmountBalance`(IN roll_number INT, OUT out_balance INT)
BEGIN
   DECLARE balance_tobe_paid INT;
   
   SELECT amountBalance INTO balance_tobe_paid 
   FROM StudentAdmissionPaymentDetails 
   WHERE studentRollNo = roll_number;
   
   SET out_balance = balance_tobe_paid;
END