# Docker container to run the [FDP submission script](https://github.com/casper937/FAIRDataCube/blob/master/CMBI_FDP_Covid_Scripts.ipynb)

## Build Docker container

```
cd Docker/
docker build -t casperdevisser/fdp_submission:$VERSION . 
```

## Run Docker container interactively
- ```docker run -it -v ${PWD}:/work/ casperdevisser/fdp_submission:$VERSION```
    - **${PWD}** is an absolute path, but should point to: *`~/FAIRDataCube/Docker/`* 
    - Inside container:
        ```
        conda activate fdp_submission
        python3 run_papermill.py ${username} ${password}
        ```


## Run Docker container (currently not possible, because of safety concerns)
- ```docker run -v ${PWD}:/work/ casperdevisser/fdp_submission:$VERSION ${username} ${password}``` 
    - **${PWD}** is an absolute path, but should point to: *`~/FAIRDataCube/Docker/`*
    - specify username and password for FDP as arguments
