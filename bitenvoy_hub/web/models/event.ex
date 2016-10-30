defmodule BitEnvoyHub.Event do
  use BitEnvoyHub.Web, :model

  schema "events" do
    field :name, :string
    field :output, :string
    field :state, :integer
    field :started, Ecto.DateTime
    field :completed, Ecto.DateTime
    belongs_to :deployables,  BitEnvoyHub.Deployable
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :output, :state, :started, :completed])
    |> validate_required([:name, :output, :state, :started, :completed])
  end
end
