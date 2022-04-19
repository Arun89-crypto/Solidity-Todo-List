// SPDX-License-Identifier: MIT
pragma solidity 0.8.5;

contract Todolist {
    // task structure
    struct Task {
        uint256 id;
        string content;
        bool completed;
    }

    // Events
    // ------
    event TaskCreated(uint256 id, string content, bool completed);
    event TaskCompleted(uint256 id, bool completed);

    // Mapping of tasks (according to the address)
    /*
    tasks : {
        address1 : {
            1 : {
                id : "",
                content : "",
                completed : "",
            }
            .....
        },
        address2 : {
            1 : {
                id : "",
                content : "",
                completed : "",
            }
            .....
        }
        .....
    } 
    */
    mapping(address => mapping(uint256 => Task)) public tasks;
    // Mapping of the count of tasks created by a particular address
    /*
    address => number of tasks 
    */
    mapping(address => uint256) public tasksCount;

    function createTask(string memory _content) public {
        uint256 taskCount = tasksCount[msg.sender];
        tasks[msg.sender][taskCount] = Task(taskCount, _content, false);
        emit TaskCreated(taskCount, _content, false);
        tasksCount[msg.sender]++;
    }

    function toggleCompletion(uint256 _id) public {
        Task memory task = tasks[msg.sender][_id];
        task.completed = !task.completed;
        tasks[msg.sender][_id] = task;
        emit TaskCompleted(_id, task.completed);
    }
}
