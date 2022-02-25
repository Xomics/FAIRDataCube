1.	The researcher 

     a.	 search/browse the FDP for dataset, 
  
      b.	after finding interesting dataset, sends computation requests to the Vantage 6 server
  
       c.	wait for the results.
  
       d. the researcher could communicate with the dataset owner regaring the metadata provided
       
       
2.	The Vantage6 server 


      a.	handles authentication, 
  
      b.	keeps track of all computation requests, 
  
      c.	assigns them to vantage6 nodes 
  
      d.	return the results of the computation requests to the researcher
  
3.	A Vantage6 node receives an assignment from vantage6 server, it executes the request by: 

      a.	Downloading the corresponding Docker image.
  
      b.	Running the image with the input parameters.
  
      c.	Return the results back o vantage 6 server
  
4.	The dataset owner submit their dataset metadata to the FDP, with specific steps: 

      a.	Prepare/Standardize/Ontologize metadata
  
      b.	Submit metadata via script or manually
      
      c. the dataset owner take responsibility to examine the coputation request and supervise the running of the script.
