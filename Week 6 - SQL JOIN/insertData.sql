INSERT INTO booktable(bookTitle, authorName, borrowedStatus) 
VALUES 
    ("Computer Networking: A Top-down Approach", "Jim Kurose", "Not Borrowed"),
    ("Cisco Networking All-in-one for Dummies", "Edward Tetz", "Not Borrowed"),
    ("Artificial Intelligence: A Modern Approach", "Peter Norvig", "Borrowed"),
    ("Deep Learning", "Aaron Courville", "Borrowed"),
    ("Database Systems: The Complete Book", "Jeffrey Ullman", "Borrowed"),
    ("Database System Concepts", "Avi Silberschatz", "Borrowed"),
    ("Python 3 Object Oriented Programming", "Dusty Phillips", "Not Borrowed"),
    ("Clean Code", "Robert Cecil Martin", "Borrowed"),
    ("Time Complexity Analysis", "Aditya Chatterjee", "Not Borrowed"),
    ("The Algorithm Design Manual", "Steven Skiena", "Not Borrowed");

INSERT INTO usertable(userName, numberOfBorrowing, numberOfReturning) 
VALUES 
    ("ramzy-izza", 0, 0),
    ("thor-odinson", 1, 1),
    ("tony-stark", 0, 0),
    ("peter-parker", 0, 0),
    ("steve-rogers", 4, 0),
    ("jane-foster", 0, 0),
    ("nick-fury", 0, 0),
    ("steven-strange", 0, 0);

INSERT INTO flowtable(userIDBorrowed, bookIDBorrowed, borrowDate, returnDate) 
VALUES 
    (337, 113, "2021-12-12", "2021-12-15"),
    (337, 114, "2022-05-15", "2022-05-25"),
    (337, 115, "2022-01-07", "2022-01-11"),
    (337, 116, "2022-10-21", "2022-10-25"),
    (337, 118, "2022-01-20", "2022-02-02");
