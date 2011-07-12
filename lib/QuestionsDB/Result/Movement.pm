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

=head2 joint_movements

Type: has_many

Related object: L<QuestionsDB::Result::JointMovement>

=cut

__PACKAGE__->has_many(
  "joint_movements",
  "QuestionsDB::Result::JointMovement",
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


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2011-07-12 20:34:42
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:pqmHVQ70ghjxCAbjLY6niw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
