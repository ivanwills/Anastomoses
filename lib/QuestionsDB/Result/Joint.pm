package QuestionsDB::Result::Joint;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

QuestionsDB::Result::Joint

=cut

__PACKAGE__->table("joint");

=head1 ACCESSORS

=head2 joint_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'joint_joint_id_seq'

=head2 neurovascular_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 joint

  data_type: 'character varying'
  is_nullable: 1

=head2 joint_class

  data_type: 'character varying'
  is_nullable: 1

=head2 joint_type

  data_type: 'character varying'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "joint_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "joint_joint_id_seq",
  },
  "neurovascular_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "joint",
  { data_type => "character varying", is_nullable => 1 },
  "joint_class",
  { data_type => "character varying", is_nullable => 1 },
  "joint_type",
  { data_type => "character varying", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("joint_id");

=head1 RELATIONS

=head2 bones

Type: has_many

Related object: L<QuestionsDB::Result::Bone>

=cut

__PACKAGE__->has_many(
  "bones",
  "QuestionsDB::Result::Bone",
  { "foreign.joint_id" => "self.joint_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 neurovascular

Type: belongs_to

Related object: L<QuestionsDB::Result::Neurovascular>

=cut

__PACKAGE__->belongs_to(
  "neurovascular",
  "QuestionsDB::Result::Neurovascular",
  { neurovascular_id => "neurovascular_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);

=head2 joint_features

Type: has_many

Related object: L<QuestionsDB::Result::JointFeature>

=cut

__PACKAGE__->has_many(
  "joint_features",
  "QuestionsDB::Result::JointFeature",
  { "foreign.joint_id" => "self.joint_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 joint_movements

Type: has_many

Related object: L<QuestionsDB::Result::JointMovement>

=cut

__PACKAGE__->has_many(
  "joint_movements",
  "QuestionsDB::Result::JointMovement",
  { "foreign.joint_id" => "self.joint_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 muscles

Type: has_many

Related object: L<QuestionsDB::Result::Muscle>

=cut

__PACKAGE__->has_many(
  "muscles",
  "QuestionsDB::Result::Muscle",
  { "foreign.joint_id" => "self.joint_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2011-07-12 20:34:42
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:iqPNBuK9NiXNDtnFgl9Swg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
