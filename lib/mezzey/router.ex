defmodule Mezzey.Router do
    use Plug.Router

    plug Plug.Parsers,
        parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
        pass: ["*/*"],
        json_decoder: Poison
    plug :match
    plug :dispatch

    get "/", do: send_resp(conn, 200, 
        Poison.encode!(%{
                        status: :alive,
                        version: "0.0.1-alpha",
                        name: "Mezzey"
                        }))

    forward "/graphql", to: Absinthe.Plug,
        init_opts: [schema: Mezzey.Schema]

    forward "/graphiql",
        to: Absinthe.Plug.GraphiQL,
        init_opts: [schema: Mezzey.Schema]

    match _, do: send_resp(conn, 404, "Oops!")
end