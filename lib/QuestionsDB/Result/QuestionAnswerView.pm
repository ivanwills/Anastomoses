package QuestionsDB::Result::QuestionAnswerView;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

QuestionsDB::Result::QuestionAnswerView

=cut

__PACKAGE__->table("question_answer_view");

=head1 ACCESSORS

=head2 answer_id

  data_type: 'integer'
  is_nullable: 1

=head2 question_id

  data_type: 'integer'
  is_nullable: 1

=head2 question

  data_type: 'character varying'
  is_nullable: 1

=head2 category_id

  data_type: 'integer'
  is_nullable: 1

=head2 question_description

  data_type: 'character varying'
  is_nullable: 1

=head2 question_template_id

  data_type: 'integer'
  is_nullable: 1

=head2 question_answer_description

  data_type: 'character varying'
  is_nullable: 1

=head2 answer

  data_type: 'character varying'
  is_nullable: 1

=head2 answer_description

  data_type: 'character varying'
  is_nullable: 1

=head2 answer_truth

  data_type: 'boolean'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "answer_id",
  { data_type => "integer", is_nullable => 1 },
  "question_id",
  { data_type => "integer", is_nullable => 1 },
  "question",
  { data_type => "character varying", is_nullable => 1 },
  "category_id",
  { data_type => "integer", is_nullable => 1 },
  "question_description",
  { data_type => "character varying", is_nullable => 1 },
  "question_template_id",
  { data_type => "integer", is_nullable => 1 },
  "question_answer_description",
  { data_type => "character varying", is_nullable => 1 },
  "answer",
  { data_type => "character varying", is_nullable => 1 },
  "answer_description",
  { data_type => "character varying", is_nullable => 1 },
  "answer_truth",
  { data_type => "boolean", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.06001 @ 2011-07-12 20:34:42
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:HtDel1Fh0rF2UvWGtVkKHg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
