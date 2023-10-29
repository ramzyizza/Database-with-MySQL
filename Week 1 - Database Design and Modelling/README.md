
# Library Database Model Assignment

## Task 1: Create a database model of the library system

### Entities and Attributes

#### Entity #1: Student (Strong Entity)
- **Attribute #1: NIM** (Primary Key)
  - Derived Attributes: Class Year, Faculty, Major
- **Attribute #2: Name**
  - Composite Attributes: First Name, Middle Name, Last Name
- **Attribute #3: Date of Birth**
  - Composite Attributes: Day, Month, Year
  - Derived Attribute: Age
- **Attribute #4: Address**
  - Composite Attributes: Province, City, Postal Code, District
- **Attribute #5: Sex** (Single Value)
- **Attribute #6: Phone Number** (Multi-Value)
- **Attribute #7: UGM Mail** (Single Value)
- **Attribute #8: Student Status** (Single Value)

#### Entity #2: Book (Strong Entity)
- **Attribute #1: Book ID** (Primary Key)
- **Attribute #2: Book Title**
- **Attribute #3: Book Location**
- **Attribute #4: ISBN**
- **Attribute #5: Price**
- **Attribute #6: Acquired Date**
- **Attribute #7: Description**
- **Attribute #8: Category**
- **Attribute #9: Year**
- **Attribute #10: Edition**
- **Attribute #11: Author**
- **Attribute #12: Publisher**

#### Entity #3: Librarian(s) (Strong Entity)
- **Attribute #1: UGM Mail** (Primary Key)
  - Composite Attributes: Password, Email
  - Derived Attribute: Login Authentication
- **Attribute #2: NIP**
  - Derived Attributes: Date of Birth, Date of Work, Sex, Worker’s ID
- **Attribute #3: Name**
  - Composite Attributes: First Name, Middle Name, Last Name
- **Attribute #4: Phone Number** (Multi-Value)

### Keys, Entities, Relationships, and Cardinality

1. **Primary Key:**
   - Student: NIM
   - Book: Book ID
   - Librarian: UGM Mail / Login Authentication

   *Reasoning:* Each key uniquely identifies the record in its respective entity. The NIM, Book ID, and UGM Mail are unique across all records in their entities.

2. **Strong Entity:**
   - All entities in the diagram are strong entities as they all have their own primary keys.

3. **Relationships:**
   - Borrows / Returns (between Student and Book)
   - Stored In (between Student’s & Book’s data with database systems)
   - Controlled By (between Database system and Librarian(s))

4. **Cardinality:**
   - Student -> Borrows / Returns -> Book: One to Many
   - Student & Book -> Stored In -> Database system: Many to One
   - Database System -> Controlled by -> Librarian(s): One to Many

*Explanation:* The cardinalities represent the potential number of occurrences in one entity which are associated with the number of occurrences in another.

### ERD: Entity Relationship Diagram

ERD is described based on the assumptions of business rules that you create yourself. Explain the assumption!

![Assignment 1 - Num 2 - Ramzy Izza Wardhana 472698](https://github.com/ramzyizza/Database-with-MySQL/assets/89899122/f911f49f-f494-4a05-b34e-99d6bf21a4c6)

Above, is an ER diagram that illustrates the library management systems on UGM (assumption). In hierarchy the library systems will be controlled by the admin librarian who has a personal UGM mail account as a login authentication to the database. In the database system, it will consist of student’s and book’s record data that will be stored and saved to control the flow of the book. If student wants to borrow a book, they will need to provide NIM and their chosen book (book_id) which then will be saved to the database consisting of borrow date and due date.

## Task 2: Record company Aneka Record ERD

![ERD Database Lab Assignment 1 - Ramzy Izza W](https://github.com/ramzyizza/Database-with-MySQL/assets/89899122/0dfe953d-13b8-471a-8b0a-811bd516e1c5)
