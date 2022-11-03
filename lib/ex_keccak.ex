defmodule ExKeccak do
  @external_resource "README.md"
  @moduledoc "README.md"
             |> File.read!()

  version = Mix.Project.config()[:version]

  use RustlerPrecompiled,
    otp_app: :ex_keccak,
    path: "native/exkeccak",
    crate: :exkeccak,
    base_url: "https://github.com/basementdev/ex_keccak/releases/download/v#{version}",
    force_build: System.get_env("RUSTLER_PRECOMPILATION_EX_KECCAK_BUILD") in ["1", "true"],
    version: version

  def hash_256(_data), do: :erlang.nif_error(:nif_not_loaded)
end
