package QuestionsDB::Result::Neurovascular;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

QuestionsDB::Result::Neurovascular

=cut

__PACKAGE__->table("neurovascular");

=head1 ACCESSORS

=head2 neurovascular_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'neurovascular_neurovascular_id_seq'

=head2 neurovascular_type

  data_type: 'character varying'
  is_nullable: 1

=head2 neurovascular_name

  data_type: 'character varying'
  is_nullable: 0

=head2 parent_neurovascularlar_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 region_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "neurovascular_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "neurovascular_neurovascular_id_seq",
  },
  "neurovascular_type",
  { data_type => "character varying", is_nullable => 1 },
  "neurovascular_name",
  { data_type => "character varying", is_nullable => 0 },
  "parent_neurovascularlar_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "region_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("neurovascular_id");

=head1 RELATIONS

=head2 features

Type: has_many

Related object: L<QuestionsDB::Result::Feature>

=cut

__PACKAGE__->has_many(
  "features",
  "QuestionsDB::Result::Feature",
  { "foreign.neurovascular_id" => "self.neurovascular_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 joints

Type: has_many

Related object: L<QuestionsDB::Result::Joint>

=cut

__PACKAGE__->has_many(
  "joints",
  "QuestionsDB::Result::Joint",
  { "foreign.neurovascular_id" => "self.neurovascular_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 muscle_neurovasculars

Type: has_many

Related object: L<QuestionsDB::Result::MuscleNeurovascular>

=cut

__PACKAGE__->has_many(
  "muscle_neurovasculars",
  "QuestionsDB::Result::MuscleNeurovascular",
  { "foreign.neurovascular_id" => "self.neurovascular_id" },
  { cascade_copy => 0, cascade_delete => 0 },
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

=head2 parent_neurovascularlar

Type: belongs_to

Related object: L<QuestionsDB::Result::Neurovascular>

=cut

__PACKAGE__->belongs_to(
  "parent_neurovascularlar",
  "QuestionsDB::Result::Neurovascular",
  { neurovascular_id => "parent_neurovascularlar_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);

=head2 neurovasculars

Type: has_many

Related object: L<QuestionsDB::Result::Neurovascular>

=cut

__PACKAGE__->has_many(
  "neurovasculars",
  "QuestionsDB::Result::Neurovascular",
  { "foreign.parent_neurovascularlar_id" => "self.neurovascular_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2011-07-12 20:34:42
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:FOTSBWl/t0Ap4lmRsUYIkw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
