package QuestionsDB::Result::Template;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

QuestionsDB::Result::Template

=cut

__PACKAGE__->table("template");

=head1 ACCESSORS

=head2 template_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'template_template_id_seq'

=head2 template_question

  data_type: 'character varying'
  is_nullable: 0

=head2 template_answer

  data_type: 'character varying'
  is_nullable: 0

=head2 template_q_table

  data_type: 'character varying'
  is_nullable: 1

=head2 template_q_column

  data_type: 'character varying'
  is_nullable: 1

=head2 template_a_table

  data_type: 'character varying'
  is_nullable: 1

=head2 template_a_column

  data_type: 'character varying'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "template_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "template_template_id_seq",
  },
  "template_question",
  { data_type => "character varying", is_nullable => 0 },
  "template_answer",
  { data_type => "character varying", is_nullable => 0 },
  "template_q_table",
  { data_type => "character varying", is_nullable => 1 },
  "template_q_column",
  { data_type => "character varying", is_nullable => 1 },
  "template_a_table",
  { data_type => "character varying", is_nullable => 1 },
  "template_a_column",
  { data_type => "character varying", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("template_id");
__PACKAGE__->add_unique_constraint("template_template_question_key", ["template_question"]);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-10-19 20:54:24
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:sfzY2nZcHF5SH7m2T9njHQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
