package QuestionsDB::Result::JointFeature;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

QuestionsDB::Result::JointFeature

=cut

__PACKAGE__->table("joint_feature");

=head1 ACCESSORS

=head2 joint_feature_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'joint_feature_joint_feature_id_seq'

=head2 joint_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 feature_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "joint_feature_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "joint_feature_joint_feature_id_seq",
  },
  "joint_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "feature_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("joint_feature_id");
__PACKAGE__->add_unique_constraint("joint_feature_joint_id_key", ["joint_id", "feature_id"]);

=head1 RELATIONS

=head2 joint

Type: belongs_to

Related object: L<QuestionsDB::Result::Joint>

=cut

__PACKAGE__->belongs_to(
  "joint",
  "QuestionsDB::Result::Joint",
  { joint_id => "joint_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 feature

Type: belongs_to

Related object: L<QuestionsDB::Result::Feature>

=cut

__PACKAGE__->belongs_to(
  "feature",
  "QuestionsDB::Result::Feature",
  { feature_id => "feature_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2011-07-12 20:34:42
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:glRD2q3gMyduynV0fv+Cdw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
