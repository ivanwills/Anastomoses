package QuestionsDB::Result::JointMovement;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

QuestionsDB::Result::JointMovement

=cut

__PACKAGE__->table("joint_movement");

=head1 ACCESSORS

=head2 joint_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 movement_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "joint_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "movement_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);
__PACKAGE__->add_unique_constraint("joint_movement_joint_id_key", ["joint_id", "movement_id"]);

=head1 RELATIONS

=head2 movement

Type: belongs_to

Related object: L<QuestionsDB::Result::Movement>

=cut

__PACKAGE__->belongs_to(
  "movement",
  "QuestionsDB::Result::Movement",
  { movement_id => "movement_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);

=head2 joint

Type: belongs_to

Related object: L<QuestionsDB::Result::Joint>

=cut

__PACKAGE__->belongs_to(
  "joint",
  "QuestionsDB::Result::Joint",
  { joint_id => "joint_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-10-19 20:03:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:PKf8CCgb838/xHOcSZG0fg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
