defmodule ExPermissions.User.Test do
  use ExUnit.Case

  defmodule UserWithoutImplementations do
    use ExPermissions.User

    defstruct foo: nil,
              bar: nil
  end

  test "passing nil instead of a proper 'object'" do
    assert_raise ExPermissions.User.CannotTell, fn -> nil |> ExPermissions.User.is? :foo end
    assert_raise ExPermissions.User.CannotTell, fn -> nil |> ExPermissions.User.not? :foo end
    assert_raise ExPermissions.User.CannotTell, fn -> nil |> ExPermissions.User.is? :bar end
    assert_raise ExPermissions.User.CannotTell, fn -> nil |> ExPermissions.User.not? :bar end
  end

  test "user without implementations(s) has no flags" do
    user = %UserWithoutImplementations{}
    assert_raise ExPermissions.User.CannotTell, fn -> user |> UserWithoutImplementations.is? :foo end
    assert_raise ExPermissions.User.CannotTell, fn -> user |> UserWithoutImplementations.not? :foo end
    assert_raise ExPermissions.User.CannotTell, fn -> user |> UserWithoutImplementations.is? :bar end
    assert_raise ExPermissions.User.CannotTell, fn -> user |> UserWithoutImplementations.not? :bar end
  end
end
