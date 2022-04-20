# Docker container to run the [FDP submission script](https://github.com/casper937/FAIRDataCube/blob/master/CMBI_FDP_Covid_Scripts.ipynb)

## Build Docker container

```
cd Docker/
docker build -t casperdevisser/fdp_submission:$VERSION . 
```

## Run Docker container
- ```docker run -v ${PWD}:/work/ casperdevisser/fdp_submission:$VERSION```
    - **${PWD}** is an absolute path, but should point to: *`~/FAIRDataCube/Docker/`*
