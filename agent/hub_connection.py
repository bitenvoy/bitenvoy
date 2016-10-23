import websocket
import thread
import json 
import time



class HubConnection():
  '''
  TODO- this suffers from a bug in the connection logic
  there is no validation being done.

  It should be rewritten as a phoenix connection handler using 
  import socket
  '''

  def __init__(s, instance_location, secret):

     

    #setup connection
    websocket.enableTrace(True)
    s.ws = websocket.WebSocketApp(
        instance_location,
        on_message = s.on_message,
        on_error = s.on_error,
        on_close = s.on_close,
        on_open = s.on_open
      )
    s.ws.run_forever()


  def on_message(s, ws, message):
    print "========NEW MESSAGE==========="
    print message


  def on_error(s, ws, error):
    print "===========ERROR=========="
    print error
    #attempt to reconnect
    #close
    #initiate long polling

  def on_close(s, ws):
    print "===========CLOSING======="
    #attempt to reconnect
    #failover to longpolling


  def on_open(s, ws):
    #connect to phoenix server
    s.connect()

  def hello(s):
    print ("============HELLO===========")
    s.ws.send(
      json.dumps(
        {'topic':"monitor:lobby", 'event':"hello", 'payload':{}, 'ref':None}
        )
      )

  def connect(s):
    print("=======SENDING CONNECT PAYLOAD=========")
    data =  {'topic':"monitor:lobby", 'event':"phx_join", 'payload':{}, 'ref':None}
    s.ws.send(json.dumps(data))

