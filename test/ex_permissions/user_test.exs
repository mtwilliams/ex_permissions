defmodule ExPermissions.User.Test do
  use ExUnit.Case

  defmodule UserWithoutImplementations do
    use ExPermissions.User

    defstruct foo: nil,
              bar: nil
  end

  test "passing nil instead of a proper 'object'" do
    assert (nil |> ExPermissions.User.is? :foo) == false
    assert (nil |> ExPermissions.User.not? :bar) == true
  end

  test "user without implementations(s) has no flags" do
    assert (%UserWithoutImplementations{} |> ExPermissions.User.is? :foo) == false
    assert (%UserWithoutImplementations{} |> ExPermissions.User.not? :bar) == true
  end
end
