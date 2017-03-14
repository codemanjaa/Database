-- Execute the command sequence by one, in CC_DREAD_first.sql then CC_DREAD_second.sql
-- 

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SELECT SUM(balance) FROM bank_account


