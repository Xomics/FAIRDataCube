
# FAIR Data Cube

## Requirements
To deploy the FAIR Data Cube locally, the following requirements are needed.

**User requirements (Person who is deploying this solution)**

* Basic knowledge of Docker​
* Basic GitHub knowledge​

**System requirements​**

* Docker engine​
* Docker-compose application​

Clone this repository to your machine.

```sh
git clone https://github.com/Xomics/FAIRDataCube.git
```

Once you have cloned this repository, you can go to the directory where the repository is cloned. 
```
cd FAIRDataCube/
```

Then, switch to the FDCube branch via the command line.

```
git checkout FDCube
```


Then follow the instructions below. 
## Instructions

### Configuring bootstrap services
#### GraphDB


Go to the bootstrap directory to spin up the graph DB service.
```
cd bootstrap/
```

The `docker-compose.yml` file in the directory `FAIRDataCube/bootstrap` will set up the graphDB triple store and create `fdp` and `cde` repositories in graphDB. These two repositories are used by other services in FDCube, so ensure that the bootstrap services are properly set up before you proceed further.
   
To run the `docker-compose.yml` file in `FAIRDataCube/bootstrap`, you need GraphDB triple store free edition. Follow the steps below to get the free edition of GraphDB.

There are two options to get a Graph DB free version.


**Option 1:** **You can download graphdb-free-9.7.0-dist.zip via the link below
https://github.com/Xomics/FAIRDataCube/releases/tag/v1.0.0-alpha**
Download the graphdb-free-9.7.0-dist.zip file and move it to bootstrap/graph-db/

**Option 2:** download Graph DB from Ontotext following the the steps(1-3) below. Please note, **some details (for example, file name)** may change due to the revision of the Ontotext website. The steps below only serve as an example.

***Step 1:*** GO to this [url](https://www.ontotext.com/products/graphdb/graphdb-free/) and registry to download GraphDB free edition.


***Step 2:*** The download will be sent to your email. From the email, follow the link to the download page and click` on "Download as a stand-alone server". This step will download the "graphdb-free-{version}-dist.zip" file to your machine.


***Step 3:*** Move "graphdb-free-{version}-dist.zip" file to the following location

```sh
mv graphdb-free-{version}-dist.zip FAIRDataCube/bootstrap/graph-db
```
for windows

```sh
move graphdb-free-{version}-dist.zip FAIRDataCube/bootstrap/graph-db
```



If your `graphdb version` is different from `9.7.0`, then change the version number of GraphDB in the docker-compose file.

```sh
graph_db:
    build:
      context: ./graph-db
      dockerfile: Dockerfile        
      args:
        version: 9.7.0
```




#### Running bootstrap services
Once you have done the above configurations, you can run `bootstrap` services by running the `docker-compose.yml` file in the `FAIRDataCube/bootstrap` directory.

```sh
docker compose up -d
```

If the deployment is successful, then you can access the GraphDB by visiting the following URL.

| Service name | Local deployment | 
| --- | --- | 
| GraphDB | [http://localhost:7200](http://localhost:7200/) |

By default GraphDB service is secured, so you need credentials to log in to GraphDB. Please find the default GraphDB's credentials in the table below.

| Username| Password |
| --- | --- |
| `admin` | `root` |

### Configuring metadata services
#### FAIR Data Point
The `docker-compose.yml` file in the directory `FAIRDataCube/metadata` will set up `FAIR Data Point` and connect FAIR Data Point to the triple store created in the bootstrapping step.



**Step 1:** Before you run metadata services, ensure that the graphDB triple store is up and running. You can check by going to the following URL. For local deployment (on your laptop), `http://localhost:7200`, for production deployment (on your server), `http:server_ip:7200`



**Step 2:** Check if the `fdp` repository is available in the graphDB triple store.


#### Running metadata services
Once you have done the above checks, you can run `metadata` services by running the `docker-compose.yml` file in the `FAIRDataCube/metadata` directory.

```sh
docker compose up -d
```

If the deployment is successful, then you can access the FAIR Data Point by visiting the following URL.

| Service name | Local deployment |
| --- | --- |
| FAIR Data Point | [http://localhost:8080](http://localhost:8080) | 


To add content to the FAIR Data Point, you need credentials with write access. Please find the default FAIR Data Point's credentials in the table below.

| Username| Password |
| --- | --- |
| `albert.einstein@example.com` | `password` |

*If login fails with the default credentials, please check the note below for a solution.*


#### Note
The FAIR data point has a problem when a user tries to log in. For this moment, we can only use a temporary solution to fix this.

**Step 1:** Install a MongoDB client, for example, MongoDB Compass from [here](https://www.mongodb.com/try/download/compass).
**Step 2:** In the tools section, find the MongoDB Compass Download (GUI), choose the version, platform, and package that suits your situation, then go ahead by clicking the "Download" button.
Connect to the MongoDB database at localhost:27017. After opening the MongoDB Compass, add a new connection (see below). ![New connection](https://github.com/Xomics/FAIRDataCube/blob/FDCube/docs/images/mongoNewConnection.png).

In the new connection box, fill in the URI (accept the default local URI, mongodb:localhost:27017/), then click the Save & Connect button. See the image below for reference. ![Connection parameters](https://github.com/Xomics/FAIRDataCube/blob/FDCube/docs/images/newConnectionParameters.png).

After successfully connecting to the local MongoDB, you will see the FDP database already there.
Continue with the next step to drop this FDP database.
   
#### Note
If an error appears when saving and connecting with the default local URL. Then, follow the next steps.

   a. In your command line, stop the MongoDB container from the metadata folder by running: 
   ```sh
   docker stop mongodb_container_ID
   ```
   b. Afterwards, you can run the following command: 
   ```sh
   docker run -it -v C:/path/to/your/fairdatacube/FAIRDataCube/metadata/mongo/data:/data/db mongo:4.2.3 mongod --repair
   ```
   c. Go back to your MongoDB app and click again on connect with the local default URL. It should now be able to connect.
   And you can follow with the next steps: 
   
   
**Step 3:** Drop the FDP database, as shown in the screenshot below, by clicking the trash icon next to the fdp database.
   ![Drop fdp database from MongoDB Compass](https://github.com/Xomics/FAIRDataCube/blob/FDCube/docs/images/mongocompassDropFDP.png)
   
**Step 4:** Then, back to the FAIRDataCube/metadata directory, bring down the containers by running
```sh
docker compose down
```
And then bring it up again by running 
```sh
docker compose up -d
```

**Step 5:** Visit localhost:8080. (Note, you may see unable to load data error. Wait a few seconds to allow the FDP client to communicate with the mongo database.
**Step 6:** Login should also work by clicking Login and using the Albert.einstein@example.com/password to log in.



### Install Vantage6
To install Vantage6, please follow the document at [Install Vantage6](https://docs.vantage6.ai/en/main/server/install.html)


<!--- 
### Configuring data transformation services

#### Preparing input data

The transformation services take CSV as input files. We provide `CSVs` with example data and `YARRRML` templates for each pheno-packets module (individual, biosample).
The `YARRRML` templates are always loaded from GitHub automatically, so they stay up-to-date as we change the models in X-omics, but the `CSV` files must be added by the user.


#### Configuring configuration and data folders 


**Step 1:** Folder structure

Make sure the following folder structure, relative to where you plan to keep your pre- and post-transformed data, is available:
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



