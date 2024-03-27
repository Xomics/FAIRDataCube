import requests
import sys
import time

def check_triple_store_status(graphdb_url):
    url = graphdb_url + "/rest/repositories"
    try:
        response = requests.request("GET", url)
        print(response.headers)
        if response.status_code == 200:
            return True
    except:
        return False



print("Repository manager startup script started")
graphdb_url = sys.argv[1]
if graphdb_url.endswith("/"):
    graphdb_url = graphdb_url[:-1]
print(graphdb_url)
while not check_triple_store_status(graphdb_url):
    print("Waiting for triple store come online")
    time.sleep(10)