
# Added Value for being FAIR
Boost Open Science via increase Findability, Accessibility, Interoperability and Reusability. 
1. Findable
The first step in (re)using data is to find them. Metadata and data should be easy to find for both humans and computers. Machine-readable metadata are essential for automatic discovery of datasets and services. 
2. Accessible
Once the user finds the required data, she/he needs to know how can they be accessed, possibly including authentication and authorisation.
3. Interoperable
The data usually need to be integrated with other data. In addition, the data need to interoperate with applications or workflows for analysis, storage, and processing.
4. Reusable
The ultimate goal of FAIR is to optimise the reuse of data. To achieve this, metadata and data should be well-described so that they can be replicated and/or combined in different settings.

# FAIR Data Cube

Within the [X-Omics](https://x-omics.nl/) project, we are establishing a first use case of the X-omics FAIR data cube, bears the principle that data should be "as open as possible and as closed as necessary".

FAIR data cube that combines individual -omics data sets or pointers to these data sets with associated linked metadata. 


The FAIR data cube should provide an interface to query/search rich human- and machine-understandable metadata and extract relevant molecular data for subsequent analysis. By incorporating a FAIR Data Point component internally, the data can be as open as possible and be FAIR-at-the-source. This will aid the integration of different types of omics data, and also promote the integration of -omics data from different sources, as well as facilitate submission to relevant data archives.


By setting up a knowledge graph consists of [FAIR Digital Objects](https://fairdigitalobjectframework.org/).
The FAIR Digital Objects could be resolved via [FDOF protocol](https://fairdigitalobjectframework.org/). The visist to the knowledge graph is controlled via an access mechanism, the data can be as closed as necessary, which enables properly addressing aspects of legislation, privacy, and ethics. The knowledge graph content is generated via bespoken tools and managed internally.

![Architecture of FAIR Data Cube](https://github.com/xiaofengleo/FAIRDataCube/blob/main/FAIRDataCube.png)

The following diagram shows the interaction between a researcher, a FDP server, and Vantage6 server/node. The Vantage6 infrastructure is included as a solution for running script on the dataset, which would comply with the privacy/legal regulation, cause the script is run on the dataset side.
![Detailed interaction with dataset utilizing Vantage6](https://github.com/xiaofengleo/FAIRDataCube/blob/main/FAIRDataCubeArchitecture5Oct2021.png)


