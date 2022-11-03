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
    version: version,
    targets: [
      "aarch64-apple-darwin",
      "x86_64-apple-darwin",
      "x86_64-unknown-linux-gnu",
      "arm-unknown-linux-gnueabihf",
      "aarch64-unknown-linux-gnu",
      "x86_64-pc-windows-msvc",
      "x86_64-pc-windows-gnu"
    ]

  def hash_256(_data), do: :erlang.nif_error(:nif_not_loaded)
end
