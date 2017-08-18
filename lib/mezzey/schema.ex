defmodule Mezzey.Schema do
    use Absinthe.Schema
    import_types Mezzey.Schema.Types

    @thing %{ numba: "12345" }

    query do
        field :thing, :thing do
            resolve {:ok, @thing}
        end
    end
end