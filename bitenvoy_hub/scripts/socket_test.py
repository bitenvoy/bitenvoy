
from websocket import create_connection
import json






data = dict(topic="monitor:lobby", event="phx_join", payload={}, ref=None)
#this method joins the phoenix channel


ws = create_connection("ws://localhost:4000/socket/websocket")
ws.send(json.dumps(data))
print "Sent"
print "Receiving..."
result = ws.recv()
print "Received '%s'" % result
ws.close()
