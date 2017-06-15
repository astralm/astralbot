-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Июн 15 2017 г., 18:07
-- Версия сервера: 10.1.13-MariaDB
-- Версия PHP: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `astralbot`
--

-- --------------------------------------------------------

--
-- Структура таблицы `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `text` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `branches`
--

CREATE TABLE `branches` (
  `id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  `description` varchar(512) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `branch_questions`
--

CREATE TABLE `branch_questions` (
  `id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `branch_questions_view`
--
CREATE TABLE `branch_questions_view` (
`branch_id` int(11)
,`branch_name` varchar(32)
,`branch_description` varchar(512)
,`question_id` int(11)
,`question_text` text
);

-- --------------------------------------------------------

--
-- Структура таблицы `branch_rights`
--

CREATE TABLE `branch_rights` (
  `id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `right_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `branch_rights_view`
--
CREATE TABLE `branch_rights_view` (
`branch_id` int(11)
,`branch_name` varchar(32)
,`branch_description` varchar(512)
,`right_id` int(11)
,`right_name` varchar(32)
,`right_description` varchar(512)
);

-- --------------------------------------------------------

--
-- Структура таблицы `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `text` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `question_answers`
--

CREATE TABLE `question_answers` (
  `id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `question_answers_view`
--
CREATE TABLE `question_answers_view` (
`question_id` int(11)
,`question_text` text
,`answer_id` int(11)
,`answer_text` text
);

-- --------------------------------------------------------

--
-- Структура таблицы `question_questions`
--

CREATE TABLE `question_questions` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `second_question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `question_questions_view`
--
CREATE TABLE `question_questions_view` (
`question_id` int(11)
,`question_text` text
,`second_question_id` int(11)
,`second_question_text` text
);

-- --------------------------------------------------------

--
-- Структура таблицы `rights`
--

CREATE TABLE `rights` (
  `id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  `description` varchar(512) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `hash` varchar(32) COLLATE utf8_bin NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `session_answers`
--

CREATE TABLE `session_answers` (
  `id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `session_answers_view`
--
CREATE TABLE `session_answers_view` (
`session_id` int(11)
,`session_hash` varchar(32)
,`session_date_create` timestamp
,`answer_id` int(11)
,`answer_text` text
);

-- --------------------------------------------------------

--
-- Структура таблицы `session_questions`
--

CREATE TABLE `session_questions` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `session_questions_view`
--
CREATE TABLE `session_questions_view` (
`session_id` int(11)
,`session_hash` varchar(32)
,`session_date_create` timestamp
,`question_id` int(11)
,`question_text` text
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `tree`
--
CREATE TABLE `tree` (
`branch_id` int(11)
,`branch_name` varchar(32)
,`branch_description` varchar(512)
,`question_id` int(11)
,`question_text` text
,`answer_id` int(11)
,`answer_text` text
,`second_question_id` int(11)
,`second_question_text` text
);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  `surname` varchar(32) COLLATE utf8_bin NOT NULL,
  `email` varchar(40) COLLATE utf8_bin NOT NULL,
  `phone` varchar(12) COLLATE utf8_bin NOT NULL,
  `password` varchar(32) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `user_branches`
--

CREATE TABLE `user_branches` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `user_branches_view`
--
CREATE TABLE `user_branches_view` (
`user_id` int(11)
,`user_name` varchar(32)
,`user_surname` varchar(32)
,`user_email` varchar(40)
,`user_phone` varchar(12)
,`branch_id` int(11)
,`branch_name` varchar(32)
,`branch_description` varchar(512)
);

-- --------------------------------------------------------

--
-- Структура таблицы `user_rights`
--

CREATE TABLE `user_rights` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `right_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `user_rights_view`
--
CREATE TABLE `user_rights_view` (
`user_id` int(11)
,`user_name` varchar(32)
,`user_surname` varchar(32)
,`user_email` varchar(40)
,`user_phone` varchar(12)
,`right_id` int(11)
,`right_name` varchar(32)
,`right_description` varchar(512)
);

-- --------------------------------------------------------

--
-- Структура таблицы `user_sessions`
--

CREATE TABLE `user_sessions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `user_sessions_view`
--
CREATE TABLE `user_sessions_view` (
`user_id` int(11)
,`user_name` varchar(32)
,`user_surname` varchar(32)
,`user_email` varchar(40)
,`user_phone` varchar(12)
,`session_id` int(11)
,`session_hash` varchar(32)
,`session_date_create` timestamp
);

-- --------------------------------------------------------

--
-- Структура для представления `branch_questions_view`
--
DROP TABLE IF EXISTS `branch_questions_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `branch_questions_view`  AS  select `bq`.`branch_id` AS `branch_id`,`b`.`name` AS `branch_name`,`b`.`description` AS `branch_description`,`bq`.`question_id` AS `question_id`,`q`.`text` AS `question_text` from ((`branch_questions` `bq` join `branches` `b` on((`b`.`id` = `bq`.`branch_id`))) join `questions` `q` on((`q`.`id` = `bq`.`question_id`))) ;

-- --------------------------------------------------------

--
-- Структура для представления `branch_rights_view`
--
DROP TABLE IF EXISTS `branch_rights_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `branch_rights_view`  AS  select `br`.`branch_id` AS `branch_id`,`b`.`name` AS `branch_name`,`b`.`description` AS `branch_description`,`br`.`right_id` AS `right_id`,`r`.`name` AS `right_name`,`r`.`description` AS `right_description` from ((`branch_rights` `br` join `branches` `b` on((`b`.`id` = `br`.`branch_id`))) join `rights` `r` on((`r`.`id` = `br`.`right_id`))) ;

-- --------------------------------------------------------

--
-- Структура для представления `question_answers_view`
--
DROP TABLE IF EXISTS `question_answers_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `question_answers_view`  AS  select `qa`.`question_id` AS `question_id`,`q`.`text` AS `question_text`,`qa`.`answer_id` AS `answer_id`,`a`.`text` AS `answer_text` from ((`question_answers` `qa` join `questions` `q` on((`q`.`id` = `qa`.`question_id`))) join `answers` `a` on((`a`.`id` = `qa`.`answer_id`))) ;

-- --------------------------------------------------------

--
-- Структура для представления `question_questions_view`
--
DROP TABLE IF EXISTS `question_questions_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `question_questions_view`  AS  select `qq`.`question_id` AS `question_id`,`q`.`text` AS `question_text`,`qq`.`second_question_id` AS `second_question_id`,`sq`.`text` AS `second_question_text` from ((`question_questions` `qq` join `questions` `q` on((`q`.`id` = `qq`.`question_id`))) join `questions` `sq` on((`sq`.`id` = `qq`.`second_question_id`))) ;

-- --------------------------------------------------------

--
-- Структура для представления `session_answers_view`
--
DROP TABLE IF EXISTS `session_answers_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `session_answers_view`  AS  select `sa`.`session_id` AS `session_id`,`s`.`hash` AS `session_hash`,`s`.`date_create` AS `session_date_create`,`sa`.`answer_id` AS `answer_id`,`a`.`text` AS `answer_text` from ((`session_answers` `sa` join `sessions` `s` on((`s`.`id` = `sa`.`session_id`))) join `answers` `a` on((`a`.`id` = `sa`.`answer_id`))) ;

-- --------------------------------------------------------

--
-- Структура для представления `session_questions_view`
--
DROP TABLE IF EXISTS `session_questions_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `session_questions_view`  AS  select `sq`.`session_id` AS `session_id`,`s`.`hash` AS `session_hash`,`s`.`date_create` AS `session_date_create`,`sq`.`question_id` AS `question_id`,`q`.`text` AS `question_text` from ((`session_questions` `sq` join `sessions` `s` on((`s`.`id` = `sq`.`session_id`))) join `questions` `q` on((`q`.`id` = `sq`.`question_id`))) ;

-- --------------------------------------------------------

--
-- Структура для представления `tree`
--
DROP TABLE IF EXISTS `tree`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tree`  AS  select `bqv`.`branch_id` AS `branch_id`,`bqv`.`branch_name` AS `branch_name`,`bqv`.`branch_description` AS `branch_description`,`bqv`.`question_id` AS `question_id`,`bqv`.`question_text` AS `question_text`,`qav`.`answer_id` AS `answer_id`,`qav`.`answer_text` AS `answer_text`,`qqv`.`second_question_id` AS `second_question_id`,`qqv`.`second_question_text` AS `second_question_text` from ((`branch_questions_view` `bqv` left join `question_answers_view` `qav` on((`qav`.`question_id` = `bqv`.`question_id`))) left join `question_questions_view` `qqv` on((`qqv`.`question_id` = `bqv`.`question_id`))) ;

-- --------------------------------------------------------

--
-- Структура для представления `user_branches_view`
--
DROP TABLE IF EXISTS `user_branches_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_branches_view`  AS  select `ub`.`user_id` AS `user_id`,`u`.`name` AS `user_name`,`u`.`surname` AS `user_surname`,`u`.`email` AS `user_email`,`u`.`phone` AS `user_phone`,`ub`.`branch_id` AS `branch_id`,`b`.`name` AS `branch_name`,`b`.`description` AS `branch_description` from ((`user_branches` `ub` join `users` `u` on((`u`.`id` = `ub`.`user_id`))) join `branches` `b` on((`b`.`id` = `ub`.`branch_id`))) ;

-- --------------------------------------------------------

--
-- Структура для представления `user_rights_view`
--
DROP TABLE IF EXISTS `user_rights_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_rights_view`  AS  select `ur`.`user_id` AS `user_id`,`u`.`name` AS `user_name`,`u`.`surname` AS `user_surname`,`u`.`email` AS `user_email`,`u`.`phone` AS `user_phone`,`ur`.`right_id` AS `right_id`,`r`.`name` AS `right_name`,`r`.`description` AS `right_description` from ((`user_rights` `ur` join `users` `u` on((`u`.`id` = `ur`.`user_id`))) join `rights` `r` on((`r`.`id` = `ur`.`right_id`))) ;

-- --------------------------------------------------------

--
-- Структура для представления `user_sessions_view`
--
DROP TABLE IF EXISTS `user_sessions_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `user_sessions_view`  AS  select `us`.`user_id` AS `user_id`,`u`.`name` AS `user_name`,`u`.`surname` AS `user_surname`,`u`.`email` AS `user_email`,`u`.`phone` AS `user_phone`,`us`.`session_id` AS `session_id`,`s`.`hash` AS `session_hash`,`s`.`date_create` AS `session_date_create` from ((`user_sessions` `us` join `users` `u` on((`u`.`id` = `us`.`user_id`))) join `sessions` `s` on((`s`.`id` = `us`.`session_id`))) ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `branch_questions`
--
ALTER TABLE `branch_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Индексы таблицы `branch_rights`
--
ALTER TABLE `branch_rights`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `right_id` (`right_id`);

--
-- Индексы таблицы `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `question_answers`
--
ALTER TABLE `question_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `answer_id` (`answer_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Индексы таблицы `question_questions`
--
ALTER TABLE `question_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `second_question_id` (`second_question_id`);

--
-- Индексы таблицы `rights`
--
ALTER TABLE `rights`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hash` (`hash`);

--
-- Индексы таблицы `session_answers`
--
ALTER TABLE `session_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `answer_id` (`answer_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Индексы таблицы `session_questions`
--
ALTER TABLE `session_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Индексы таблицы `user_branches`
--
ALTER TABLE `user_branches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Индексы таблицы `user_rights`
--
ALTER TABLE `user_rights`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `right_id` (`right_id`);

--
-- Индексы таблицы `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `session_id` (`session_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `branch_questions`
--
ALTER TABLE `branch_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `branch_rights`
--
ALTER TABLE `branch_rights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `question_answers`
--
ALTER TABLE `question_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `question_questions`
--
ALTER TABLE `question_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `rights`
--
ALTER TABLE `rights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `session_answers`
--
ALTER TABLE `session_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `session_questions`
--
ALTER TABLE `session_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `user_branches`
--
ALTER TABLE `user_branches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `user_rights`
--
ALTER TABLE `user_rights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `user_sessions`
--
ALTER TABLE `user_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `branch_questions`
--
ALTER TABLE `branch_questions`
  ADD CONSTRAINT `branch_questions_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `branch_questions_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `branch_rights`
--
ALTER TABLE `branch_rights`
  ADD CONSTRAINT `branch_rights_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `branch_rights_ibfk_2` FOREIGN KEY (`right_id`) REFERENCES `rights` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `question_answers`
--
ALTER TABLE `question_answers`
  ADD CONSTRAINT `question_answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `question_answers_ibfk_2` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `question_questions`
--
ALTER TABLE `question_questions`
  ADD CONSTRAINT `question_questions_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `question_questions_ibfk_2` FOREIGN KEY (`second_question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `session_answers`
--
ALTER TABLE `session_answers`
  ADD CONSTRAINT `session_answers_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `session_answers_ibfk_2` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `session_questions`
--
ALTER TABLE `session_questions`
  ADD CONSTRAINT `session_questions_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `session_questions_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_branches`
--
ALTER TABLE `user_branches`
  ADD CONSTRAINT `user_branches_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_branches_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_rights`
--
ALTER TABLE `user_rights`
  ADD CONSTRAINT `user_rights_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_rights_ibfk_2` FOREIGN KEY (`right_id`) REFERENCES `rights` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD CONSTRAINT `user_sessions_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_sessions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
