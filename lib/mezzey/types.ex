defmodule Mezzey.Schema.Types do
    use Absinthe.Schema.Notation

    object :thing do
        field :numba, :string
    end
end