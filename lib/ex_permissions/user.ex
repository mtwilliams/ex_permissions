# ===----------------------------------------------------------------------=== #
#
#  ExPermissions
#
#  This is free and unencumbered software released into the public domain.
#
#  Anyone is free to copy, modify, publish, use, compile, sell, or
#  distribute this software, either in source code form or as a compiled
#  binary, for any purpose, commercial or non-commercial, and by any
#  means.
#
#  In jurisdictions that recognize copyright laws, the author or authors
#  of this software dedicate any and all copyright interest in the
#  software to the public domain. We make this dedication for the benefit
#  of the public at large and to the detriment of our heirs and
#  successors. We intend this dedication to be an overt act of
#  relinquishment in perpetuity of all present and future rights to this
#  software under copyright law.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
#  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
#  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
#  IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
#  OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
#  ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
#  OTHER DEALINGS IN THE SOFTWARE.
#
#  For more information, please refer to <http://unlicense.org/>
#
# ===----------------------------------------------------------------------=== #

defmodule ExPermissions.User do
  @moduledoc """
  """

  def __using__(_opts \\ []) do
    quote do
      import ExPermissions.User
    end
  end

  def is?(user, flag), do: ExPermissions.User.Flags.is?(user, flag)
  def is!(user, flag), do: ExPermissions.User.Flags.is!(user, flag)
  def not?(user, flag), do: ExPermissions.User.Flags.not?(user, flag)
  def not!(user, flag), do: ExPermissions.User.Flags.not!(user, flag)
end

defprotocol ExPermissions.User.Flags do
  @moduledoc """
  """

  @fallback_to_any true

  @doc """
  """
  def is?(user, flag)

  @doc """
  """
  def is!(user, flag)

  @doc """
  """
  def not?(user, flag)

  @doc """
  """
  def not!(user, flag)
end

defmodule ExPermissions.User.Is do
  @moduledoc """
  """

  defexception [:message]
  def exception([flag: flag]), do: %__MODULE__{message: "User is #{flag}!"}
end

defmodule ExPermissions.User.IsNot do
  @moduledoc """
  """

  defexception [:message]
  def exception([flag: flag]), do: %__MODULE__{message: "User is not #{flag}!"}
end

defimpl ExPermissions.User.Flags, for: Any do
  def is?(_user, _flag), do: false # just break?
  def is!(user, flag) do
    ExPermissions.User.Flags.is?(user, flag) || raise ExPermissions.User.IsNot, flag: flag
  end

  def not?(_user, _flag), do: true # just break?
  def not!(user, flag) do
    ExPermissions.User.Flags.not?(user, flag) || raise ExPermissions.User.Is, flag: flag
  end
end
