package QuestionsDB::Result::Muscle;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

QuestionsDB::Result::Muscle

=cut

__PACKAGE__->table("muscle");

=head1 ACCESSORS

=head2 muscle_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'muscle_muscle_id_seq'

=head2 compartment

  data_type: 'character varying'
  is_nullable: 1

=head2 joint_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 nerve_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 muscle

  data_type: 'character varying'
  is_nullable: 0

=head2 muscle_head

  data_type: 'character varying'
  is_nullable: 1
  size: 255

=head2 muscle_group

  data_type: 'character varying'
  is_nullable: 1

=head2 origin

  data_type: 'character varying'
  is_nullable: 1

=head2 insertion

  data_type: 'character varying'
  is_nullable: 1

=head2 action

  data_type: 'character varying'
  is_nullable: 1

=head2 region_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "muscle_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "muscle_muscle_id_seq",
  },
  "compartment",
  { data_type => "character varying", is_nullable => 1 },
  "joint_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "nerve_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "muscle",
  { data_type => "character varying", is_nullable => 0 },
  "muscle_head",
  { data_type => "character varying", is_nullable => 1, size => 255 },
  "muscle_group",
  { data_type => "character varying", is_nullable => 1 },
  "origin",
  { data_type => "character varying", is_nullable => 1 },
  "insertion",
  { data_type => "character varying", is_nullable => 1 },
  "action",
  { data_type => "character varying", is_nullable => 1 },
  "region_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);
__PACKAGE__->set_primary_key("muscle_id");

=head1 RELATIONS

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

=head2 nerve

Type: belongs_to

Related object: L<QuestionsDB::Result::Nerve>

=cut

__PACKAGE__->belongs_to(
  "nerve",
  "QuestionsDB::Result::Nerve",
  { nerve_id => "nerve_id" },
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
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);

=head2 muscle_movements

Type: has_many

Related object: L<QuestionsDB::Result::MuscleMovement>

=cut

__PACKAGE__->has_many(
  "muscle_movements",
  "QuestionsDB::Result::MuscleMovement",
  { "foreign.muscle_id" => "self.muscle_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-11-29 06:06:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2dVyEY0QO6lYYycNtx/b6g


# You can replace this text with custom content, and it will be preserved on regeneration
1;
