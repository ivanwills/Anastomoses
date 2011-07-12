package QuestionsDB::Result::MuscleNeurovascular;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

QuestionsDB::Result::MuscleNeurovascular

=cut

__PACKAGE__->table("muscle_neurovascular");

=head1 ACCESSORS

=head2 muscle_neurovascular_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'muscle_neurovascular_muscle_neurovascular_id_seq'

=head2 muscle_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 neurovascular_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "muscle_neurovascular_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "muscle_neurovascular_muscle_neurovascular_id_seq",
  },
  "muscle_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "neurovascular_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);
__PACKAGE__->set_primary_key("muscle_neurovascular_id");
__PACKAGE__->add_unique_constraint(
  "muscle_neurovascular_muscle_id_key",
  ["muscle_id", "neurovascular_id"],
);

=head1 RELATIONS

=head2 muscle

Type: belongs_to

Related object: L<QuestionsDB::Result::Muscle>

=cut

__PACKAGE__->belongs_to(
  "muscle",
  "QuestionsDB::Result::Muscle",
  { muscle_id => "muscle_id" },
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
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2011-07-12 20:34:42
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ilKAg+oVxHc4HTp4sBKXwQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
