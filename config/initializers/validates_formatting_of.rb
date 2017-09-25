ValidatesFormattingOf::Method.add :word_list, /\A([^\d\W]|[,]|[ ])*\Z/, "can only contain letters, spaces, and commas"
ValidatesFormattingOf::Method.add :institute_name, /\A([^\W]|[,]|[ ]|[.]|[-]|[']|[&])*\Z/, "only letters, spaces, commas, ' , - , & , and periods allowed"
