import hub_connection as conn

def main():
    hub_connection = conn.HubConnection(
        "ws://localhost:4000/socket/websocket/", 'secret')

if __name__ == "__main__":
    main()
