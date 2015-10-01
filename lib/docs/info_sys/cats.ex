defmodule Docs.InfoSys.Cats do
  use GenServer

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts)
  end

  def init(opts) do
    send(self, :request)
    {:ok, opts}
  end

  def handle_info(:request, opts) do
    if String.contains?(opts[:expr], "cat") do
      img_url = random_cat()
      send(opts[:client_pid], {:result, self, %{
                                score: 100, img_url: img_url}})
    else
    end
    {:stop, :shutdown, opts}
  end

  def random_cat() do
    Enum.random([
      "http://stylonica.com/wp-content/uploads/2014/03/Cute-Cats-cats-33440930-1280-800.jpg",
      "http://i.ytimg.com/vi/W-PBFMECvTE/maxresdefault.jpg",
      "http://www.findcatnames.com/wp-content/uploads/2014/09/453768-cats-cute.jpg"
    ])
end
