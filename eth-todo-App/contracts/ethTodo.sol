pragma solidity ^0.5.0;

contract ethTodo {
  struct Task {
    string content; // task content
    bool completed; // task completion
    uint taskId; // task id
    uint date; // date task was created
  }
  mapping(uint => Task) taskList;
  uint taskCount; // no of task or last task id.
  uint[] idOfTasks; // array of id of all tasks
  event addedTask(uint, string, uint, bool); // event to create task
  address private owner;
  

  constructor todo(uint, address) public{
    taskCount = 0;
    owner = msg.sender;
  }
  //modifier to check if task called exists
  modifier taskCheck(uint taskId){
     // if task doesnt exit
    if(taskList[taskId].taskId == 0){
      revert();
    }
    _;
  }
  //modifier for only owner
  modifier onlyOwner(){
    require(msg.sender == owner);
    _;
  }

  // function to add new task
  function addNewTask(string memory _taskContent ) onlyOwner() public {
    taskCount++;// increment taskCount
    taskList[taskCount] = Task(taskCount, _taskContent, now, false);
    idOfTasks.push(taskCount);// push id of task created into list of all Ids
    emit addedTask(taskCount, _taskContent, now, false); // fire event to create task
    

  }

  //function to view new task
  function viewTask ( uint taskId) taskCheck(taskId) public view  returns(uint, string memory, uint, bool){
    // if task exist
    return (taskId, taskList[taskId].content, taskList[taskId].date,taskList[taskId].completed);
  }

  //function to get id of task
  function taskIdList() public view returns(uint[] memory){
    return idOfTasks; // returns id of all task
  }
}


/*  constructor() public {
    newTask("your List of task goes here");
  }

  function newTask(string memory _taskContent) public {
    taskList[taskNo] = task(taskNo, _taskContent, false);



    taskNo++; // increase taskNo upon adding new task
  } */