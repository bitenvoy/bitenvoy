defmodule BitEnvoyHub.MonitorChannel do
  use BitEnvoyHub.Web, :channel
  alias BitEnvoyHub.Event


  def join("monitor:lobby", payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  #Join the monitoring channel for a deployable 
  def join("monitor:"<> deployable_id, payload, socket) do
        {:error, %{reason: "not implemented"}}
  end


  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (monitor:lobby).
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end
 

  #tk test 
  def handle_in("hello", payload, socket) do
    broadcast socket, "shout", payload
    
    test_event = %Event{name: "Hello"}
    Repo.insert!(test_event)

    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
