import requests

dom = "http://www.deeznuds.local"
print(f"Acc {dom} ...")
try:
    r = requests.get(dom)
    print(f"Status: {r.status_code}")
    print(r.text)
except Exception as e:
    print("Error:", e)

