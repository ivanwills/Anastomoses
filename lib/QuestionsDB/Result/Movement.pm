package QuestionsDB::Result::Movement;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

QuestionsDB::Result::Movement

=cut

__PACKAGE__->table("movement");

=head1 ACCESSORS

=head2 movement_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'movement_movement_id_seq'

=head2 movement

  data_type: 'character varying'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "movement_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "movement_movement_id_seq",
  },
  "movement",
  { data_type => "character varying", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("movement_id");

=head1 RELATIONS

=head2 joints

Type: has_many

Related object: L<QuestionsDB::Result::Joint>

=cut

__PACKAGE__->has_many(
  "joints",
  "QuestionsDB::Result::Joint",
  { "foreign.movement_id" => "self.movement_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 muscles

Type: has_many

Related object: L<QuestionsDB::Result::Muscle>

=cut

__PACKAGE__->has_many(
  "muscles",
  "QuestionsDB::Result::Muscle",
  { "foreign.movement_id" => "self.movement_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-10-17 19:59:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:6N3kbe+I9SnjEd5U3lOyjA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
