
# FAIR Data Cube

## Requirements
To deploy the FAIR Data Cube locally, following requirements are needed.

**User requirements (Person who is deploying this solution)**

* Basic knowledge on Docker​
* Basic GitHub knowledge​

**System requirements​**

* Docker engine​
* Docker-compose application​

Clone this repository to your machine.

```sh
git clone https://github.com/Xomics/FAIRDataCube.git
```

Once you have cloned this repository, switch to the FDCube branch via following cmd

```
git checkout FDCube
```

Then follow the instructions below. 
## Instructions

### Configuring bootstrap services
#### GraphDB
The `docker-compose.yml` file in directory `FAIRDataCube/bootstrap` will setup up graphDB triple store and creates `fdp` and `cde` repositories in graphDB. These two repositories are used by other services in FDCube so make sure that bootstrap services are property setup before you proceed further.
   
To run `docker-compose.yml` file in `FAIRDataCube/bootstrap` you need graphDB triple store free edition. Follow the steps below to get free edition of graphdb.

**Step 1:** GO to this [url](https://www.ontotext.com/products/graphdb/graphdb-free/) and registry to download GraphDB free edition.


**Step 2:** The download will be sent to your email. From the email follow link to download page and `click` on "Download as a stand-alone server". This step will download "graphdb-free-{version}-dist.zip" file to your machine.


**Step 3:** Move "graphdb-free-{version}-dist.zip" file to the following location

```sh
mv graphdb-free-{version}-dist.zip FAIRDataCube/bootstrap/graph-db
```

**Step 4:** If your `graphdb version` is different from `9.7.0` then change the version number of graph DB in the docker-compose file.

```sh
graph_db:
    build:
      context: ./graph-db
      dockerfile: Dockerfile        
      args:
        version: 9.7.0
```

**If you can not succesfully downlaod a free graphdb, you can alternately download graphdb-free-9.7.0-dist.zip via the link below
https://github.com/Xomics/FAIRDataCube/releases/tag/v1.0.0-alpha**


#### Running bootstrap services
Once you have done above configurations you can run `bootstrap` services by running `docker-compose.yml` file in `FAIRDataCube/bootstrap` directory.

```sh
docker compose up -d
```

If the deployment is successful then you can access the graphDB by visiting the following URL.

| Service name | Local deployment | 
| --- | --- | 
| GraphDB | [http://localhost:7200](http://localhost:7200/) |

By default GraphDB service is secured so you need credentials to login to the graphDB. Please find the default graphDB's credentials in the table below.

| Username| Password |
| --- | --- |
| `admin` | `root` |

### Configuring metadata services
#### FAIR Data Point
The `docker-compose.yml` file in directory `FAIRDataCube/metadata` will setup up `FAIR Data Point` and connects FAIR Data Point to triple store created in the bootstrapping step.



**Step 1:** Before you run metadata services make sure that graphDB triple store is up running. You can check by going to following url. For local deployment (in your laptop) `http://localhost:7200` for production deployment (in your server) `http:server_ip:7200`



**Step 2:** Check if `fdp` repository is available in the graphDB triple store.


#### Running metadata services
Once you have done above checks you can run `metadata` services by running `docker-compose.yml` file in `FAIRDataCube/metadata` directory.

```sh
docker compose up -d
```

If the deployment is successful then you can access the FAIR Data Point by visiting the following URL.

| Service name | Local deployment |
| --- | --- |
| FAIR Data Point | [http://localhost:8080](http://localhost:8080) | 


In order to add content to the FAIR Data Point you need credentials with write access. Please find the default FAIR Data Point's credentials in the table below.

| Username| Password |
| --- | --- |
| `albert.einstein@example.com` | `password` |

**The FAIR data point has a problem when user tries to log in. For this moment, we can only using a temporary solution to fix this.**

1. Install Mongodb client, for example, MongoDB Compass from [here](https://www.mongodb.com/try/download/compass).
2. Connect to the MongoDB database localhost:27017. 
3. Drop the fdp database,as shown in the screenshot below.
   ![Drop fdp database from MongoDB Compass](https://github.com/Xomics/FAIRDataCube/blob/FDCube/docs/images/mongocompassDropFDP.png)
   
5. Then back to the FAIRDataCube/metadata directory, bring down the containers by running
   ```sh
   docker-compose down
   ```
 And then bring up again by running 
 ```sh
docker compose up -d
```

5. Visit localhost:8080. (Note, you may see unable load data error. Wait few seconds to allow FDP client to communicat with mongo database)
6. Login should also works by clicking Login and use the Albert.einstein@example.com/password to login.

<!--- 
### Configuring data transformation services

#### Preparing input data

The transformation services take `CSV` as input files. We provide `CSVs` with example data and `YARRRML` templates for each pheno-packets module (individual, biosample).
The `YARRRML` templates are always loaded from GitHub automatically, so they stay up-to-date as we change the models in X-omics, but the `CSV` files must be added by the user.


#### Configuring configuration and data folders 


**Step 1:** Folder structure

Make sure the following folder structure, relative to where you plan to keep your pre and post-transformed data, is available:
```
        .
        .xomics-ready-to-go/data/   
        .xomics-ready-to-go/data/mydataX.csv  (input csv files, e.g. "height.csv")
        .xomics-ready-to-go/data/mydataY.csv...
        .xomics-ready-to-go/config/   (this is the folder where yarrrml templates will be automatically loaded from the EJP repository)
``` 
**Step 2:**  Edit the .env file

the .env file will create the values for the environment variables in the docker compose file.  The first of these `baseURI` is the base for all URLs that represent your transformed data.  This should be set to something like:

`http://my.database.org/my_rd_data/`

this will result in Triple that look like this:

`<http://my.database.org/my_rd_data/person_123345_asdssaewe#ID>  <sio:has-value>  <"123345">`

optimally, these URLs will resolve...

**Step 3:**  Running data transformation services

Then you can run the data transformation services setup by running the `docker-compose.yml` file in `FDCube-in-box/xomics-ready-to-go` directory.  Be sure that you move this into the appropriate location; **THE docker-compose MUST BE RUN IN THE SAME FOLDER THAT CONTAINS THE ./data and ./config and subfolders**

You should then refresh your local copies of the docker images, to ensure they are up-to-date with what EJP is providing:

```
docker compose pull
```  
followed by:

```sh
docker compose up -d
```


**Step 4:** Input CSV files

Put an appropriately columned `XXXX.csv` into the `FDCube-in-box/xomics-ready-to-go/data`. Please look into this github repository for examples of CDEs `CSV` files.


**Step 5:** Input YARRRML templates

The `YARRRML` templates are always loaded from GitHub automatically on step 5, so they stay up-to-date as we change the models in X-omics.

Make sure the `YARRRML` templates files are matching your `CSV` files names `XXXX_yarrrml_template.yaml` and are in the `FDcube-in-box/xomics-ready-to-go/config` folder. Please look into [this](https://github.com/ejp-rd-vp/CDE-semantic-model-implementations/tree/master/YARRRML_Transform_Templates) github repository for CDEs `YARRRML` templates.


**Step 6:**  Executing transformations

Call the url:  http://localhost:4567 or http://SERVER-IP:4567  to trigger the transformation of each CSV file, and auto-load into graphDB (this will over-write what is currrently loaded!  We will make this behaviour more flexible later)
**Note:** If you deploy `FDCube in a box` solution in your laptop then check only for **localhost** url.

**There is sample data (height.csv) in the "xomics-ready-to-go/data" folder that can be used to test your installation.**


### How to modify semantic model in data transformation service

YARRRML is one the core technology which has been used in our data transformation service. If you like to extend the pheno-packet semantic model or add other semantic model to describe your data then, you have to provide custom YARRRML templates to the data transformation service. To learn more about building custom YARRRML templates please try [matey webapp](https://rml.io/yarrrml/matey/).

###Setting up Vantage 6 Server


Follow the instruction on vantage6 [documenttaion](https://docs.vantage6.ai/installation/server) to install vantage 6 server


---!>



