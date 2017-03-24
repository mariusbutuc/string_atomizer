defmodule StringAtomizer do
  @moduledoc """
  Documentation for StringAtomizer.
  """

  @doc """
  Take a CamelCase string and turn it into an unserscored atom.

      iex> StringAtomizer.from_camel_case("MyTestKey")
      :my_test_key

      iex> StringAtomizer.from_camel_case("myTestKey")
      :my_test_key

      iex> StringAtomizer.from_camel_case("AccountID")
      :account_id

      iex> StringAtomizer.from_camel_case("AccountIDForUser")
      :account_id_for_user

      iex> StringAtomizer.from_camel_case("UserKey123")
      :user_key123

      iex> StringAtomizer.from_camel_case("123FourFive6")
      :"123_four_five6"

      iex> StringAtomizer.from_camel_case("ACME")
      :acme

  Regular expression lifted from http://stackoverflow.com/questions/1175208/elegant-python-function-to-convert-camelcase-to-snake-case
  """
  @spec from_camel_case(String.t) :: atom
  def from_camel_case(string) do
    ~r/((?<=[a-z0-9])[A-Z]|(?!^)[A-Z](?=[a-z]))/
            |> Regex.replace(string, "_\\1")
            |> String.downcase
            |> String.to_atom
  end
end
