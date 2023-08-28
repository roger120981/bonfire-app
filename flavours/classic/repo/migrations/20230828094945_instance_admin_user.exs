defmodule Bonfire.Social.Repo.Migrations.InstanceAdminUser do
  @moduledoc false
  use Ecto.Migration

  import Pointers.Migration

  def up do
    alter table("bonfire_data_access_control_instance_admin") do
      Ecto.Migration.add_if_not_exists(:user_id, weak_pointer(Pointers.Pointer))
    end
  end

  def down, do: nil
end
