package QuestionsDB::Result::Nerve;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

QuestionsDB::Result::Nerve

=cut

__PACKAGE__->table("nerve");

=head1 ACCESSORS

=head2 nerve_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'nerve_nerve_id_seq'

=head2 nerve

  data_type: 'character varying'
  is_nullable: 1

=head2 parent_nerve_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "nerve_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "nerve_nerve_id_seq",
  },
  "nerve",
  { data_type => "character varying", is_nullable => 1 },
  "parent_nerve_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);
__PACKAGE__->set_primary_key("nerve_id");

=head1 RELATIONS

=head2 features

Type: has_many

Related object: L<QuestionsDB::Result::Feature>

=cut

__PACKAGE__->has_many(
  "features",
  "QuestionsDB::Result::Feature",
  { "foreign.nerve_id" => "self.nerve_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 joints

Type: has_many

Related object: L<QuestionsDB::Result::Joint>

=cut

__PACKAGE__->has_many(
  "joints",
  "QuestionsDB::Result::Joint",
  { "foreign.nerve_id" => "self.nerve_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 muscles

Type: has_many

Related object: L<QuestionsDB::Result::Muscle>

=cut

__PACKAGE__->has_many(
  "muscles",
  "QuestionsDB::Result::Muscle",
  { "foreign.nerve_id" => "self.nerve_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 parent_nerve

Type: belongs_to

Related object: L<QuestionsDB::Result::Nerve>

=cut

__PACKAGE__->belongs_to(
  "parent_nerve",
  "QuestionsDB::Result::Nerve",
  { nerve_id => "parent_nerve_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);

=head2 nerves

Type: has_many

Related object: L<QuestionsDB::Result::Nerve>

=cut

__PACKAGE__->has_many(
  "nerves",
  "QuestionsDB::Result::Nerve",
  { "foreign.parent_nerve_id" => "self.nerve_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-10-17 19:59:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:rbtjVaWJ8tfQ4TFZpUTefA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
