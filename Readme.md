# Todolist DAPP

## Setting up the project

```shell
truffle init
```

## Compiling and Deploying

```shell
truffle compile


# Deploying
# ---------
# If no same contract in chain
truffle migrate
# If contract deployed prevouusly
truffle migrate --reset
```

## Interacting with contract

```shell
truffle console

# Truffle console -> for interacting with your contracts locally involving your address.

# Getting the deployed contract
truffle(development)> todolist = await Todolist.deployed()
undefined

# Getting the account
truffle(development)> account = await web3.eth.getCoinbase()
undefined

# Accessing the variables
truffle(development)> account
'0xa2f6895ac5fc9a96264a25b8bce898debe26dd41'

# Getting the balance
truffle(development)> web3.eth.getBalance(account)
'99987657760000000000'

# getting task count of account : 0xa2f6895ac5fc9a96264a25b8bce898debe26dd41
truffle(development)> taskCount = await todolist.tasksCount(account)
undefined

# Getting the task count
truffle(development)> taskCount.toNumber()
0

# getting all the tasks in an account
truffle(development)> tasksAll = await todolist.tasks(account,0)
undefined

# getting the tasks so that we can access
truffle(development)> tasksAll
Result {
  '0': BN {
    negative: 0,
    words: [ 0, <1 empty item> ],
    length: 1,
    red: null
  },
  '1': 'Hello World!!',
  '2': false,
  id: BN {
    negative: 0,
    words: [ 0, <1 empty item> ],
    length: 1,
    red: null
  },
  content: 'Hello World!!',
  completed: false
}
truffle(development)>

```
