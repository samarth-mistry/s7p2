import requests
import json
from django.http import HttpResponseNotModified, JsonResponse 

def get(request):
  host = 'http://e199-34-125-195-178.ngrok.io/'
  upto = request.GET.get('upto')
  freq = request.GET.get('freq')
  interp = request.GET.get('interp')
  forecast_host_url = host+'get-forecast?upto='+upto+'&freq='+freq+'&interp='+interp
  print(forecast_host_url)
  response = requests.get(forecast_host_url)
  data = response.content     #bytes
  data = data.decode('utf8').replace("'", '"')
  data = json.loads(data)     #dict

  labels, datasets, l1, l2 = [], [], [], []
  for i in data["ori_data"]:
    labels.append(i['date'])
    l1.append(i['sales'])
    l2.append(None)

  for i in data["forecast"]:
    labels.append(i['date'])
    l2.append(i['sales'])

  datasets.append({
            "label": "Past Sale",
            "data": l1,
            "backgroundColor": "blue",
            "borderColor": "blue",
            "borderWidth": 1,
            "fill": False})
  datasets.append({
            "label": "Forecast Sale",
            "data": l2,
            "backgroundColor": "red",
            "borderColor": "red",
            "borderWidth": 2,
            "fill": False})

  final_json = {
      "labels": labels,
      "datasets": datasets
  }

  return JsonResponse(final_json)