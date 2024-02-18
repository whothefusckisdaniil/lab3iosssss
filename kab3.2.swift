struct Task 
{
    var title: String
    var description: String
    var isCompleted: Bool
}

class ToDoList
{
    var tasks: [Task] = []

    func addTaskWithInput()
    {
        print("Enter task title:")
        if let title = readLine(), !title.isEmpty
        {
            print("Enter task description:")
            if let description = readLine()
            {
                let newTask = Task(title: title, description: description, isCompleted: false)
                tasks.append(newTask)
                print("Task added successfully!")
                
                displayAllTasks()
            }
            else 
            {
                print("Invalid description. Task not added.")
            }
        }
        else
        {
            print("Invalid title. Task bot added.")
        }
    }

    func displayAllTasks() 
    {
        print("-----------------------------------------------------------------")
        for (index, task) in tasks.enumerated()
        {
            print("\(index + 1). Title: \(task.title), Description: \(task.description), Completed: \(task.isCompleted ? "Yes" : "No")")
        }
        print("-----------------------------------------------------------------")
    }

    func markTaskAsCompleted()
    {
        displayAllTasks()

        print("Enter the index of the task to mark as completed:")
        if let input = readLine(), let index = Int(input), index > 0, index <= tasks.count
        {
            tasks[index - 1].isCompleted = true
            print("Task marked as completed!")
        }
        else
        {
            print("Invalid input. Task not marked as completed.")
        }
    }

    func askNumberOfTasks() -> Int 
    {
        print("How many tasks do you want to add?")
        if let input = readLine(), let numberOfTasks = Int(input), numberOfTasks > 0
        {
            return numberOfTasks
        }
        else
        {
            print("Invalid input. Default to 1 task.")
            return 1
        }
    }

    func simUsage()
    {
        let numberOfTasks = askNumberOfTasks()

        for _ in 1...numberOfTasks
        {
            addTaskWithInput()
        }
        markTaskAsCompleted()
    }
}

let simToDoList = ToDoList()
simToDoList.simUsage()
