package QuestionsDB::Result::MuscleMovement;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

QuestionsDB::Result::MuscleMovement

=cut

__PACKAGE__->table("muscle_movement");

=head1 ACCESSORS

=head2 muscle_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 movement_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "muscle_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "movement_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);
__PACKAGE__->add_unique_constraint("muscle_movement_muscle_id_key", ["muscle_id", "movement_id"]);

=head1 RELATIONS

=head2 muscle

Type: belongs_to

Related object: L<QuestionsDB::Result::Muscle>

=cut

__PACKAGE__->belongs_to(
  "muscle",
  "QuestionsDB::Result::Muscle",
  { muscle_id => "muscle_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);

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


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-10-18 07:53:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:klcFwMQuX+14GV1EhM1GQw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
