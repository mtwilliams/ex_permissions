defmodule ExPermissions.User.Test do
  use ExUnit.Case

  defmodule UserWithoutImplementations do
    use ExPermissions.User

    defstruct foo: nil,
              bar: nil
  end

  test "passing nil instead of a proper 'object'" do
    assert (nil |> ExPermissions.User.is? :foo) == false
    assert_raise ExPermissions.User.IsNot, fn -> nil |> ExPermissions.User.is! :foo end
    assert (nil |> ExPermissions.User.not? :bar) == true
  end

  test "user without implementations(s) has no flags" do
    assert (%UserWithoutImplementations{} |> UserWithoutImplementations.is? :foo) == false
    assert_raise ExPermissions.User.IsNot, fn -> %UserWithoutImplementations{} |> UserWithoutImplementations.is! :foo end
    assert (%UserWithoutImplementations{} |> UserWithoutImplementations.not? :bar) == true
  end
end
