
# FAIR Data Cube

Within the [X-Omics](https://x-omics.nl/) project, we are establishing a first use case of the X-omics FAIR data cube. 
A FAIR Data Cube comprises of a FDP server, a Vantage6 server/node.  

The following diagram shows the interaction between a researcher, a FDP server, and Vantage6 server/node.


- The Researcher (dataset owner) 

To facilitate creation of FAIR multi-omics data and metadata, we collaborate with different initiatives such as the FAIR Genomes project. We adopt and develop metadata schemas for different omics data types, and make use of the Investigation-Study-Assay (ISA) metadata framework to capture experimental metadata. 

Considering the variety and flexibility in ISA, particularly the assay,  we submit general info, which is a subset in the investigation that is DCAT compatible. The remaining info which require extra work to define SHACL shapes for, could be uploaded to an extra triplestore like GraphDB.  

- The Researcher (potential researcher user) 

The FAIR Data Point servers as a metadata hub for publishing the metadata of datasets.  

A researcher (potential researcher user) search/browse the FDP for dataset, after finding interesting dataset, sends computation requests to the Vantage 6 server and retrieves the results. 

A computation request consist of: 

1. a reference to a docker image, which contains the code (computation) that the researcher would like to run on the target dataset 

2. A list describing dataset of interest and purpose of use 

- Vantage6 Server 

The Vantage6 works as a relay to pass computation request and results between the researcher (potential dataset user) and the datasets. This is implement the idea of bringing computation request to dataset, which would comply with the privacy/legal regulation, cause the script is run on the dataset on-site, under the supervision of the dataset guardian. 

The Vantage6 server handles authentication, keeps track of all computation requests, assigns them to nodes and stores the results of the computation requests. 

This server could also hosts a private Docker registry. 

- Vantage6 Node 

A Vantage6 node has access to its site’s data. It listens (websockets) for work (computation requests). Once it receives a request, it executes the request by: 

1. Downloading the corresponding Docker image. 

2. Running the image with the input parameters. 

The code that runs in the image has access to the local data through the node. 

The results should never contain any identifiable (patient) information, but only aggregated statistics. 


![Architecture of FAIR Data Cube](https://github.com/Xomics/FAIRDataCube/blob/master/FAIRDataCube.jpg)


More iformation can be found on Wiki
