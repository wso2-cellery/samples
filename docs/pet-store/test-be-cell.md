# Testing the Petstore backend

The pet-be integration test sample contains a simple maven test to add and retrieve an order. Instructions for 
running the test are given below.

1. Test pet-be cell

```bash
$ cellery test wso2cellery/pet-be-cell:latest -n pet-be

✔ Extracting Cell Image wso2cellery/pet-be-cell:latest
✔ Reading Cell Image wso2cellery/pet-be-cell:latest
✔ Validating dependencies

Instances to be Used:

  INSTANCE NAME             CELL IMAGE             USED INSTANCE   SHARED  
 --------------- -------------------------------- --------------- --------
  pet-be          wso2cellery/pet-be-cell:latest   To be Created    -      

Dependency Tree to be Used:

 No Dependencies

? Do you wish to continue with starting above Cell instances (Y/n)? y



✔ Starting execution of tests for wso2cellery/pet-be-cell:latest...
Info: pet-be instance found created. Using existing instances and dependencies for testing
Info: Executing test pet-be-test...
Log: [INFO] Scanning for projects...
Log: [INFO]
Log: [INFO] --------< io.cellery.test.petstore:io.cellery.test.petstore.be >--------
Log: [INFO] Building io.cellery.test.petstore.be 0.3.0-SNAPSHOT
Log: [INFO] --------------------------------[ jar ]---------------------------------

.
.
.

Info: Test execution completed. Collecting logs to pet-be-test.log
Info: Deleting test cell pet-be-test
```

_Note:_ If there is no instance found by the name pet-be, a new cell will be spawned and this instance will be destroyed
 at the end of test execution. If pet-be instance is already existing, that instance will be used for running the tests.

To enable debug mode, run the following command. This will show more logs in the test execution flow.
```bash
$ cellery test wso2cellery/pet-be-cell:latest -n pet-be --debugMode
```

2. View logs
```bash
$ cat pet-be-test.log
```
