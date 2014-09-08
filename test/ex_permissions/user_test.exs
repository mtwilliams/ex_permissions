defmodule ExPermissions.User.Test do
  use ExUnit.Case

  defmodule UserWithoutImplementations do
    use ExPermissions.User

    defstruct foo: nil,
              bar: nil
  end

  test "user without implemenation(s) has no flags" do
    assert (%UserWithoutImplementations{} |> ExPermissions.User.is? :foo) == false
    assert (%UserWithoutImplementations{} |> ExPermissions.User.not? :bar) == true
  end
end
