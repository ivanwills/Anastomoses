package QuestionsDB::Result::QuestionTemplate;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

QuestionsDB::Result::QuestionTemplate

=cut

__PACKAGE__->table("question_template");

=head1 ACCESSORS

=head2 question_template_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'question_template_question_template_id_seq'

=head2 question_template

  data_type: 'character varying'
  is_nullable: 0

=head2 answer_template

  data_type: 'character varying'
  is_nullable: 0

=head2 qtable

  data_type: 'character varying'
  is_nullable: 0

=head2 qcolumn

  data_type: 'character varying'
  is_nullable: 0

=head2 atable

  data_type: 'character varying'
  is_nullable: 1

=head2 acolumn

  data_type: 'character varying'
  is_nullable: 0

=head2 join_table

  data_type: 'character varying'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "question_template_id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "question_template_question_template_id_seq",
  },
  "question_template",
  { data_type => "character varying", is_nullable => 0 },
  "answer_template",
  { data_type => "character varying", is_nullable => 0 },
  "qtable",
  { data_type => "character varying", is_nullable => 0 },
  "qcolumn",
  { data_type => "character varying", is_nullable => 0 },
  "atable",
  { data_type => "character varying", is_nullable => 1 },
  "acolumn",
  { data_type => "character varying", is_nullable => 0 },
  "join_table",
  { data_type => "character varying", is_nullable => 1 },
);
__PACKAGE__->set_primary_key("question_template_id");
__PACKAGE__->add_unique_constraint(
  "question_template_question_template_key",
  ["question_template"],
);

=head1 RELATIONS

=head2 questions

Type: has_many

Related object: L<QuestionsDB::Result::Question>

=cut

__PACKAGE__->has_many(
  "questions",
  "QuestionsDB::Result::Question",
  { "foreign.question_template_id" => "self.question_template_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2010-10-21 05:50:15
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:GSZi987XUfl96jv1xPBPlg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
