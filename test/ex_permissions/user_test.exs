defmodule ExPermissions.User.Test do
  use ExUnit.Case

  defmodule UserWithoutImplementations do
    use ExPermissions.User

    defstruct foo: nil,
              bar: nil
  end

  test "user without implemenation(s) has no flags" do
    assert (%UserWithoutImplementations{} |> UserWithoutImplementations.is? :foo) == false
    assert (%UserWithoutImplementations{} |> UserWithoutImplementations.not? :bar) == true
  end
end
