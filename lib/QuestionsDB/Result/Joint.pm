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

=head2 nerve_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 feature_id

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
  "nerve_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "feature_id",
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

=head2 features

Type: has_many

Related object: L<QuestionsDB::Result::Feature>

=cut

__PACKAGE__->has_many(
  "features",
  "QuestionsDB::Result::Feature",
  { "foreign.joint_id" => "self.joint_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 feature

Type: belongs_to

Related object: L<QuestionsDB::Result::Feature>

=cut

__PACKAGE__->belongs_to(
  "feature",
  "QuestionsDB::Result::Feature",
  { feature_id => "feature_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);

=head2 nerve

Type: belongs_to

Related object: L<QuestionsDB::Result::Nerve>

=cut

__PACKAGE__->belongs_to(
  "nerve",
  "QuestionsDB::Result::Nerve",
  { nerve_id => "nerve_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
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


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-10-19 20:04:19
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:PDtNL1dyfykD3LZDzHXiVg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
