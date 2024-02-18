struct Student 
{
    var firstName: String
    var lastName: String
    var averageGrade: Double   
}

struct StudentJournal
{
    var students: [Student] = []

    mutating func addStudent(student: Student)
    {
        students.append(student)
    }

    mutating func removeStudent(firstName: String, lastName: String)
    {
        students.removeAll { $0.firstName == firstName && $0.lastName == lastName}
    }

    func displayAllStudents()
    {
        for student in students
        {
            print("Name: \(student.firstName) \(student.lastName), GPA: \(student.averageGrade)")
        }
    }

    func listStudentsByDescendingGPA()
    {
        let sortedStudents = students.sorted { $0.averageGrade > $1.averageGrade}
        for student in sortedStudents
        {
            print("Name: \(student.firstName) \(student.lastName), GPA: \(student.averageGrade)")
        }
    }

    func averageScore() -> Double
    {
        let totalAverage = students.reduce(0.0) { $0 + $1.averageGrade}
        return totalAverage / Double(students.count)
    }

    func highestGPAStudent() -> Student?
    {
        return students.max(by: { $0.averageGrade < $1.averageGrade})
    }

    mutating func addStudentFromInput()
    {
        print("\nEnter student details:")
        print("First Name: ", terminator: "")
        let firstName = readLine() ?? ""
        print("Last Name: ", terminator: "")
        let lastName = readLine() ?? ""
        print("Average Grade: ", terminator: "")
        if let averageGrade = Double(readLine() ?? "")
        {
            let newStudent = Student(firstName: firstName, lastName: lastName, averageGrade: averageGrade)
            addStudent(student: newStudent)
            print("Student added successfully!\n")
        }
        else
        {
            print("Invalid input for average grade. Student not added.\n")
        }
    }
}

var journal = StudentJournal()

let student1 = Student(firstName: "Daniil", lastName: "Reznikov", averageGrade: 87.5)
let student2 = Student(firstName: "Ryan", lastName: "Gosling", averageGrade: 99.9)
let student3 = Student(firstName: "John", lastName: "Wick", averageGrade: 45.2)

journal.addStudent(student: student1)
journal.addStudent(student: student2)
journal.addStudent(student: student3)

journal.displayAllStudents()

journal.removeStudent(firstName: "Daniil", lastName: "Reznikov")

print("\nAfter removing Daniil Reznikov:")
journal.displayAllStudents()

print("\nList of students by descending GPA:")
journal.listStudentsByDescendingGPA()

print("\nAverage score of all students: \(journal.averageScore())")

if let highestGPAStudent = journal.highestGPAStudent()
{
    print("\nStudent with the highest GPA: \(highestGPAStudent.firstName) \(highestGPAStudent.lastName), GPA: \(highestGPAStudent.averageGrade)")
}

journal.addStudentFromInput()
journal.displayAllStudents()
