
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
BEGIN TRANSACTION

-- what kind of locks active now?
sp_show_my_locks

SELECT * FROM account

-- active locks now
sp_show_my_locks

UPDATE account SET balance = balance + 1

-- active locks now
sp_show_my_locks

ROLLBACK

--active locks now
sp_show_my_locks
