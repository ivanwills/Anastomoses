package QuestionsDB::Result::Region;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

QuestionsDB::Result::Region

=cut

__PACKAGE__->table("region");

=head1 ACCESSORS

=head2 region_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'region_region_id_seq'

=head2 region

  data_type: 'character varying'
  is_nullable: 1

=head2 parent_region_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "region_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "region_region_id_seq",
  },
  "region",
  { data_type => "character varying", is_nullable => 1 },
  "parent_region_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);
__PACKAGE__->set_primary_key("region_id");

=head1 RELATIONS

=head2 bones

Type: has_many

Related object: L<QuestionsDB::Result::Bone>

=cut

__PACKAGE__->has_many(
  "bones",
  "QuestionsDB::Result::Bone",
  { "foreign.region_id" => "self.region_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 features

Type: has_many

Related object: L<QuestionsDB::Result::Feature>

=cut

__PACKAGE__->has_many(
  "features",
  "QuestionsDB::Result::Feature",
  { "foreign.region_id" => "self.region_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 muscles

Type: has_many

Related object: L<QuestionsDB::Result::Muscle>

=cut

__PACKAGE__->has_many(
  "muscles",
  "QuestionsDB::Result::Muscle",
  { "foreign.region_id" => "self.region_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 neurovasculars

Type: has_many

Related object: L<QuestionsDB::Result::Neurovascular>

=cut

__PACKAGE__->has_many(
  "neurovasculars",
  "QuestionsDB::Result::Neurovascular",
  { "foreign.region_id" => "self.region_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 parent_region

Type: belongs_to

Related object: L<QuestionsDB::Result::Region>

=cut

__PACKAGE__->belongs_to(
  "parent_region",
  "QuestionsDB::Result::Region",
  { region_id => "parent_region_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);

=head2 regions

Type: has_many

Related object: L<QuestionsDB::Result::Region>

=cut

__PACKAGE__->has_many(
  "regions",
  "QuestionsDB::Result::Region",
  { "foreign.parent_region_id" => "self.region_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2011-07-12 20:34:42
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:gMD7kYiGRYIZ0sT9NqLC/Q


# You can replace this text with custom content, and it will be preserved on regeneration
1;
