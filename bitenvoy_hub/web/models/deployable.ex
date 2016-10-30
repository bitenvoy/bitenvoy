defmodule BitEnvoyHub.Deployable do
  use BitEnvoyHub.Web, :model

  schema "deployables" do
    field :name, :string

   has_many :events, BitEnvoy.Event
   timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
