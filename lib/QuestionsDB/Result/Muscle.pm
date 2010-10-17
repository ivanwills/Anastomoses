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

=head2 joint_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 nerve_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 movement_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 muscle

  data_type: 'character varying'
  is_nullable: 0

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
  "joint_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "nerve_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "movement_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "muscle",
  { data_type => "character varying", is_nullable => 0 },
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


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-10-17 19:59:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:pVrXigDzxSHOnv3SXXrWPg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
