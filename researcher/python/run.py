from vantage6.client import Client
from pathlib import Path
import time

print("Attempt login to Vantage6 API")
client = Client("http://localhost", 5000, "/api")
client.authenticate("johan", "1234")

client.setup_encryption(None)

input_ = {
    "master": "true",
    "method":"master", 
    "args": [
        {
            "ID":"Int64",
            "Age":"Int64", 
            "Clinical.T.Stage":"category", 
            "Clinical.N.Stage":"category",
            "Clinical.M.Stage": "category",
            "Overall.Ajcc.Stage": "category",
            "Histology": "category",
            "Sex": "category",
            "Survival.Time.Days": "Int64",
            "deadstatus.event": "Int64"}, 
        ".",
        ";"], 
    "kwargs": {}
}

print("Requesting to execute summary algorithm")
task = client.post_task(
    name="testing",
    image="harbor.vantage6.ai/algorithms/summary",
    collaboration_id=1,
    input_= input_,
    organization_ids=[1, 2]
)

print("Wait and fetch results")
res = client.get_results(task_id=task.get("id"))
attempts=1
while((res[0]["result"] == None) and attempts < 7):
    print("waiting...")
    time.sleep(5)
    res = client.get_results(task_id=task.get("id"))
    attempts += 1
print(res[0]["result"])