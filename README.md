# ExPermissions

[![Build Status](https://travis-ci.org/mtwilliams/expermissions.png?branch=master)](http://travis-ci.org/mtwilliams/expermissions)

TODO

How do I use it?
------------------

Implement one or more of the protocols ExPermission defines:

```elixir
defmodule App.User do
  defstruct _id: nil,
            verified: false,
            banned: false
end

defimpl ExPermissions.User.Flags, for: App.User do
  def is?(user, :verified), do: user.verified
  def is!(user, :verified) do
    is?(user, :verified) || raise App.User.Unverified, user: user
  end

  def not?(user, :banned), do: !user.banned
  def not!(user, :banned) do
    not?(user, :banned) || raise App.User.Banned, user: user
  end
end
```

Then use the `ExPermissions.User` and `ExPermissions.Credentials` modules to check for permissions and flags:

```elixir
user |> ExPermissions.User.is! :verified
user |> ExPermissions.User.not! :banned
```

How do I contribute?
--------------------

See our contribution guide [here](https://github.com/mtwilliams/expermissions/wiki/Contributing).

How is it licensed?
-------------------

Under the public domain.

```
Author(s):

  * Michael Williams

This is free and unencumbered software released into the public domain. Anyone
is free to copy, modify, publish, use, compile, sell, or distribute this
software, either in source code form or as a compiled binary, for any purpose,
commercial or non-commercial, and by any means.

In jurisdictions that recognize copyright laws, the author or authors of this
software dedicate any and all copyright interest in the software to the public
domain. We make this dedication for the benefit of the public large and to the
detriment of our heirs and successors. We intend this dedication to be an
overt act of relinquishment in perpetuity of all present and future rights to
this software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
