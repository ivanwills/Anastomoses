package QuestionsDB::Result::Bone;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

QuestionsDB::Result::Bone

=cut

__PACKAGE__->table("bone");

=head1 ACCESSORS

=head2 bone_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'bone_bone_id_seq'

=head2 bone_group

  data_type: 'character varying'
  is_nullable: 1

=head2 region_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 joint_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 articulation

  data_type: 'character varying'
  is_nullable: 1

=head2 bone

  data_type: 'character varying'
  is_nullable: 1

=head2 muscle_insertions

  data_type: 'character varying'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "bone_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "bone_bone_id_seq",
  },
  "bone_group",
  { data_type => "character varying", is_nullable => 1 },
  "region_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "joint_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "articulation",
  { data_type => "character varying", is_nullable => 1 },
  "bone",
  { data_type => "character varying", is_nullable => 1 },
  "muscle_insertions",
  { data_type => "character varying", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("bone_id");

=head1 RELATIONS

=head2 region

Type: belongs_to

Related object: L<QuestionsDB::Result::Region>

=cut

__PACKAGE__->belongs_to(
  "region",
  "QuestionsDB::Result::Region",
  { region_id => "region_id" },
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

=head2 features

Type: has_many

Related object: L<QuestionsDB::Result::Feature>

=cut

__PACKAGE__->has_many(
  "features",
  "QuestionsDB::Result::Feature",
  { "foreign.bone_id" => "self.bone_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-10-17 19:59:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:bE/+v9aiz5yoOt5aJXVwTg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
