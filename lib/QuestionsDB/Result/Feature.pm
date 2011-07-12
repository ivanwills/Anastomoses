package QuestionsDB::Result::Feature;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

QuestionsDB::Result::Feature

=cut

__PACKAGE__->table("feature");

=head1 ACCESSORS

=head2 feature_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'feature_feature_id_seq'

=head2 feature_type

  data_type: 'character varying'
  is_nullable: 0

=head2 feature_subtype

  data_type: 'character varying'
  is_nullable: 1

=head2 feature

  data_type: 'character varying'
  is_nullable: 0

=head2 feature_description

  data_type: 'character varying'
  is_nullable: 0

=head2 feature_location

  data_type: 'character varying'
  is_nullable: 0

=head2 feature_insertion

  data_type: 'character varying'
  is_nullable: 1

=head2 feature_origin

  data_type: 'character varying'
  is_nullable: 1

=head2 bone_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 region_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 neurovascular_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 lateral_border

  data_type: 'character varying'
  is_nullable: 1

=head2 medial_border

  data_type: 'character varying'
  is_nullable: 1

=head2 feature_floor

  data_type: 'character varying'
  is_nullable: 1

=head2 feature_apex

  data_type: 'character varying'
  is_nullable: 1

=head2 feature_base

  data_type: 'character varying'
  is_nullable: 1

=head2 anterior_margin

  data_type: 'character varying'
  is_nullable: 1

=head2 posterior_margin

  data_type: 'character varying'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "feature_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "feature_feature_id_seq",
  },
  "feature_type",
  { data_type => "character varying", is_nullable => 0 },
  "feature_subtype",
  { data_type => "character varying", is_nullable => 1 },
  "feature",
  { data_type => "character varying", is_nullable => 0 },
  "feature_description",
  { data_type => "character varying", is_nullable => 0 },
  "feature_location",
  { data_type => "character varying", is_nullable => 0 },
  "feature_insertion",
  { data_type => "character varying", is_nullable => 1 },
  "feature_origin",
  { data_type => "character varying", is_nullable => 1 },
  "bone_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "region_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "neurovascular_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "lateral_border",
  { data_type => "character varying", is_nullable => 1 },
  "medial_border",
  { data_type => "character varying", is_nullable => 1 },
  "feature_floor",
  { data_type => "character varying", is_nullable => 1 },
  "feature_apex",
  { data_type => "character varying", is_nullable => 1 },
  "feature_base",
  { data_type => "character varying", is_nullable => 1 },
  "anterior_margin",
  { data_type => "character varying", is_nullable => 1 },
  "posterior_margin",
  { data_type => "character varying", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("feature_id");

=head1 RELATIONS

=head2 bone

Type: belongs_to

Related object: L<QuestionsDB::Result::Bone>

=cut

__PACKAGE__->belongs_to(
  "bone",
  "QuestionsDB::Result::Bone",
  { bone_id => "bone_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);

=head2 region

Type: belongs_to

Related object: L<QuestionsDB::Result::Region>

=cut

__PACKAGE__->belongs_to(
  "region",
  "QuestionsDB::Result::Region",
  { region_id => "region_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
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
  { "foreign.feature_id" => "self.feature_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2011-07-12 20:34:42
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:U8gNklTZri7lDDJPEWCrKg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
