-- Show all book titles where status is borrowed and date of borrow is yesterday
SELECT booktable.bookTitle, booktable.borrowedStatus 
FROM booktable
INNER JOIN flowtable 
ON booktable.bookID = flowtable.bookIDBorrowed
WHERE flowtable.borrowDate = DATE_SUB(CURDATE(), INTERVAL 1 DAY);

-- Show all book title even its not borrowed and its userID borrower for which it is borrowed
SELECT booktable.bookTitle, booktable.borrowedStatus, flowtable.userIDBorrowing 
FROM booktable
LEFT JOIN flowtable 
ON booktable.bookID = flowtable.bookIDBorrowed;

-- Show all book borrowed and all user ID whether he/she is borrowing or not
SELECT booktable.bookTitle, booktable.borrowedStatus, usertable.userID 
FROM booktable
LEFT JOIN flowtable 
ON flowtable.bookIDBorrowed = booktable.bookID
RIGHT JOIN usertable 
ON usertable.userID = flowtable.userIDBorrowing;

-- Using one query, list all book titles and usernames in which book is borrowed and user borrow more than 3 books.
SELECT booktable.bookTitle, usertable.userName 
FROM booktable
INNER JOIN flowtable 
ON flowtable.bookIDBorrowed = booktable.bookID
INNER JOIN usertable 
ON usertable.userID = flowtable.userIDBorrowing
WHERE usertable.numberOfBorrowing > 3;
