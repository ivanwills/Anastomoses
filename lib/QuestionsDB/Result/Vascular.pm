package QuestionsDB::Result::Vascular;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

QuestionsDB::Result::Vascular

=cut

__PACKAGE__->table("vascular");

=head1 ACCESSORS

=head2 vascular_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'vascular_vascular_id_seq'

=head2 vascular_type

  data_type: 'character varying'
  is_nullable: 1

=head2 vascular_name

  data_type: 'character varying'
  is_nullable: 0

=head2 parent_vascular_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 region_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "vascular_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "vascular_vascular_id_seq",
  },
  "vascular_type",
  { data_type => "character varying", is_nullable => 1 },
  "vascular_name",
  { data_type => "character varying", is_nullable => 0 },
  "parent_vascular_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "region_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("vascular_id");

=head1 RELATIONS

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

=head2 parent_vascular

Type: belongs_to

Related object: L<QuestionsDB::Result::Vascular>

=cut

__PACKAGE__->belongs_to(
  "parent_vascular",
  "QuestionsDB::Result::Vascular",
  { vascular_id => "parent_vascular_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);

=head2 vasculars

Type: has_many

Related object: L<QuestionsDB::Result::Vascular>

=cut

__PACKAGE__->has_many(
  "vasculars",
  "QuestionsDB::Result::Vascular",
  { "foreign.parent_vascular_id" => "self.vascular_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-10-17 19:59:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:g7iZ/y5yYpcxRo6LYgWJXQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
