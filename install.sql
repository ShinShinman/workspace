
-- *** STRUCTURE:`tbl_fields_association` ***
DROP TABLE IF EXISTS`tbl_fields_association`;
CREATE TABLE`tbl_fields_association` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `hide_when_prepopulated` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `related_field_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `limit` int(4) unsigned NOT NULL DEFAULT '20',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_association` ***
INSERT INTO`tbl_fields_association` (`id`, `field_id`, `allow_multiple_selection`, `hide_when_prepopulated`, `related_field_id`, `limit`) VALUES (1, 17, 'yes', 'no', 15, 10);
INSERT INTO`tbl_fields_association` (`id`, `field_id`, `allow_multiple_selection`, `hide_when_prepopulated`, `related_field_id`, `limit`) VALUES (13, 19, 'no', 'no', 1, 20);
INSERT INTO`tbl_fields_association` (`id`, `field_id`, `allow_multiple_selection`, `hide_when_prepopulated`, `related_field_id`, `limit`) VALUES (14, 23, 'yes', 'no', 21, 6);

-- *** STRUCTURE:`tbl_fields_author` ***
DROP TABLE IF EXISTS`tbl_fields_author`;
CREATE TABLE`tbl_fields_author` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `default_to_current_user` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL,
  `author_types` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_author` ***

-- *** STRUCTURE:`tbl_fields_checkbox` ***
DROP TABLE IF EXISTS`tbl_fields_checkbox`;
CREATE TABLE`tbl_fields_checkbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_state` enum('on','off') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'on',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_checkbox` ***
INSERT INTO`tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (1, 24, 'off', NULL);

-- *** STRUCTURE:`tbl_fields_date` ***
DROP TABLE IF EXISTS`tbl_fields_date`;
CREATE TABLE`tbl_fields_date` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `pre_populate` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calendar` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `time` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_date` ***

-- *** STRUCTURE:`tbl_fields_datetime` ***
DROP TABLE IF EXISTS`tbl_fields_datetime`;
CREATE TABLE`tbl_fields_datetime` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `prepopulate` tinyint(1) DEFAULT '1',
  `time` tinyint(1) DEFAULT '1',
  `multiple` tinyint(1) DEFAULT '1',
  `range` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_datetime` ***
INSERT INTO`tbl_fields_datetime` (`id`, `field_id`, `prepopulate`, `time`, `multiple`, `range`) VALUES (36, 8, 0, 0, 1, 1);

-- *** STRUCTURE:`tbl_fields_image_preview_settings` ***
DROP TABLE IF EXISTS`tbl_fields_image_preview_settings`;
CREATE TABLE`tbl_fields_image_preview_settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `field-handles` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `table-width` int(11) unsigned DEFAULT NULL,
  `table-height` int(11) unsigned DEFAULT NULL,
  `table-resize` int(11) unsigned DEFAULT NULL,
  `table-position` int(11) unsigned DEFAULT NULL,
  `table-absolute` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `entry-width` int(11) unsigned DEFAULT NULL,
  `entry-height` int(11) unsigned DEFAULT NULL,
  `entry-resize` int(11) unsigned DEFAULT NULL,
  `entry-position` int(11) unsigned DEFAULT NULL,
  `entry-absolute` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_image_preview_settings` ***
INSERT INTO`tbl_fields_image_preview_settings` (`id`, `field_id`, `field-handles`, `table-width`, `table-height`, `table-resize`, `table-position`, `table-absolute`, `entry-width`, `entry-height`, `entry-resize`, `entry-position`, `entry-absolute`) VALUES (39, 10, 'glowny-obraz', NULL, NULL, NULL, NULL, 'no', 400, NULL, NULL, NULL, 'no');

-- *** STRUCTURE:`tbl_fields_image_upload` ***
DROP TABLE IF EXISTS`tbl_fields_image_upload`;
CREATE TABLE`tbl_fields_image_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validator` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unique` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `min_width` int(11) unsigned DEFAULT NULL,
  `min_height` int(11) unsigned DEFAULT NULL,
  `max_width` int(11) unsigned DEFAULT NULL,
  `max_height` int(11) unsigned DEFAULT NULL,
  `resize` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_image_upload` ***
INSERT INTO`tbl_fields_image_upload` (`id`, `field_id`, `destination`, `validator`, `unique`, `min_width`, `min_height`, `max_width`, `max_height`, `resize`) VALUES (80, 4, '/workspace/images/posts', '/\\.(?:bmp|gif|jpe?g|png)$/i', 'yes', 0, 0, 1920, 1080, 'yes');
INSERT INTO`tbl_fields_image_upload` (`id`, `field_id`, `destination`, `validator`, `unique`, `min_width`, `min_height`, `max_width`, `max_height`, `resize`) VALUES (81, 5, '/workspace/images/posts', '/\\.(?:bmp|gif|jpe?g|png)$/i', 'yes', 0, 0, 1920, 1080, 'yes');
INSERT INTO`tbl_fields_image_upload` (`id`, `field_id`, `destination`, `validator`, `unique`, `min_width`, `min_height`, `max_width`, `max_height`, `resize`) VALUES (71, 20, '/workspace/images/highlight', '/\\.(?:bmp|gif|jpe?g|png)$/i', 'yes', 1920, 1080, 1920, 1080, 'yes');

-- *** STRUCTURE:`tbl_fields_input` ***
DROP TABLE IF EXISTS`tbl_fields_input`;
CREATE TABLE`tbl_fields_input` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_input` ***

-- *** STRUCTURE:`tbl_fields_languages` ***
DROP TABLE IF EXISTS`tbl_fields_languages`;
CREATE TABLE`tbl_fields_languages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `available_codes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_languages` ***

-- *** STRUCTURE:`tbl_fields_link_preview` ***
DROP TABLE IF EXISTS`tbl_fields_link_preview`;
CREATE TABLE`tbl_fields_link_preview` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anchor_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_url` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_link_preview` ***

-- *** STRUCTURE:`tbl_fields_multilingual_textbox` ***
DROP TABLE IF EXISTS`tbl_fields_multilingual_textbox`;
CREATE TABLE`tbl_fields_multilingual_textbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `column_length` int(11) unsigned DEFAULT '75',
  `text_size` enum('single','small','medium','large','huge') COLLATE utf8_unicode_ci DEFAULT 'medium',
  `text_formatter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_length` int(11) unsigned DEFAULT '0',
  `text_cdata` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `text_handle` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `default_main_lang` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `required_languages` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=177 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_multilingual_textbox` ***
INSERT INTO`tbl_fields_multilingual_textbox` (`id`, `field_id`, `column_length`, `text_size`, `text_formatter`, `text_validator`, `text_length`, `text_cdata`, `text_handle`, `default_main_lang`, `required_languages`) VALUES (172, 1, 75, 'single', 'none', NULL, 0, 'no', 'yes', 'yes', 'main');
INSERT INTO`tbl_fields_multilingual_textbox` (`id`, `field_id`, `column_length`, `text_size`, `text_formatter`, `text_validator`, `text_length`, `text_cdata`, `text_handle`, `default_main_lang`, `required_languages`) VALUES (173, 2, 75, 'single', 'none', NULL, 0, 'no', 'no', 'yes', NULL);
INSERT INTO`tbl_fields_multilingual_textbox` (`id`, `field_id`, `column_length`, `text_size`, `text_formatter`, `text_validator`, `text_length`, `text_cdata`, `text_handle`, `default_main_lang`, `required_languages`) VALUES (174, 3, 75, 'large', 'markdown_extra_with_smartypants', NULL, 0, 'no', 'no', 'yes', 'main');
INSERT INTO`tbl_fields_multilingual_textbox` (`id`, `field_id`, `column_length`, `text_size`, `text_formatter`, `text_validator`, `text_length`, `text_cdata`, `text_handle`, `default_main_lang`, `required_languages`) VALUES (176, 9, 75, 'medium', 'markdown_extra_with_smartypants', NULL, 0, 'no', 'no', 'yes', 'main');
INSERT INTO`tbl_fields_multilingual_textbox` (`id`, `field_id`, `column_length`, `text_size`, `text_formatter`, `text_validator`, `text_length`, `text_cdata`, `text_handle`, `default_main_lang`, `required_languages`) VALUES (170, 15, 75, 'single', 'markdown_extra_with_smartypants', NULL, 30, 'no', 'no', 'no', 'all');
INSERT INTO`tbl_fields_multilingual_textbox` (`id`, `field_id`, `column_length`, `text_size`, `text_formatter`, `text_validator`, `text_length`, `text_cdata`, `text_handle`, `default_main_lang`, `required_languages`) VALUES (171, 16, 75, 'single', 'none', '/^[^\\s:\\/?#]+:(?:\\/{2,3})?[^\\s.\\/?#]+(?:\\.[^\\s.\\/?#]+)*(?:\\/?[^\\s?#]*\\??[^\\s?#]*(#[^\\s#]*)?)?$/', 0, 'no', 'no', 'yes', 'main');
INSERT INTO`tbl_fields_multilingual_textbox` (`id`, `field_id`, `column_length`, `text_size`, `text_formatter`, `text_validator`, `text_length`, `text_cdata`, `text_handle`, `default_main_lang`, `required_languages`) VALUES (139, 18, 75, 'large', 'markdown_extra_with_smartypants', NULL, 0, 'no', 'no', 'no', 'all');
INSERT INTO`tbl_fields_multilingual_textbox` (`id`, `field_id`, `column_length`, `text_size`, `text_formatter`, `text_validator`, `text_length`, `text_cdata`, `text_handle`, `default_main_lang`, `required_languages`) VALUES (144, 21, 75, 'single', 'markdown_extra_with_smartypants', NULL, 20, 'no', 'no', 'yes', 'main');
INSERT INTO`tbl_fields_multilingual_textbox` (`id`, `field_id`, `column_length`, `text_size`, `text_formatter`, `text_validator`, `text_length`, `text_cdata`, `text_handle`, `default_main_lang`, `required_languages`) VALUES (145, 22, 75, 'medium', 'markdown_extra_with_smartypants', NULL, 0, 'no', 'no', 'yes', NULL);
INSERT INTO`tbl_fields_multilingual_textbox` (`id`, `field_id`, `column_length`, `text_size`, `text_formatter`, `text_validator`, `text_length`, `text_cdata`, `text_handle`, `default_main_lang`, `required_languages`) VALUES (175, 25, 75, 'small', 'markdown_extra_with_smartypants', NULL, 0, 'no', 'no', 'yes', 'main');
INSERT INTO`tbl_fields_multilingual_textbox` (`id`, `field_id`, `column_length`, `text_size`, `text_formatter`, `text_validator`, `text_length`, `text_cdata`, `text_handle`, `default_main_lang`, `required_languages`) VALUES (152, 26, 75, 'single', 'none', NULL, 0, 'no', 'yes', 'no', 'all');

-- *** STRUCTURE:`tbl_fields_multiupload` ***
DROP TABLE IF EXISTS`tbl_fields_multiupload`;
CREATE TABLE`tbl_fields_multiupload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_multiupload` ***
INSERT INTO`tbl_fields_multiupload` (`id`, `field_id`, `destination`, `validator`) VALUES (3, 27, '/workspace/images/posts', '/\\.(?:bmp|gif|jpe?g|png)$/i');

-- *** STRUCTURE:`tbl_fields_order_entries` ***
DROP TABLE IF EXISTS`tbl_fields_order_entries`;
CREATE TABLE`tbl_fields_order_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `force_sort` enum('yes','no') DEFAULT 'no',
  `hide` enum('yes','no') DEFAULT 'no',
  `disable_pagination` enum('yes','no') DEFAULT 'no',
  `filtered_fields` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- *** DATA:`tbl_fields_order_entries` ***
INSERT INTO`tbl_fields_order_entries` (`id`, `field_id`, `force_sort`, `hide`, `disable_pagination`, `filtered_fields`) VALUES (10, 13, NULL, 'yes', NULL, NULL);

-- *** STRUCTURE:`tbl_fields_select` ***
DROP TABLE IF EXISTS`tbl_fields_select`;
CREATE TABLE`tbl_fields_select` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `sort_options` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `static_options` text COLLATE utf8_unicode_ci,
  `dynamic_options` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_select` ***
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `sort_options`, `static_options`, `dynamic_options`) VALUES (43, 7, 'no', 'yes', 'Aktualne wystawy, Zapowiedzi wystaw, Wystawy stałe, Galeria Jednego Projektu, Archiwum wystaw', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `sort_options`, `static_options`, `dynamic_options`) VALUES (44, 14, 'no', 'no', 'Czerwona', NULL);
INSERT INTO`tbl_fields_select` (`id`, `field_id`, `allow_multiple_selection`, `sort_options`, `static_options`, `dynamic_options`) VALUES (45, 28, 'yes', 'no', 'Test, Mest, Pest', NULL);

-- *** STRUCTURE:`tbl_fields_selectbox_link` ***
DROP TABLE IF EXISTS`tbl_fields_selectbox_link`;
CREATE TABLE`tbl_fields_selectbox_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `hide_when_prepopulated` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `related_field_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `limit` int(4) unsigned NOT NULL DEFAULT '20',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_selectbox_link` ***

-- *** STRUCTURE:`tbl_fields_taglist` ***
DROP TABLE IF EXISTS`tbl_fields_taglist`;
CREATE TABLE`tbl_fields_taglist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pre_populate_source` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `pre_populate_source` (`pre_populate_source`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_taglist` ***

-- *** STRUCTURE:`tbl_fields_textarea` ***
DROP TABLE IF EXISTS`tbl_fields_textarea`;
CREATE TABLE`tbl_fields_textarea` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `formatter` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_textarea` ***

-- *** STRUCTURE:`tbl_fields_textbox` ***
DROP TABLE IF EXISTS`tbl_fields_textbox`;
CREATE TABLE`tbl_fields_textbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `column_length` int(11) unsigned DEFAULT '75',
  `text_size` enum('single','small','medium','large','huge') DEFAULT 'medium',
  `text_formatter` varchar(255) DEFAULT NULL,
  `text_validator` varchar(255) DEFAULT NULL,
  `text_length` int(11) unsigned DEFAULT '0',
  `text_cdata` enum('yes','no') DEFAULT 'no',
  `text_handle` enum('yes','no') DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA:`tbl_fields_textbox` ***

-- *** STRUCTURE:`tbl_fields_upload` ***
DROP TABLE IF EXISTS`tbl_fields_upload`;
CREATE TABLE`tbl_fields_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_fields_upload` ***

-- *** STRUCTURE:`tbl_entries_data_1` ***
DROP TABLE IF EXISTS`tbl_entries_data_1`;
CREATE TABLE`tbl_entries_data_1` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `value_formatted` text COLLATE utf8_unicode_ci,
  `word_count` int(11) unsigned DEFAULT NULL,
  `handle-en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-en` text COLLATE utf8_unicode_ci,
  `value_formatted-en` text COLLATE utf8_unicode_ci,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `handle-pl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-pl` text COLLATE utf8_unicode_ci,
  `value_formatted-pl` text COLLATE utf8_unicode_ci,
  `word_count-pl` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle-en` (`handle-en`),
  KEY `handle-pl` (`handle-pl`),
  KEY `handle` (`handle`),
  FULLTEXT KEY `value-en` (`value-en`),
  FULLTEXT KEY `value_formatted-en` (`value_formatted-en`),
  FULLTEXT KEY `value-pl` (`value-pl`),
  FULLTEXT KEY `value_formatted-pl` (`value_formatted-pl`),
  FULLTEXT KEY `value` (`value`),
  FULLTEXT KEY `value_formatted` (`value_formatted`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_1` ***
INSERT INTO`tbl_entries_data_1` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (33, 2, '50-lat-muzeum-architektury-we-wroclawiu', '50 lat Muzeum Architektury we Wrocławiu', '50 lat Muzeum Architektury we Wrocławiu', 5, NULL, NULL, NULL, 0, '50-lat-muzeum-architektury-we-wroclawiu', '50 lat Muzeum Architektury we Wrocławiu', '50 lat Muzeum Architektury we Wrocławiu', 5);
INSERT INTO`tbl_entries_data_1` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (49, 3, 'wystawa-stala-architektoniczne-rzemioslo-artystyczne-od-xii-do-xx-wieku-w-nowej-odslonie', 'Wystawa stała Architektoniczne rzemiosło artystyczne od XII do XX wieku w nowej odsłonie', 'Wystawa stała Architektoniczne rzemiosło artystyczne od XII do XX wieku w nowej odsłonie', 13, NULL, NULL, NULL, 0, 'wystawa-stala-architektoniczne-rzemioslo-artystyczne-od-xii-do-xx-wieku-w-nowej-odslonie', 'Wystawa stała Architektoniczne rzemiosło artystyczne od XII do XX wieku w nowej odsłonie', 'Wystawa stała Architektoniczne rzemiosło artystyczne od XII do XX wieku w nowej odsłonie', 13);
INSERT INTO`tbl_entries_data_1` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (50, 1, 'two-sticks', 'Two Sticks', 'Two Sticks', 2, 'two-sticks-en', 'Two Sticks EN', 'Two Sticks EN', 3, 'two-sticks', 'Two Sticks', 'Two Sticks', 2);
INSERT INTO`tbl_entries_data_1` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (20, 4, 'test', 'Test', 'Test', 1, 'test-en', 'Test EN', 'Test EN', 2, 'test', 'Test', 'Test', 1);
INSERT INTO`tbl_entries_data_1` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (48, 19, 'made-in-europe', 'Made in Europe', 'Made in Europe', 3, 'made-in-europe', 'Made in Europe', 'Made in Europe', 3, 'made-in-europe', 'Made in Europe', 'Made in Europe', 3);

-- *** STRUCTURE:`tbl_entries_data_10` ***
DROP TABLE IF EXISTS`tbl_entries_data_10`;
CREATE TABLE`tbl_entries_data_10` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_10` ***

-- *** STRUCTURE:`tbl_entries_data_13` ***
DROP TABLE IF EXISTS`tbl_entries_data_13`;
CREATE TABLE`tbl_entries_data_13` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- *** DATA:`tbl_entries_data_13` ***
INSERT INTO`tbl_entries_data_13` (`id`, `entry_id`, `value`) VALUES (43, 1, 2);
INSERT INTO`tbl_entries_data_13` (`id`, `entry_id`, `value`) VALUES (26, 2, 3);
INSERT INTO`tbl_entries_data_13` (`id`, `entry_id`, `value`) VALUES (42, 3, 4);
INSERT INTO`tbl_entries_data_13` (`id`, `entry_id`, `value`) VALUES (13, 4, 5);
INSERT INTO`tbl_entries_data_13` (`id`, `entry_id`, `value`) VALUES (41, 19, 1);

-- *** STRUCTURE:`tbl_entries_data_14` ***
DROP TABLE IF EXISTS`tbl_entries_data_14`;
CREATE TABLE`tbl_entries_data_14` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_14` ***
INSERT INTO`tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (38, 1, NULL, NULL);
INSERT INTO`tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (37, 3, NULL, NULL);
INSERT INTO`tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (21, 2, NULL, NULL);
INSERT INTO`tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (8, 4, NULL, NULL);
INSERT INTO`tbl_entries_data_14` (`id`, `entry_id`, `handle`, `value`) VALUES (36, 19, 'czerwona', 'Czerwona');

-- *** STRUCTURE:`tbl_entries_data_15` ***
DROP TABLE IF EXISTS`tbl_entries_data_15`;
CREATE TABLE`tbl_entries_data_15` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `value_formatted` text COLLATE utf8_unicode_ci,
  `word_count` int(11) unsigned DEFAULT NULL,
  `handle-en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-en` text COLLATE utf8_unicode_ci,
  `value_formatted-en` text COLLATE utf8_unicode_ci,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `handle-pl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-pl` text COLLATE utf8_unicode_ci,
  `value_formatted-pl` text COLLATE utf8_unicode_ci,
  `word_count-pl` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle-en` (`handle-en`),
  KEY `handle-pl` (`handle-pl`),
  KEY `handle` (`handle`),
  FULLTEXT KEY `value-en` (`value-en`),
  FULLTEXT KEY `value_formatted-en` (`value_formatted-en`),
  FULLTEXT KEY `value-pl` (`value-pl`),
  FULLTEXT KEY `value_formatted-pl` (`value_formatted-pl`),
  FULLTEXT KEY `value` (`value`),
  FULLTEXT KEY `value_formatted` (`value_formatted`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_15` ***
INSERT INTO`tbl_entries_data_15` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (3, 7, 'facebook', 'Facebook', '<p>Facebook</p>\n', 1, 'facebook', 'Facebook', '<p>Facebook</p>\n', 1, 'facebook', 'Facebook', '<p>Facebook</p>\n', 1);
INSERT INTO`tbl_entries_data_15` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (2, 6, 'home-2', 'Home', '<p>Home</p>\n', 1, 'home', 'Home', '<p>Home</p>\n', 1, 'home-2', 'Home', '<p>Home</p>\n', 1);
INSERT INTO`tbl_entries_data_15` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (5, 17, 'wystawy', 'Wystawy', '<p>Wystawy</p>\n', 1, 'exhibitions', 'Exhibitions', '<p>Exhibitions</p>\n', 1, 'wystawy', 'Wystawy', '<p>Wystawy</p>\n', 1);

-- *** STRUCTURE:`tbl_entries_data_16` ***
DROP TABLE IF EXISTS`tbl_entries_data_16`;
CREATE TABLE`tbl_entries_data_16` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `value_formatted` text COLLATE utf8_unicode_ci,
  `word_count` int(11) unsigned DEFAULT NULL,
  `handle-en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-en` text COLLATE utf8_unicode_ci,
  `value_formatted-en` text COLLATE utf8_unicode_ci,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `handle-pl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-pl` text COLLATE utf8_unicode_ci,
  `value_formatted-pl` text COLLATE utf8_unicode_ci,
  `word_count-pl` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle-en` (`handle-en`),
  KEY `handle-pl` (`handle-pl`),
  KEY `handle` (`handle`),
  FULLTEXT KEY `value-en` (`value-en`),
  FULLTEXT KEY `value_formatted-en` (`value_formatted-en`),
  FULLTEXT KEY `value-pl` (`value-pl`),
  FULLTEXT KEY `value_formatted-pl` (`value_formatted-pl`),
  FULLTEXT KEY `value` (`value`),
  FULLTEXT KEY `value_formatted` (`value_formatted`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_16` ***
INSERT INTO`tbl_entries_data_16` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (3, 7, 'https-www-facebook-com-muzeumarchitektury', 'https://www.facebook.com/MuzeumArchitektury', 'https://www.facebook.com/MuzeumArchitektury', 1, NULL, NULL, NULL, 0, 'https-www-facebook-com-muzeumarchitektury', 'https://www.facebook.com/MuzeumArchitektury', 'https://www.facebook.com/MuzeumArchitektury', 1);
INSERT INTO`tbl_entries_data_16` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (2, 6, 'http-localhost-ma-wroc-pl-2', 'http://localhost/ma.wroc.pl', 'http://localhost/ma.wroc.pl', 1, NULL, NULL, NULL, 0, 'http-localhost-ma-wroc-pl-2', 'http://localhost/ma.wroc.pl', 'http://localhost/ma.wroc.pl', 1);
INSERT INTO`tbl_entries_data_16` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (5, 17, 'http-localhost-ma-wroc-pl-wystawy', 'http://localhost/ma.wroc.pl/wystawy/', 'http://localhost/ma.wroc.pl/wystawy/', 1, 'http-localhost-ma-wroc-pl-en-exhibitions', 'http://localhost/ma.wroc.pl/en/exhibitions/', 'http://localhost/ma.wroc.pl/en/exhibitions/', 1, 'http-localhost-ma-wroc-pl-wystawy', 'http://localhost/ma.wroc.pl/wystawy/', 'http://localhost/ma.wroc.pl/wystawy/', 1);

-- *** STRUCTURE:`tbl_entries_data_17` ***
DROP TABLE IF EXISTS`tbl_entries_data_17`;
CREATE TABLE`tbl_entries_data_17` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_17` ***
INSERT INTO`tbl_entries_data_17` (`id`, `entry_id`, `relation_id`) VALUES (12, 8, 7);
INSERT INTO`tbl_entries_data_17` (`id`, `entry_id`, `relation_id`) VALUES (11, 8, 17);
INSERT INTO`tbl_entries_data_17` (`id`, `entry_id`, `relation_id`) VALUES (10, 8, 6);

-- *** STRUCTURE:`tbl_entries_data_18` ***
DROP TABLE IF EXISTS`tbl_entries_data_18`;
CREATE TABLE`tbl_entries_data_18` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `value_formatted` text COLLATE utf8_unicode_ci,
  `word_count` int(11) unsigned DEFAULT NULL,
  `handle-en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-en` text COLLATE utf8_unicode_ci,
  `value_formatted-en` text COLLATE utf8_unicode_ci,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `handle-pl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-pl` text COLLATE utf8_unicode_ci,
  `value_formatted-pl` text COLLATE utf8_unicode_ci,
  `word_count-pl` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle-en` (`handle-en`),
  KEY `handle-pl` (`handle-pl`),
  KEY `handle` (`handle`),
  FULLTEXT KEY `value-en` (`value-en`),
  FULLTEXT KEY `value_formatted-en` (`value_formatted-en`),
  FULLTEXT KEY `value-pl` (`value-pl`),
  FULLTEXT KEY `value_formatted-pl` (`value_formatted-pl`),
  FULLTEXT KEY `value` (`value`),
  FULLTEXT KEY `value_formatted` (`value_formatted`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_18` ***
INSERT INTO`tbl_entries_data_18` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (4, 8, 'lorem-ipsum-dolor-sit-amet-lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit-sed-do-eiusmod-tempor-incididunt-ut-labore-et-dolore-magna-aliqua-ut-enim-ad-minim-veniam-quis-nostrud-exercitation-ullamco-laboris-nisi-ut-aliquip-ex-ea-commodo-consequat', '## Lorem ipsum dolor sit amet\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n\r\n## Sed ut perspiciatis unde omnis\r\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', '<h2>Lorem ipsum dolor sit amet</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n\n<h2>Sed ut perspiciatis unde omnis</h2>\n\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>\n', 208, 'lorem-ipsum-dolor-sit-amet-en-lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit-sed-do-eiusmod-tempor-incididunt-ut-labore-et-dolore-magna-aliqua-ut-enim-ad-minim-veniam-quis-nostrud-exercitation-ullamco-laboris-nisi-ut-aliquip-ex-ea-commodo-conseq', '## Lorem ipsum dolor sit amet EN\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n\r\n## Sed ut perspiciatis unde omnis\r\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', '<h2>Lorem ipsum dolor sit amet EN</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n\n<h2>Sed ut perspiciatis unde omnis</h2>\n\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>\n', 209, 'lorem-ipsum-dolor-sit-amet-lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit-sed-do-eiusmod-tempor-incididunt-ut-labore-et-dolore-magna-aliqua-ut-enim-ad-minim-veniam-quis-nostrud-exercitation-ullamco-laboris-nisi-ut-aliquip-ex-ea-commodo-consequat', '## Lorem ipsum dolor sit amet\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n\r\n## Sed ut perspiciatis unde omnis\r\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', '<h2>Lorem ipsum dolor sit amet</h2>\n\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n\n<h2>Sed ut perspiciatis unde omnis</h2>\n\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>\n', 208);

-- *** STRUCTURE:`tbl_entries_data_19` ***
DROP TABLE IF EXISTS`tbl_entries_data_19`;
CREATE TABLE`tbl_entries_data_19` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_19` ***
INSERT INTO`tbl_entries_data_19` (`id`, `entry_id`, `relation_id`) VALUES (7, 9, 4);
INSERT INTO`tbl_entries_data_19` (`id`, `entry_id`, `relation_id`) VALUES (2, 11, 1);

-- *** STRUCTURE:`tbl_entries_data_2` ***
DROP TABLE IF EXISTS`tbl_entries_data_2`;
CREATE TABLE`tbl_entries_data_2` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `value_formatted` text COLLATE utf8_unicode_ci,
  `word_count` int(11) unsigned DEFAULT NULL,
  `handle-en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-en` text COLLATE utf8_unicode_ci,
  `value_formatted-en` text COLLATE utf8_unicode_ci,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `handle-pl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-pl` text COLLATE utf8_unicode_ci,
  `value_formatted-pl` text COLLATE utf8_unicode_ci,
  `word_count-pl` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle-en` (`handle-en`),
  KEY `handle-pl` (`handle-pl`),
  KEY `handle` (`handle`),
  FULLTEXT KEY `value-en` (`value-en`),
  FULLTEXT KEY `value_formatted-en` (`value_formatted-en`),
  FULLTEXT KEY `value-pl` (`value-pl`),
  FULLTEXT KEY `value_formatted-pl` (`value_formatted-pl`),
  FULLTEXT KEY `value` (`value`),
  FULLTEXT KEY `value_formatted` (`value_formatted`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_2` ***
INSERT INTO`tbl_entries_data_2` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (33, 2, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0);
INSERT INTO`tbl_entries_data_2` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (49, 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0);
INSERT INTO`tbl_entries_data_2` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (50, 1, 'wystawa-w-ramach-think-tank-lab-triennale', 'Wystawa w ramach Think Tank Lab Triennale', 'Wystawa w ramach Think Tank Lab Triennale', 7, 'think-tank-lab-triennale-exhibition', 'Think Tank Lab Triennale exhibition', 'Think Tank Lab Triennale exhibition', 5, 'wystawa-w-ramach-think-tank-lab-triennale', 'Wystawa w ramach Think Tank Lab Triennale', 'Wystawa w ramach Think Tank Lab Triennale', 7);
INSERT INTO`tbl_entries_data_2` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (20, 4, 'to-jest-tylko-test', 'To jest tylko test', 'To jest tylko test', 4, 'this-is-just-a-test', 'This is just a test', 'This is just a test', 5, 'to-jest-tylko-test', 'To jest tylko test', 'To jest tylko test', 4);
INSERT INTO`tbl_entries_data_2` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (48, 19, '25-lat-nagrody-unii-europejskiej-w-dziedzinie-architektury-wspolczesnej-mies-van-der-rohe-award', '25 lat nagrody Unii Europejskiej w dziedzinie architektury współczesnej – Mies van der Rohe Award', '25 lat nagrody Unii Europejskiej w dziedzinie architektury współczesnej – Mies van der Rohe Award', 13, NULL, NULL, NULL, 0, '25-lat-nagrody-unii-europejskiej-w-dziedzinie-architektury-wspolczesnej-mies-van-der-rohe-award', '25 lat nagrody Unii Europejskiej w dziedzinie architektury współczesnej – Mies van der Rohe Award', '25 lat nagrody Unii Europejskiej w dziedzinie architektury współczesnej – Mies van der Rohe Award', 13);

-- *** STRUCTURE:`tbl_entries_data_20` ***
DROP TABLE IF EXISTS`tbl_entries_data_20`;
CREATE TABLE`tbl_entries_data_20` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_20` ***
INSERT INTO`tbl_entries_data_20` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (7, 9, 'hl-1-1452180900.png', 574299, 'image/png', 'a:3:{s:8:\"creation\";s:25:\"2016-01-07T16:34:59+01:00\";s:5:\"width\";i:1920;s:6:\"height\";i:1080;}');
INSERT INTO`tbl_entries_data_20` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (2, 11, 'hl-2-1452181301.png', 954583, 'image/png', 'a:3:{s:8:\"creation\";s:25:\"2016-01-07T16:41:40+01:00\";s:5:\"width\";i:1920;s:6:\"height\";i:1080;}');

-- *** STRUCTURE:`tbl_entries_data_21` ***
DROP TABLE IF EXISTS`tbl_entries_data_21`;
CREATE TABLE`tbl_entries_data_21` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `value_formatted` text COLLATE utf8_unicode_ci,
  `word_count` int(11) unsigned DEFAULT NULL,
  `handle-en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-en` text COLLATE utf8_unicode_ci,
  `value_formatted-en` text COLLATE utf8_unicode_ci,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `handle-pl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-pl` text COLLATE utf8_unicode_ci,
  `value_formatted-pl` text COLLATE utf8_unicode_ci,
  `word_count-pl` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle-en` (`handle-en`),
  KEY `handle-pl` (`handle-pl`),
  KEY `handle` (`handle`),
  FULLTEXT KEY `value-en` (`value-en`),
  FULLTEXT KEY `value_formatted-en` (`value_formatted-en`),
  FULLTEXT KEY `value-pl` (`value-pl`),
  FULLTEXT KEY `value_formatted-pl` (`value_formatted-pl`),
  FULLTEXT KEY `value` (`value`),
  FULLTEXT KEY `value_formatted` (`value_formatted`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_21` ***
INSERT INTO`tbl_entries_data_21` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (7, 9, 'tytul', 'Tytuł', '<p>Tytuł</p>\n', 1, 'title', 'Title', '<p>Title</p>\n', 1, 'tytul', 'Tytuł', '<p>Tytuł</p>\n', 1);
INSERT INTO`tbl_entries_data_21` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (2, 11, 'tytul-2', 'Tytuł 2', '<p>Tytuł 2</p>\n', 1, 'title-2', 'Title 2', '<p>Title 2</p>\n', 1, 'tytul-2', 'Tytuł 2', '<p>Tytuł 2</p>\n', 1);

-- *** STRUCTURE:`tbl_entries_data_22` ***
DROP TABLE IF EXISTS`tbl_entries_data_22`;
CREATE TABLE`tbl_entries_data_22` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `value_formatted` text COLLATE utf8_unicode_ci,
  `word_count` int(11) unsigned DEFAULT NULL,
  `handle-en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-en` text COLLATE utf8_unicode_ci,
  `value_formatted-en` text COLLATE utf8_unicode_ci,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `handle-pl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-pl` text COLLATE utf8_unicode_ci,
  `value_formatted-pl` text COLLATE utf8_unicode_ci,
  `word_count-pl` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle-en` (`handle-en`),
  KEY `handle-pl` (`handle-pl`),
  KEY `handle` (`handle`),
  FULLTEXT KEY `value-en` (`value-en`),
  FULLTEXT KEY `value_formatted-en` (`value_formatted-en`),
  FULLTEXT KEY `value-pl` (`value-pl`),
  FULLTEXT KEY `value_formatted-pl` (`value_formatted-pl`),
  FULLTEXT KEY `value` (`value`),
  FULLTEXT KEY `value_formatted` (`value_formatted`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_22` ***
INSERT INTO`tbl_entries_data_22` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (2, 11, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0);
INSERT INTO`tbl_entries_data_22` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (7, 9, 'lorem-ipsum-dolor-sit-amet-11-01-2015-20-02-2015', 'Lorem ipsum dolor sit amet\r\n\r\n11.01.2015--<br/>\r\n20.02.2015', '<p>Lorem ipsum dolor sit amet</p>\n\n<p>11.01.2015&#8212;<br/>\n20.02.2015</p>\n', 5, NULL, NULL, NULL, 0, 'lorem-ipsum-dolor-sit-amet-11-01-2015-20-02-2015', 'Lorem ipsum dolor sit amet\r\n\r\n11.01.2015--<br/>\r\n20.02.2015', '<p>Lorem ipsum dolor sit amet</p>\n\n<p>11.01.2015&#8212;<br/>\n20.02.2015</p>\n', 5);

-- *** STRUCTURE:`tbl_entries_data_23` ***
DROP TABLE IF EXISTS`tbl_entries_data_23`;
CREATE TABLE`tbl_entries_data_23` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_23` ***
INSERT INTO`tbl_entries_data_23` (`id`, `entry_id`, `relation_id`) VALUES (53, 13, 11);
INSERT INTO`tbl_entries_data_23` (`id`, `entry_id`, `relation_id`) VALUES (52, 13, 9);

-- *** STRUCTURE:`tbl_entries_data_24` ***
DROP TABLE IF EXISTS`tbl_entries_data_24`;
CREATE TABLE`tbl_entries_data_24` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_24` ***
INSERT INTO`tbl_entries_data_24` (`id`, `entry_id`, `value`) VALUES (21, 13, 'yes');

-- *** STRUCTURE:`tbl_entries_data_25` ***
DROP TABLE IF EXISTS`tbl_entries_data_25`;
CREATE TABLE`tbl_entries_data_25` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `value_formatted` text COLLATE utf8_unicode_ci,
  `word_count` int(11) unsigned DEFAULT NULL,
  `handle-en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-en` text COLLATE utf8_unicode_ci,
  `value_formatted-en` text COLLATE utf8_unicode_ci,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `handle-pl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-pl` text COLLATE utf8_unicode_ci,
  `value_formatted-pl` text COLLATE utf8_unicode_ci,
  `word_count-pl` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle-en` (`handle-en`),
  KEY `handle-pl` (`handle-pl`),
  KEY `handle` (`handle`),
  FULLTEXT KEY `value-en` (`value-en`),
  FULLTEXT KEY `value_formatted-en` (`value_formatted-en`),
  FULLTEXT KEY `value-pl` (`value-pl`),
  FULLTEXT KEY `value_formatted-pl` (`value_formatted-pl`),
  FULLTEXT KEY `value` (`value`),
  FULLTEXT KEY `value_formatted` (`value_formatted`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_25` ***
INSERT INTO`tbl_entries_data_25` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (36, 1, '03-12-2015-31-01-2016', '03.12.2015–31.01.2016', '<p>03.12.2015–31.01.2016</p>\n', 0, NULL, NULL, NULL, 0, '03-12-2015-31-01-2016', '03.12.2015–31.01.2016', '<p>03.12.2015–31.01.2016</p>\n', 0);
INSERT INTO`tbl_entries_data_25` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (19, 2, '17-11-2015-31-12-2015', '17.11.2015–31.12.2015', '<p>17.11.2015–31.12.2015</p>\n', 0, NULL, NULL, NULL, 0, '17-11-2015-31-12-2015', '17.11.2015–31.12.2015', '<p>17.11.2015–31.12.2015</p>\n', 0);
INSERT INTO`tbl_entries_data_25` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (35, 3, '02-03-2015-15-11-2015', '02.03.2015–15.11.2015', '<p>02.03.2015–15.11.2015</p>\n', 0, NULL, NULL, NULL, 0, '02-03-2015-15-11-2015', '02.03.2015–15.11.2015', '<p>02.03.2015–15.11.2015</p>\n', 0);
INSERT INTO`tbl_entries_data_25` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (6, 4, '03-01-2016', '03.01.2016', '<p>03.01.2016</p>\n', 0, NULL, NULL, NULL, 0, '03-01-2016', '03.01.2016', '<p>03.01.2016</p>\n', 0);
INSERT INTO`tbl_entries_data_25` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (34, 19, '16-01-2016-13-03-2016', '16.01.2016–13.03.2016', '<p>16.01.2016–13.03.2016</p>\n', 0, NULL, NULL, NULL, 0, '16-01-2016-13-03-2016', '16.01.2016–13.03.2016', '<p>16.01.2016–13.03.2016</p>\n', 0);

-- *** STRUCTURE:`tbl_entries_data_26` ***
DROP TABLE IF EXISTS`tbl_entries_data_26`;
CREATE TABLE`tbl_entries_data_26` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `value_formatted` text COLLATE utf8_unicode_ci,
  `word_count` int(11) unsigned DEFAULT NULL,
  `handle-en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-en` text COLLATE utf8_unicode_ci,
  `value_formatted-en` text COLLATE utf8_unicode_ci,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `handle-pl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-pl` text COLLATE utf8_unicode_ci,
  `value_formatted-pl` text COLLATE utf8_unicode_ci,
  `word_count-pl` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle-en` (`handle-en`),
  KEY `handle-pl` (`handle-pl`),
  KEY `handle` (`handle`),
  FULLTEXT KEY `value-en` (`value-en`),
  FULLTEXT KEY `value_formatted-en` (`value_formatted-en`),
  FULLTEXT KEY `value-pl` (`value-pl`),
  FULLTEXT KEY `value_formatted-pl` (`value_formatted-pl`),
  FULLTEXT KEY `value` (`value`),
  FULLTEXT KEY `value_formatted` (`value_formatted`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_26` ***
INSERT INTO`tbl_entries_data_26` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (1, 14, 'aktualnosci', 'Aktualności', 'Aktualności', 1, 'news', 'News', 'News', 1, 'aktualnosci', 'Aktualności', 'Aktualności', 1);
INSERT INTO`tbl_entries_data_26` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (2, 15, 'wystawy', 'Wystawy', 'Wystawy', 1, 'exhibitions', 'Exhibitions', 'Exhibitions', 1, 'wystawy', 'Wystawy', 'Wystawy', 1);
INSERT INTO`tbl_entries_data_26` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (3, 16, 'artykul', 'artykuł', 'artykuł', 1, 'article', 'article', 'article', 1, 'artykul', 'artykuł', 'artykuł', 1);

-- *** STRUCTURE:`tbl_entries_data_27` ***
DROP TABLE IF EXISTS`tbl_entries_data_27`;
CREATE TABLE`tbl_entries_data_27` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_27` ***
INSERT INTO`tbl_entries_data_27` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (3, 2, '3-main.png', 32709, 'image/png', 'a:3:{s:8:\"creation\";s:25:\"2016-01-08T22:05:25+01:00\";s:5:\"width\";i:963;s:6:\"height\";i:579;}');

-- *** STRUCTURE:`tbl_entries_data_28` ***
DROP TABLE IF EXISTS`tbl_entries_data_28`;
CREATE TABLE`tbl_entries_data_28` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_28` ***

-- *** STRUCTURE:`tbl_entries_data_3` ***
DROP TABLE IF EXISTS`tbl_entries_data_3`;
CREATE TABLE`tbl_entries_data_3` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `value_formatted` text COLLATE utf8_unicode_ci,
  `word_count` int(11) unsigned DEFAULT NULL,
  `handle-en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-en` text COLLATE utf8_unicode_ci,
  `value_formatted-en` text COLLATE utf8_unicode_ci,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `handle-pl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-pl` text COLLATE utf8_unicode_ci,
  `value_formatted-pl` text COLLATE utf8_unicode_ci,
  `word_count-pl` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle-en` (`handle-en`),
  KEY `handle-pl` (`handle-pl`),
  KEY `handle` (`handle`),
  FULLTEXT KEY `value-en` (`value-en`),
  FULLTEXT KEY `value_formatted-en` (`value_formatted-en`),
  FULLTEXT KEY `value-pl` (`value-pl`),
  FULLTEXT KEY `value_formatted-pl` (`value_formatted-pl`),
  FULLTEXT KEY `value` (`value`),
  FULLTEXT KEY `value_formatted` (`value_formatted`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_3` ***
INSERT INTO`tbl_entries_data_3` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (50, 1, 'idea-prezentacji-jest-ukazanie-rysunku-jako-najbardziej-naturalnego-gestu-i-jezyka-ekspresji-tworczej-ktory-zarowno-odtwarza-jak-i-tworzy-rzeczywistosc-na-wystawie-zostana-pokazane-prace-9-artystow-z-japonii-i-9-z-polski-wiekszosc-realizacji-powstanie-s', 'Ideą prezentacji jest ukazanie rysunku jako najbardziej naturalnego gestu i języka ekspresji twórczej, który zarówno odtwarza, jak i tworzy rzeczywistość. Na wystawie zostaną pokazane prace 9 artystów z Japonii i 9 z Polski. Większość realizacji powstanie specjalnie na tę okazję.\r\n\r\n Tytuł Two Sticks (Dwa kije) odnosi się do poszukiwania symetrii i różnic w rozumieniu pojęcia rysunku przez dwie tak odmienne tradycje, a także zwraca uwagęwidza na rolę awangardy lat sześćdziesiątych – wciąż mocno oddziałującą na myślenie współczesnych twórców o rysunku. Mury dawnego kościoła i klasztoru Bernardynów, w których mieści się dzisiaj Muzeum Architektury, gościły najświetniejsze kolejne edycje Międzynarodowego Triennale Rysunku. W tym roku, podczas wystawy „Two Sticks” będą stanowiły miejsce spotkania Zachodu ze Wschodem.\r\n\r\n Rozłożenie wokół ogrodu i krużganków różnorodnych formalnie prac – w dużej mierze instalacji rysunkowych – tworzy rodzaj narracji prowadzącej widza przez wielowarstwowość znaczeń. Realizacje powstałe na „Two Sticks” staną się kolejną warstwą palimpsestu historii miejsca wykorzystując jego genius loci i kontynuując proces nieustannego wymazywania i dopisywania, nieobcy zarówno kulturze, jak i naturze. Wystawie towarzyszyć będzie projekcja dwóch filmów– dokumentu o grupie Gutai oraz archiwaliów dotyczących działalności Wrocławskiej Awangardy. Jednym z najważniejszych artystów Triennale jest biorący udział w wystawie „Two Sticks” Sadaharu Horio, przedstawiciel grupy Gutai, który stworzy w Prezbiterium dużych rozmiarów instalację rysunkową.\r\n\r\nProgram zawiera również przegląd animacji rysunkowych, pochodzących z kolekcji hiszpańskiego Festiwalu Punto y Raya. Przez cztery dni możemy oglądaćfilmy wybrane przez kuratora przeglądu Maćka Bączyka.\r\n\r\nArtyści: Ryoko Aoki / Masaya Chiba / Jan Chwałczyk / Wanda Gołkowska / Masanori Handa / Sadaharu Horio / Zon Ito / Zdzisław Jurkiewicz / Bartosz Kokosiński / Natalia LL / Jan Mioduszewski / Chihiro Mori / Mineki Murata / Kazuki Nakahara / Magdalena Starska / Hiraku Suzuki / Aleksandra Waliszewska / Jakub Woynarowski\r\n\r\nKuratorzy: Fumihhiko Sumitomo, Daniela Tagowska\r\n\r\nAsystentka kuratora: Ayako Osanai\r\n\r\nwww.ttt.wroclaw.pl\r\n\r\nThink Tank lab Triennale\r\n\r\nMiędzynarodowy Festiwal Rysunku Współczesnego\r\n\r\n03.12.2015-31.01.2016\r\n\r\nWrocław\r\n\r\n Już 3 grudnia wystartuje we Wrocławiu Think Tank lab Triennale. Międzynarodowy Festiwal Współczesnego Rysunku. W obecnej edycji, reaktywującej ideęmiędzynarodowego forum, jakim było przez wiele lat Międzynarodowe Triennale Rysunku, kuratorzy zaprezentują program ukazujący rozległość praktyk rysunkowych, rozliczne rozgałęzienia ewolucyjnej linii rysunku współczesnego.\r\n\r\nPROGRAM:\r\n\r\nttt.wroclaw.pl/wystawy\r\n\r\nhttps://www.youtube.com/watch?v=LH0F4DIG7vs&feature=youtu.be\r\n\r\nOrganizator: Akademia Sztuk Pięknych im. E. Gepperta we Wrocławiu\r\n\r\n Współorganizatorzy: Europejska Stolica Kultury Wrocław 2016, Muzeum Narodowe we Wrocławiu, Muzeum Architektury, Zakład Narodowy im. Ossolińskich, BARBARA: infopunkt / kawiarnia / kultura.\r\n\r\nProjekt współfinansowany przez: EU Japan, Japan Foundation\r\n\r\nSponsor Główny: EMPIK\r\n\r\nSponsorzy: Elektrotim, Formo, ATM, Spaceone, Ecophen, Glasssolutions\r\n\r\nHonorowy Patronat: MKiDN, Patronat Honorowy Prezydenta Wrocławia, Ambasada Japonii w Polsce\r\n\r\nPartnerzy: Muzeum Współczesne Wrocław, Galeria Entropia, Mieszkanie Gepperta, Galeria Arttrakt, Galeria MD_S, BOSA galeria sztuki współczesnej, Szewska Pasja, SKiBA, ARTsight, PUNTO Y RAYA FESTIVAL, MPK Wrocław\r\n\r\nPatroni medialni: TVP Wrocław, TVP Kultura, Radio Wrocław, Radio Wrocław Kultura, Radio LUZ, Obieg, Contemporary Lynx, Format, O.pl Polski Portal Kultury, Fragile, DOKiS.PL, AMS, Architektura & Biznes', '<p>Ideą prezentacji jest ukazanie rysunku jako najbardziej naturalnego gestu i języka ekspresji twórczej, który zarówno odtwarza, jak i tworzy rzeczywistość. Na wystawie zostaną pokazane prace 9 artystów z Japonii i 9 z Polski. Większość realizacji powstanie specjalnie na tę okazję.</p>\n\n<p>Tytuł Two Sticks (Dwa kije) odnosi się do poszukiwania symetrii i różnic w rozumieniu pojęcia rysunku przez dwie tak odmienne tradycje, a także zwraca uwagęwidza na rolę awangardy lat sześćdziesiątych – wciąż mocno oddziałującą na myślenie współczesnych twórców o rysunku. Mury dawnego kościoła i klasztoru Bernardynów, w których mieści się dzisiaj Muzeum Architektury, gościły najświetniejsze kolejne edycje Międzynarodowego Triennale Rysunku. W tym roku, podczas wystawy „Two Sticks” będą stanowiły miejsce spotkania Zachodu ze Wschodem.</p>\n\n<p>Rozłożenie wokół ogrodu i krużganków różnorodnych formalnie prac – w dużej mierze instalacji rysunkowych – tworzy rodzaj narracji prowadzącej widza przez wielowarstwowość znaczeń. Realizacje powstałe na „Two Sticks” staną się kolejną warstwą palimpsestu historii miejsca wykorzystując jego genius loci i kontynuując proces nieustannego wymazywania i dopisywania, nieobcy zarówno kulturze, jak i naturze. Wystawie towarzyszyć będzie projekcja dwóch filmów– dokumentu o grupie Gutai oraz archiwaliów dotyczących działalności Wrocławskiej Awangardy. Jednym z najważniejszych artystów Triennale jest biorący udział w wystawie „Two Sticks” Sadaharu Horio, przedstawiciel grupy Gutai, który stworzy w Prezbiterium dużych rozmiarów instalację rysunkową.</p>\n\n<p>Program zawiera również przegląd animacji rysunkowych, pochodzących z kolekcji hiszpańskiego Festiwalu Punto y Raya. Przez cztery dni możemy oglądaćfilmy wybrane przez kuratora przeglądu Maćka Bączyka.</p>\n\n<p>Artyści: Ryoko Aoki / Masaya Chiba / Jan Chwałczyk / Wanda Gołkowska / Masanori Handa / Sadaharu Horio / Zon Ito / Zdzisław Jurkiewicz / Bartosz Kokosiński / Natalia LL / Jan Mioduszewski / Chihiro Mori / Mineki Murata / Kazuki Nakahara / Magdalena Starska / Hiraku Suzuki / Aleksandra Waliszewska / Jakub Woynarowski</p>\n\n<p>Kuratorzy: Fumihhiko Sumitomo, Daniela Tagowska</p>\n\n<p>Asystentka kuratora: Ayako Osanai</p>\n\n<p>www.ttt.wroclaw.pl</p>\n\n<p>Think Tank lab Triennale</p>\n\n<p>Międzynarodowy Festiwal Rysunku Współczesnego</p>\n\n<p>03.12.2015-31.01.2016</p>\n\n<p>Wrocław</p>\n\n<p>Już 3 grudnia wystartuje we Wrocławiu Think Tank lab Triennale. Międzynarodowy Festiwal Współczesnego Rysunku. W obecnej edycji, reaktywującej ideęmiędzynarodowego forum, jakim było przez wiele lat Międzynarodowe Triennale Rysunku, kuratorzy zaprezentują program ukazujący rozległość praktyk rysunkowych, rozliczne rozgałęzienia ewolucyjnej linii rysunku współczesnego.</p>\n\n<p>PROGRAM:</p>\n\n<p>ttt.wroclaw.pl/wystawy</p>\n\n<p>https://www.youtube.com/watch?v=LH0F4DIG7vs&amp;feature=youtu.be</p>\n\n<p>Organizator: Akademia Sztuk Pięknych im. E. Gepperta we Wrocławiu</p>\n\n<p>Współorganizatorzy: Europejska Stolica Kultury Wrocław 2016, Muzeum Narodowe we Wrocławiu, Muzeum Architektury, Zakład Narodowy im. Ossolińskich, BARBARA: infopunkt / kawiarnia / kultura.</p>\n\n<p>Projekt współfinansowany przez: EU Japan, Japan Foundation</p>\n\n<p>Sponsor Główny: EMPIK</p>\n\n<p>Sponsorzy: Elektrotim, Formo, ATM, Spaceone, Ecophen, Glasssolutions</p>\n\n<p>Honorowy Patronat: MKiDN, Patronat Honorowy Prezydenta Wrocławia, Ambasada Japonii w Polsce</p>\n\n<p>Partnerzy: Muzeum Współczesne Wrocław, Galeria Entropia, Mieszkanie Gepperta, Galeria Arttrakt, Galeria MD_S, BOSA galeria sztuki współczesnej, Szewska Pasja, SKiBA, ARTsight, PUNTO Y RAYA FESTIVAL, MPK Wrocław</p>\n\n<p>Patroni medialni: TVP Wrocław, TVP Kultura, Radio Wrocław, Radio Wrocław Kultura, Radio LUZ, Obieg, Contemporary Lynx, Format, O.pl Polski Portal Kultury, Fragile, DOKiS.PL, AMS, Architektura &amp; Biznes</p>\n', 438, NULL, NULL, NULL, 0, 'idea-prezentacji-jest-ukazanie-rysunku-jako-najbardziej-naturalnego-gestu-i-jezyka-ekspresji-tworczej-ktory-zarowno-odtwarza-jak-i-tworzy-rzeczywistosc-na-wystawie-zostana-pokazane-prace-9-artystow-z-japonii-i-9-z-polski-wiekszosc-realizacji-powstanie-s', 'Ideą prezentacji jest ukazanie rysunku jako najbardziej naturalnego gestu i języka ekspresji twórczej, który zarówno odtwarza, jak i tworzy rzeczywistość. Na wystawie zostaną pokazane prace 9 artystów z Japonii i 9 z Polski. Większość realizacji powstanie specjalnie na tę okazję.\r\n\r\n Tytuł Two Sticks (Dwa kije) odnosi się do poszukiwania symetrii i różnic w rozumieniu pojęcia rysunku przez dwie tak odmienne tradycje, a także zwraca uwagęwidza na rolę awangardy lat sześćdziesiątych – wciąż mocno oddziałującą na myślenie współczesnych twórców o rysunku. Mury dawnego kościoła i klasztoru Bernardynów, w których mieści się dzisiaj Muzeum Architektury, gościły najświetniejsze kolejne edycje Międzynarodowego Triennale Rysunku. W tym roku, podczas wystawy „Two Sticks” będą stanowiły miejsce spotkania Zachodu ze Wschodem.\r\n\r\n Rozłożenie wokół ogrodu i krużganków różnorodnych formalnie prac – w dużej mierze instalacji rysunkowych – tworzy rodzaj narracji prowadzącej widza przez wielowarstwowość znaczeń. Realizacje powstałe na „Two Sticks” staną się kolejną warstwą palimpsestu historii miejsca wykorzystując jego genius loci i kontynuując proces nieustannego wymazywania i dopisywania, nieobcy zarówno kulturze, jak i naturze. Wystawie towarzyszyć będzie projekcja dwóch filmów– dokumentu o grupie Gutai oraz archiwaliów dotyczących działalności Wrocławskiej Awangardy. Jednym z najważniejszych artystów Triennale jest biorący udział w wystawie „Two Sticks” Sadaharu Horio, przedstawiciel grupy Gutai, który stworzy w Prezbiterium dużych rozmiarów instalację rysunkową.\r\n\r\nProgram zawiera również przegląd animacji rysunkowych, pochodzących z kolekcji hiszpańskiego Festiwalu Punto y Raya. Przez cztery dni możemy oglądaćfilmy wybrane przez kuratora przeglądu Maćka Bączyka.\r\n\r\nArtyści: Ryoko Aoki / Masaya Chiba / Jan Chwałczyk / Wanda Gołkowska / Masanori Handa / Sadaharu Horio / Zon Ito / Zdzisław Jurkiewicz / Bartosz Kokosiński / Natalia LL / Jan Mioduszewski / Chihiro Mori / Mineki Murata / Kazuki Nakahara / Magdalena Starska / Hiraku Suzuki / Aleksandra Waliszewska / Jakub Woynarowski\r\n\r\nKuratorzy: Fumihhiko Sumitomo, Daniela Tagowska\r\n\r\nAsystentka kuratora: Ayako Osanai\r\n\r\nwww.ttt.wroclaw.pl\r\n\r\nThink Tank lab Triennale\r\n\r\nMiędzynarodowy Festiwal Rysunku Współczesnego\r\n\r\n03.12.2015-31.01.2016\r\n\r\nWrocław\r\n\r\n Już 3 grudnia wystartuje we Wrocławiu Think Tank lab Triennale. Międzynarodowy Festiwal Współczesnego Rysunku. W obecnej edycji, reaktywującej ideęmiędzynarodowego forum, jakim było przez wiele lat Międzynarodowe Triennale Rysunku, kuratorzy zaprezentują program ukazujący rozległość praktyk rysunkowych, rozliczne rozgałęzienia ewolucyjnej linii rysunku współczesnego.\r\n\r\nPROGRAM:\r\n\r\nttt.wroclaw.pl/wystawy\r\n\r\nhttps://www.youtube.com/watch?v=LH0F4DIG7vs&feature=youtu.be\r\n\r\nOrganizator: Akademia Sztuk Pięknych im. E. Gepperta we Wrocławiu\r\n\r\n Współorganizatorzy: Europejska Stolica Kultury Wrocław 2016, Muzeum Narodowe we Wrocławiu, Muzeum Architektury, Zakład Narodowy im. Ossolińskich, BARBARA: infopunkt / kawiarnia / kultura.\r\n\r\nProjekt współfinansowany przez: EU Japan, Japan Foundation\r\n\r\nSponsor Główny: EMPIK\r\n\r\nSponsorzy: Elektrotim, Formo, ATM, Spaceone, Ecophen, Glasssolutions\r\n\r\nHonorowy Patronat: MKiDN, Patronat Honorowy Prezydenta Wrocławia, Ambasada Japonii w Polsce\r\n\r\nPartnerzy: Muzeum Współczesne Wrocław, Galeria Entropia, Mieszkanie Gepperta, Galeria Arttrakt, Galeria MD_S, BOSA galeria sztuki współczesnej, Szewska Pasja, SKiBA, ARTsight, PUNTO Y RAYA FESTIVAL, MPK Wrocław\r\n\r\nPatroni medialni: TVP Wrocław, TVP Kultura, Radio Wrocław, Radio Wrocław Kultura, Radio LUZ, Obieg, Contemporary Lynx, Format, O.pl Polski Portal Kultury, Fragile, DOKiS.PL, AMS, Architektura & Biznes', '<p>Ideą prezentacji jest ukazanie rysunku jako najbardziej naturalnego gestu i języka ekspresji twórczej, który zarówno odtwarza, jak i tworzy rzeczywistość. Na wystawie zostaną pokazane prace 9 artystów z Japonii i 9 z Polski. Większość realizacji powstanie specjalnie na tę okazję.</p>\n\n<p>Tytuł Two Sticks (Dwa kije) odnosi się do poszukiwania symetrii i różnic w rozumieniu pojęcia rysunku przez dwie tak odmienne tradycje, a także zwraca uwagęwidza na rolę awangardy lat sześćdziesiątych – wciąż mocno oddziałującą na myślenie współczesnych twórców o rysunku. Mury dawnego kościoła i klasztoru Bernardynów, w których mieści się dzisiaj Muzeum Architektury, gościły najświetniejsze kolejne edycje Międzynarodowego Triennale Rysunku. W tym roku, podczas wystawy „Two Sticks” będą stanowiły miejsce spotkania Zachodu ze Wschodem.</p>\n\n<p>Rozłożenie wokół ogrodu i krużganków różnorodnych formalnie prac – w dużej mierze instalacji rysunkowych – tworzy rodzaj narracji prowadzącej widza przez wielowarstwowość znaczeń. Realizacje powstałe na „Two Sticks” staną się kolejną warstwą palimpsestu historii miejsca wykorzystując jego genius loci i kontynuując proces nieustannego wymazywania i dopisywania, nieobcy zarówno kulturze, jak i naturze. Wystawie towarzyszyć będzie projekcja dwóch filmów– dokumentu o grupie Gutai oraz archiwaliów dotyczących działalności Wrocławskiej Awangardy. Jednym z najważniejszych artystów Triennale jest biorący udział w wystawie „Two Sticks” Sadaharu Horio, przedstawiciel grupy Gutai, który stworzy w Prezbiterium dużych rozmiarów instalację rysunkową.</p>\n\n<p>Program zawiera również przegląd animacji rysunkowych, pochodzących z kolekcji hiszpańskiego Festiwalu Punto y Raya. Przez cztery dni możemy oglądaćfilmy wybrane przez kuratora przeglądu Maćka Bączyka.</p>\n\n<p>Artyści: Ryoko Aoki / Masaya Chiba / Jan Chwałczyk / Wanda Gołkowska / Masanori Handa / Sadaharu Horio / Zon Ito / Zdzisław Jurkiewicz / Bartosz Kokosiński / Natalia LL / Jan Mioduszewski / Chihiro Mori / Mineki Murata / Kazuki Nakahara / Magdalena Starska / Hiraku Suzuki / Aleksandra Waliszewska / Jakub Woynarowski</p>\n\n<p>Kuratorzy: Fumihhiko Sumitomo, Daniela Tagowska</p>\n\n<p>Asystentka kuratora: Ayako Osanai</p>\n\n<p>www.ttt.wroclaw.pl</p>\n\n<p>Think Tank lab Triennale</p>\n\n<p>Międzynarodowy Festiwal Rysunku Współczesnego</p>\n\n<p>03.12.2015-31.01.2016</p>\n\n<p>Wrocław</p>\n\n<p>Już 3 grudnia wystartuje we Wrocławiu Think Tank lab Triennale. Międzynarodowy Festiwal Współczesnego Rysunku. W obecnej edycji, reaktywującej ideęmiędzynarodowego forum, jakim było przez wiele lat Międzynarodowe Triennale Rysunku, kuratorzy zaprezentują program ukazujący rozległość praktyk rysunkowych, rozliczne rozgałęzienia ewolucyjnej linii rysunku współczesnego.</p>\n\n<p>PROGRAM:</p>\n\n<p>ttt.wroclaw.pl/wystawy</p>\n\n<p>https://www.youtube.com/watch?v=LH0F4DIG7vs&amp;feature=youtu.be</p>\n\n<p>Organizator: Akademia Sztuk Pięknych im. E. Gepperta we Wrocławiu</p>\n\n<p>Współorganizatorzy: Europejska Stolica Kultury Wrocław 2016, Muzeum Narodowe we Wrocławiu, Muzeum Architektury, Zakład Narodowy im. Ossolińskich, BARBARA: infopunkt / kawiarnia / kultura.</p>\n\n<p>Projekt współfinansowany przez: EU Japan, Japan Foundation</p>\n\n<p>Sponsor Główny: EMPIK</p>\n\n<p>Sponsorzy: Elektrotim, Formo, ATM, Spaceone, Ecophen, Glasssolutions</p>\n\n<p>Honorowy Patronat: MKiDN, Patronat Honorowy Prezydenta Wrocławia, Ambasada Japonii w Polsce</p>\n\n<p>Partnerzy: Muzeum Współczesne Wrocław, Galeria Entropia, Mieszkanie Gepperta, Galeria Arttrakt, Galeria MD_S, BOSA galeria sztuki współczesnej, Szewska Pasja, SKiBA, ARTsight, PUNTO Y RAYA FESTIVAL, MPK Wrocław</p>\n\n<p>Patroni medialni: TVP Wrocław, TVP Kultura, Radio Wrocław, Radio Wrocław Kultura, Radio LUZ, Obieg, Contemporary Lynx, Format, O.pl Polski Portal Kultury, Fragile, DOKiS.PL, AMS, Architektura &amp; Biznes</p>\n', 438);
INSERT INTO`tbl_entries_data_3` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (33, 2, 'muzeum-architektury-we-wroclawiu-jest-jedyna-instytucja-muzealna-w-polsce-poswiecona-w-calosci-historii-architektury-oraz-architekturze-wspolczesnej-powstalo-w-1965-roku-poczatkowo-jako-oddzial-muzeum-miasta-wroclawia-i-dzialalo-wowczas-pod-nazwa-muzeum', 'Muzeum Architektury we Wrocławiu jest jedyną instytucją muzealną w Polsce poświęconą w całości historii architektury oraz architekturze współczesnej. Powstało w 1965 roku, początkowo jako oddział Muzeum Miasta Wrocławia, i działało wówczas pod nazwą Muzeum Architektury i Odbudowy. W 1971 roku usamodzielniło się i zostało przemianowane na Muzeum Architektury we Wrocławiu. Jako jedna z pierwszych instytucji tego typu na świecie zostało członkiem założycielem Międzynarodowej Konfederacji Muzeów Architektury (ICAM), która dzisiaj skupia już ponad sto instytucji działających na niemal wszystkich kontynentach, i w której pracach Muzeum Architektury we Wrocławiu nadal bierze aktywny udział.\r\n\r\nMuzeum mieści się w zabytkowym zespole dawnego klasztoru Bernardynów, wzniesionym w drugiej połowie XV i na początku XVI wieku. Do 1522 roku budynek zajmowali zakonnicy, a po ich wypędzeniu z miasta władze Wrocławia urządziły w nim miejski szpital. Kompleks klasztorny uległ poważnym zniszczeniom podczas II wojny światowej i przez blisko dwie dekady pozostawał w częściowej ruinie. Z początkiem lat 60. XX wieku przystąpiono do jego odbudowy, która trwała do roku 1974, kiedy to muzeum pozyskało na swoje potrzeby trójnawową bazylikę dawnego kościoła. Autorem projektu odbudowy klasztoru i kościoła oraz ich adaptacji do potrzeb muzealnych był architekt Edmund Małachowicz.\r\n\r\n![](http://localhost/ma.wroc.pl/workspace/images/posts/3-main.png)\r\n\r\nZałożycielem muzeum był główny konserwator zabytków Wrocławia i późniejszy profesor Politechniki Wrocławskiej, Olgierd Czerner, który kierował placówką od jej założenia do 2000 roku. Początkowo celem muzeum było przede wszystkim pozyskiwanie i inwentaryzowanie ocalałych resztek detali architektonicznych, pochodzących z budynków zrujnowanych podczas wojny. Najcenniejsze z nich zostały zgromadzone na stałej, powiększanej z biegiem czasu ekspozycji. W późniejszym okresie muzeum rozszerzyło swoją działalność na teren całej Polski, służąc przede wszystkim polskim architektom.\r\n\r\nZnajdujący się na trawniku przed wejściem głównym do Muzeum Architektury model pomnika Rozstrzelanych Zakładników z Nowego Sącza został wykonany w latach 1966-1968 przez Władysława Hasiora. Do realizacji pomnika nigdy nie doszło, a rzeźba została zakupiona w 1971 roku przez Muzeum Architektury we Wrocławiu i ustawiona w miejscu, w którym stoi do dziś. W latach 70-tych, w dniu Wszystkich Świętych, pracownicy muzeum zapalali płomienie na pomniku za pomocą specjalnie przygotowanego do tego paliwa. Później jednak tradycja zanikła, ostatni raz odpalenie płomieni miało miejsce w Noc Muzeów w roku 2014.\r\n\r\nCharakterystyczne logo Muzeum Architektury, pierwszy logotyp instytucji kultury we Wrocławiu, zaprojektował w 1966 roku artysta grafik Tadeusz Ciałowicz. \r\n\r\nPodstawowa działalność muzealna, jaką jest gromadzenie eksponatów, ich opracowywanie i udostępnianie, prowadzona jest za pośrednictwem kilku działów. Kolekcja Działu Architektury Średniowiecznej obejmuje bogaty zbiór kamieniarki architektonicznej, w tym niektóre z najstarszych zabytków rzeźbiarskich we Wrocławiu i w całej Polsce, jak słynny Tympanon Jaksy pochodzacy z opactwa benedyktynów na wrocławskim Ołbinie. W Dziale Architektury Nowożytnej znajdują się pochodzące głównie z Wrocławia i terenu Śląska zabytki renesansowe, manierystyczne i barokowe oraz klasycystyczne, w tym zbiory grafiki, kamieniarki, witraży, elementów stropów drewnianych, ceramiki architektonicznej, okucia czy kraty. Działy Architektury XIX i XX wieku oraz Dział Architektury Współczesnej opiekują się spuścizną ponad osiemdziesięciu czołowych polskich architektów, takich jak na przykład: Romuald Gutt, Jerzy Hryniewiecki, Wacław Krzyżanowski, Jan Koszczyc-Witkiewicz, Bohdan Lachert i Józef Szanajca, Tadeusz Michejda, Stefan Narębski, Maciej Nowicki, uważany za największego polskiego architekta XX wieku, Bohdan Pniewski, Helena i Szymon Syrkusowie, Jerzy Sołtan (uczeń Le Corbusiera), Bolesław Szmidt, Adolf Szyszko-Bohusz czy Kazimierz Wejchert. W zbiorach tych działów znajdują się ponadto prace wielu słynnych architektów światowych, jak choćby Le Corbusier, Alvar Aalto, Kisho Kurokawa czy Richard England, a także jedna z największych w Polsce kolekcji witraży i ciekawy zbiór rzemiosła artystycznego. Kolekcja jest regularnie wykorzystywana przez badaczy z kraju i z zagranicy. Stanowi także podstawę wielu wystaw i publikacji przygotowywanych przez muzeum.\r\n\r\n Podobnie jak w innych placówkach muzealnych tego typu, wychodząc z założenia, że architektura jest ściśle związana z innymi dziedzinami sztuki, w Dziale Sztuki Współczesnej wrocławskiego muzeum zgromadzono obszerną kolekcję projektów sztuki użytkowej oraz malarstwa i grafiki. Reprezentuje ona przede wszystkim nurt abstrakcji geometrycznej, obejmując między innymi dzieła jego czołowych przedstawicieli, na przykład Henryka Stażewskiego czy Marii Jaremy.\r\n\r\nOd czasu swego powstania muzeum zaprezentowało ponad 600 wystaw czasowych, które były pokazywane zarówno w jego siedzibie, jak i w innych miejscach w Polsce i za granicą, między innymi w Berlinie Zachodnim, Dreźnie, Moskwie, Hanowerze, Lyonie, Coventry i Londynie. W 1981 roku wystawa Awangarda polska 1918–1939 została zaprezentowana w Centre Georges Pompidou w Paryżu. Szeregowi wystaw poświęconych architektom, których prace znajdują się w zbiorach muzeum, towarzyszyły katalogi, często stanowiące pierwsze publikowane monografie tych twórców.\r\n\r\nW 2000 roku, po przejściu na emeryturę profesora Olgierda Czernera, stanowisko dyrektora objął Jerzy Ilkosz. Z racji swoich zainteresowań skupił się on, obok prezentacji polskiej architektury współczesnej, na badaniu i prezentowaniu architektury wrocławskiego modernizmu. Transformacja polityczna stworzyła sprzyjający klimat dla pracy naukowej związanej z tematem dziedzictwa architektury niemieckiej we Wrocławiu, wcześniej objętego zapisem cenzury.\r\n\r\nMuzeum przejęło w tym czasie olbrzymie zbiory dawnego Archiwum Budowlanego Miasta Wrocławia, pozyskując ponad 150 000 projektów budowli wrocławskich, powstających od początku XIX wieku do 1945 roku. Utworzono wtedy osobny oddział dla tych zbiorów oraz dodatkowo Dział Architektury Wrocławia XIX i XX wieku.  Pozyskane dzieła pokazywano szerokiej publiczności na wielu wystawach, prezentując po raz pierwszy prace tak znakomitych architektów, jak Hans Poelzig, Erich Mendelsohn, Max Berg, Ernst May, Hans Scharoun, Adolf Rading, Paul Schmitthenner, Heinrich Lauterbach i wielu innych. Dzieła z tej kolekcji znalazły się również na wielkich wystawach przygotowywanych przez ówczesnego dyrektora Deutsches Architekturmuseum we Frankfurcie nad Menem – Vittorio Magnago Lampugnaniego, a także na wystawach w Paryżu i Barcelonie. Nasza wystawa, poświęcona projektom wieżowców dla Wrocławia, była pokazywana w Brunszwiku oraz Monachium, a monograficzna wystawa Hansa Poelziga – w Düsseldorfie, Dreźnie i Görlitz. W 2005 roku, w związku z przygotowaniem aplikacji o wpis na listę światowego dziedzictwa UNESCO wybitnego wrocławskiego dzieła – Hali Stulecia, Muzeum Architektury przygotowało monograficzną wystawę poświęconą temu niezwykłemu pomnikowi architektury, której towarzyszył katalog opracowany również w języku angielskim i niemieckim. Obszerne katalogi towarzyszyły też większości pozostałych ekspozycji, zorganizowanych w ostatnim piętnastoleciu.\r\n\r\nObecna sytuacja Muzeum Architektury jest w dużym stopniu zdeterminowana przez historię i tradycję instytucji, a podejmowane działania muszą się rozgrywać na kilku poziomach. Z jednej strony jesteśmy odpowiedzialni za ochronę i udostępnianie publiczności naszej siedziby – gotyckiego klasztoru, który sam w sobie stanowi historyczną wartość. Zdecydowaliśmy się także zachować wystawę zabytkowych rzeźb i detali kamiennych, która powstała w latach sześćdziesiątych XX wieku. Poza prezentacją ważnych zabytków średniowiecznej sztuki i kultury, stanowi ona także świadectwo roli, jaką interpretacja średniowiecznej historii odegrała w konstruowaniu tożsamości miasta, w którym po drugiej wojnie światowej dokonała się całkowita wymiana ludności.\r\n\r\nInnym aspektem naszej misji jest uzupełnianie i poszerzanie kolekcji, co czasem dokonuje się przez zakup prac, ale częściej dzięki współpracy z pracowniami architektonicznymi lub przejmowanie spuścizny ważnych architektów starszej generacji.\r\n\r\nSpecyficzny charakter zbiorów Archiwum Budowlanego, które stanowi ważną kolekcję historyczną, a jednocześnie nadal jest intensywnie wykorzystywane w celach praktycznych, stał się powodem podjęcia decyzji o zdigitalizowaniu zgromadzonych w nim materiałów. W roku 2010, dzięki wykorzystaniu funduszy Unii Europejskiej, zakupiono nowoczesny, wielkoformatowy skaner CRUSE oraz opracowano specjalistyczną bazę danych, umożliwiającą gromadzenie zdigitalizowanych materiałów i prezentowanie ich w Internecie. Dotychczas udostępniono ponad 41 000 archiwalnych planów.\r\n\r\nKontynuujemy także tradycję regularnego organizowania wystaw czasowych, poświęconych historii architektury oraz jej współczesnym tendencjom. W ostatnich latach w Polsce, podobnie jak w większości innych krajów, powstaje coraz więcej centrów architektury, które koncentrują się na dyskusji o problemach architektury współczesnej. Współpracujemy z nimi, ale naszą rolą jest przede wszystkim upowszechnianie wiedzy o dawnej i nowszej historii architektury. Nadal skupiamy się na badaniu i prezentacji tradycji budowlanych Wrocławia, zarówno przygotowując wystawy i publikacje, jak też współpracując z władzami miejskimi przy ochronie i rewitalizacji architektonicznego dziedzictwa miasta. Na przykład obszerna książka poświęcona słynnej wystawie Werkbundu z 1929 roku Wohnung und Werkraum Ausstellung (WuWA – Mieszkanie i miejsce pracy), która została opublikowana przez Muzeum Architektury, w pewnym stopniu przyczyniła się do podjęcia decyzji o renowacji tego unikatowego kompleksu.\r\n\r\nMuzeum realizuje programy i wydarzenia adresowane do profesjonalnych architektów, historyków i szerokiej publiczności. Trzeba tu wspomnieć o cyklu Galeria Jednego Projektu, w którego ramach raz w miesiącu odbywa się prezentacja i dyskusja nad wybranym projektem architektonicznym będącym w fazie realizacji. Do najmłodszej generacji architektów adresowany jest cykl o nazwie Archi-box. Alternatywna przestrzeń poszukiwań, w którym architekci są zapraszani do konstruowania instalacji wyjaśniających ich metody i filozofię pracy.\r\n\r\nMuzealny Dział Edukacji organizuje warsztaty, wykłady i inne wydarzenia dla dzieci, dorosłych i seniorów. Niektóre z nich są związane z trwającymi wystawami czasowymi, inne zaś poświęcone bardziej ogólnym problemom architektury, wzornictwa czy innych dziedzin twórczości związanych z architekturą.\r\n\r\nMuzeum Architektury dysponuje największą we Wrocławiu przestrzenią wystawienniczą i często gości w niej wystawy i wydarzenia przygotowywane we współpracy z innymi instytucjami kultury w mieście. W roku 1970 właśnie w Muzeum Architektury odbyła się wystawa prezentująca prace przygotowane na legendarne dziś Sympozjum Plastyczne Wrocław ’70, zorganizowane z okazji 25. rocznicy powrotu Ziem Zachodnich i Północnych do Macierzy. Do wydarzeń, które kształtowały opinię o Wrocławiu jako mieście otwartym na awangardowe eksperymenty artystyczne, należały też wielkie Wystawy Architektury Intencjonalnej TERRA I i TERRA II, zorganizowane w Muzeum Architektury przez znanego wrocławskiego architekta Stefana Müllera. We współpracy z wrocławską Akademią Sztuk Pięknych muzeum regularnie prezentowało kolejne odsłony Triennale Rysunku, a ostatnio wielką wystawę prac Alessandro Mendiniego, przygotowaną w związku z nadaniem mu tytułu doctora honoris causa tej uczelni.\r\n\r\nMuzeum Architektury weźmie także czynny udział w wydarzeniach roku 2016, kiedy Wrocław będzie piastował tytuł Europejskiej Stolicy Kultury. Zostaną wówczas zaprezentowane wystawy poświęcone historii najważniejszej europejskiej nagrody architektonicznej – Mies van der Rohe Award i obiekty nagrodzone w roku 2015, a także wystawy opowiadające o twórczości Jadwigi Grabowskiej-Hawrylak, międzywojennej architekturze Lwowa i – stanowiąca rodzaj podsumowania naszych dotychczasowych badań –wystawa poświęcona architekturze Wrocławia na przestrzeni XX wieku.\r\n\r\nJolanta Gromadzka, Jerzy Ilkosz, Ewa Jasieńko\r\n\r\nPatronat honorowy nad jubileuszem 50-lecia Muzeum Architektury we Wrocławiu objęli:\r\n\r\nMinister Kultury i Dziedzictwa Narodowego prof. Małgorzata Omilanowska\r\n\r\nPrezydent Miasta Wrocławia Rafał Dutkiewicz', '<p>Muzeum Architektury we Wrocławiu jest jedyną instytucją muzealną w Polsce poświęconą w całości historii architektury oraz architekturze współczesnej. Powstało w 1965 roku, początkowo jako oddział Muzeum Miasta Wrocławia, i działało wówczas pod nazwą Muzeum Architektury i Odbudowy. W 1971 roku usamodzielniło się i zostało przemianowane na Muzeum Architektury we Wrocławiu. Jako jedna z pierwszych instytucji tego typu na świecie zostało członkiem założycielem Międzynarodowej Konfederacji Muzeów Architektury (ICAM), która dzisiaj skupia już ponad sto instytucji działających na niemal wszystkich kontynentach, i w której pracach Muzeum Architektury we Wrocławiu nadal bierze aktywny udział.</p>\n\n<p>Muzeum mieści się w zabytkowym zespole dawnego klasztoru Bernardynów, wzniesionym w drugiej połowie XV i na początku XVI wieku. Do 1522 roku budynek zajmowali zakonnicy, a po ich wypędzeniu z miasta władze Wrocławia urządziły w nim miejski szpital. Kompleks klasztorny uległ poważnym zniszczeniom podczas II wojny światowej i przez blisko dwie dekady pozostawał w częściowej ruinie. Z początkiem lat 60. XX wieku przystąpiono do jego odbudowy, która trwała do roku 1974, kiedy to muzeum pozyskało na swoje potrzeby trójnawową bazylikę dawnego kościoła. Autorem projektu odbudowy klasztoru i kościoła oraz ich adaptacji do potrzeb muzealnych był architekt Edmund Małachowicz.</p>\n\n<p><img src=\"http://localhost/ma.wroc.pl/workspace/images/posts/3-main.png\" alt=\"\" /></p>\n\n<p>Założycielem muzeum był główny konserwator zabytków Wrocławia i późniejszy profesor Politechniki Wrocławskiej, Olgierd Czerner, który kierował placówką od jej założenia do 2000 roku. Początkowo celem muzeum było przede wszystkim pozyskiwanie i inwentaryzowanie ocalałych resztek detali architektonicznych, pochodzących z budynków zrujnowanych podczas wojny. Najcenniejsze z nich zostały zgromadzone na stałej, powiększanej z biegiem czasu ekspozycji. W późniejszym okresie muzeum rozszerzyło swoją działalność na teren całej Polski, służąc przede wszystkim polskim architektom.</p>\n\n<p>Znajdujący się na trawniku przed wejściem głównym do Muzeum Architektury model pomnika Rozstrzelanych Zakładników z Nowego Sącza został wykonany w latach 1966-1968 przez Władysława Hasiora. Do realizacji pomnika nigdy nie doszło, a rzeźba została zakupiona w 1971 roku przez Muzeum Architektury we Wrocławiu i ustawiona w miejscu, w którym stoi do dziś. W latach 70-tych, w dniu Wszystkich Świętych, pracownicy muzeum zapalali płomienie na pomniku za pomocą specjalnie przygotowanego do tego paliwa. Później jednak tradycja zanikła, ostatni raz odpalenie płomieni miało miejsce w Noc Muzeów w roku 2014.</p>\n\n<p>Charakterystyczne logo Muzeum Architektury, pierwszy logotyp instytucji kultury we Wrocławiu, zaprojektował w 1966 roku artysta grafik Tadeusz Ciałowicz.</p>\n\n<p>Podstawowa działalność muzealna, jaką jest gromadzenie eksponatów, ich opracowywanie i udostępnianie, prowadzona jest za pośrednictwem kilku działów. Kolekcja Działu Architektury Średniowiecznej obejmuje bogaty zbiór kamieniarki architektonicznej, w tym niektóre z najstarszych zabytków rzeźbiarskich we Wrocławiu i w całej Polsce, jak słynny Tympanon Jaksy pochodzacy z opactwa benedyktynów na wrocławskim Ołbinie. W Dziale Architektury Nowożytnej znajdują się pochodzące głównie z Wrocławia i terenu Śląska zabytki renesansowe, manierystyczne i barokowe oraz klasycystyczne, w tym zbiory grafiki, kamieniarki, witraży, elementów stropów drewnianych, ceramiki architektonicznej, okucia czy kraty. Działy Architektury XIX i XX wieku oraz Dział Architektury Współczesnej opiekują się spuścizną ponad osiemdziesięciu czołowych polskich architektów, takich jak na przykład: Romuald Gutt, Jerzy Hryniewiecki, Wacław Krzyżanowski, Jan Koszczyc-Witkiewicz, Bohdan Lachert i Józef Szanajca, Tadeusz Michejda, Stefan Narębski, Maciej Nowicki, uważany za największego polskiego architekta XX wieku, Bohdan Pniewski, Helena i Szymon Syrkusowie, Jerzy Sołtan (uczeń Le Corbusiera), Bolesław Szmidt, Adolf Szyszko-Bohusz czy Kazimierz Wejchert. W zbiorach tych działów znajdują się ponadto prace wielu słynnych architektów światowych, jak choćby Le Corbusier, Alvar Aalto, Kisho Kurokawa czy Richard England, a także jedna z największych w Polsce kolekcji witraży i ciekawy zbiór rzemiosła artystycznego. Kolekcja jest regularnie wykorzystywana przez badaczy z kraju i z zagranicy. Stanowi także podstawę wielu wystaw i publikacji przygotowywanych przez muzeum.</p>\n\n<p>Podobnie jak w innych placówkach muzealnych tego typu, wychodząc z założenia, że architektura jest ściśle związana z innymi dziedzinami sztuki, w Dziale Sztuki Współczesnej wrocławskiego muzeum zgromadzono obszerną kolekcję projektów sztuki użytkowej oraz malarstwa i grafiki. Reprezentuje ona przede wszystkim nurt abstrakcji geometrycznej, obejmując między innymi dzieła jego czołowych przedstawicieli, na przykład Henryka Stażewskiego czy Marii Jaremy.</p>\n\n<p>Od czasu swego powstania muzeum zaprezentowało ponad 600 wystaw czasowych, które były pokazywane zarówno w jego siedzibie, jak i w innych miejscach w Polsce i za granicą, między innymi w Berlinie Zachodnim, Dreźnie, Moskwie, Hanowerze, Lyonie, Coventry i Londynie. W 1981 roku wystawa Awangarda polska 1918–1939 została zaprezentowana w Centre Georges Pompidou w Paryżu. Szeregowi wystaw poświęconych architektom, których prace znajdują się w zbiorach muzeum, towarzyszyły katalogi, często stanowiące pierwsze publikowane monografie tych twórców.</p>\n\n<p>W 2000 roku, po przejściu na emeryturę profesora Olgierda Czernera, stanowisko dyrektora objął Jerzy Ilkosz. Z racji swoich zainteresowań skupił się on, obok prezentacji polskiej architektury współczesnej, na badaniu i prezentowaniu architektury wrocławskiego modernizmu. Transformacja polityczna stworzyła sprzyjający klimat dla pracy naukowej związanej z tematem dziedzictwa architektury niemieckiej we Wrocławiu, wcześniej objętego zapisem cenzury.</p>\n\n<p>Muzeum przejęło w tym czasie olbrzymie zbiory dawnego Archiwum Budowlanego Miasta Wrocławia, pozyskując ponad 150 000 projektów budowli wrocławskich, powstających od początku XIX wieku do 1945 roku. Utworzono wtedy osobny oddział dla tych zbiorów oraz dodatkowo Dział Architektury Wrocławia XIX i XX wieku.  Pozyskane dzieła pokazywano szerokiej publiczności na wielu wystawach, prezentując po raz pierwszy prace tak znakomitych architektów, jak Hans Poelzig, Erich Mendelsohn, Max Berg, Ernst May, Hans Scharoun, Adolf Rading, Paul Schmitthenner, Heinrich Lauterbach i wielu innych. Dzieła z tej kolekcji znalazły się również na wielkich wystawach przygotowywanych przez ówczesnego dyrektora Deutsches Architekturmuseum we Frankfurcie nad Menem – Vittorio Magnago Lampugnaniego, a także na wystawach w Paryżu i Barcelonie. Nasza wystawa, poświęcona projektom wieżowców dla Wrocławia, była pokazywana w Brunszwiku oraz Monachium, a monograficzna wystawa Hansa Poelziga – w Düsseldorfie, Dreźnie i Görlitz. W 2005 roku, w związku z przygotowaniem aplikacji o wpis na listę światowego dziedzictwa UNESCO wybitnego wrocławskiego dzieła – Hali Stulecia, Muzeum Architektury przygotowało monograficzną wystawę poświęconą temu niezwykłemu pomnikowi architektury, której towarzyszył katalog opracowany również w języku angielskim i niemieckim. Obszerne katalogi towarzyszyły też większości pozostałych ekspozycji, zorganizowanych w ostatnim piętnastoleciu.</p>\n\n<p>Obecna sytuacja Muzeum Architektury jest w dużym stopniu zdeterminowana przez historię i tradycję instytucji, a podejmowane działania muszą się rozgrywać na kilku poziomach. Z jednej strony jesteśmy odpowiedzialni za ochronę i udostępnianie publiczności naszej siedziby – gotyckiego klasztoru, który sam w sobie stanowi historyczną wartość. Zdecydowaliśmy się także zachować wystawę zabytkowych rzeźb i detali kamiennych, która powstała w latach sześćdziesiątych XX wieku. Poza prezentacją ważnych zabytków średniowiecznej sztuki i kultury, stanowi ona także świadectwo roli, jaką interpretacja średniowiecznej historii odegrała w konstruowaniu tożsamości miasta, w którym po drugiej wojnie światowej dokonała się całkowita wymiana ludności.</p>\n\n<p>Innym aspektem naszej misji jest uzupełnianie i poszerzanie kolekcji, co czasem dokonuje się przez zakup prac, ale częściej dzięki współpracy z pracowniami architektonicznymi lub przejmowanie spuścizny ważnych architektów starszej generacji.</p>\n\n<p>Specyficzny charakter zbiorów Archiwum Budowlanego, które stanowi ważną kolekcję historyczną, a jednocześnie nadal jest intensywnie wykorzystywane w celach praktycznych, stał się powodem podjęcia decyzji o zdigitalizowaniu zgromadzonych w nim materiałów. W roku 2010, dzięki wykorzystaniu funduszy Unii Europejskiej, zakupiono nowoczesny, wielkoformatowy skaner CRUSE oraz opracowano specjalistyczną bazę danych, umożliwiającą gromadzenie zdigitalizowanych materiałów i prezentowanie ich w Internecie. Dotychczas udostępniono ponad 41 000 archiwalnych planów.</p>\n\n<p>Kontynuujemy także tradycję regularnego organizowania wystaw czasowych, poświęconych historii architektury oraz jej współczesnym tendencjom. W ostatnich latach w Polsce, podobnie jak w większości innych krajów, powstaje coraz więcej centrów architektury, które koncentrują się na dyskusji o problemach architektury współczesnej. Współpracujemy z nimi, ale naszą rolą jest przede wszystkim upowszechnianie wiedzy o dawnej i nowszej historii architektury. Nadal skupiamy się na badaniu i prezentacji tradycji budowlanych Wrocławia, zarówno przygotowując wystawy i publikacje, jak też współpracując z władzami miejskimi przy ochronie i rewitalizacji architektonicznego dziedzictwa miasta. Na przykład obszerna książka poświęcona słynnej wystawie Werkbundu z 1929 roku Wohnung und Werkraum Ausstellung (WuWA – Mieszkanie i miejsce pracy), która została opublikowana przez Muzeum Architektury, w pewnym stopniu przyczyniła się do podjęcia decyzji o renowacji tego unikatowego kompleksu.</p>\n\n<p>Muzeum realizuje programy i wydarzenia adresowane do profesjonalnych architektów, historyków i szerokiej publiczności. Trzeba tu wspomnieć o cyklu Galeria Jednego Projektu, w którego ramach raz w miesiącu odbywa się prezentacja i dyskusja nad wybranym projektem architektonicznym będącym w fazie realizacji. Do najmłodszej generacji architektów adresowany jest cykl o nazwie Archi-box. Alternatywna przestrzeń poszukiwań, w którym architekci są zapraszani do konstruowania instalacji wyjaśniających ich metody i filozofię pracy.</p>\n\n<p>Muzealny Dział Edukacji organizuje warsztaty, wykłady i inne wydarzenia dla dzieci, dorosłych i seniorów. Niektóre z nich są związane z trwającymi wystawami czasowymi, inne zaś poświęcone bardziej ogólnym problemom architektury, wzornictwa czy innych dziedzin twórczości związanych z architekturą.</p>\n\n<p>Muzeum Architektury dysponuje największą we Wrocławiu przestrzenią wystawienniczą i często gości w niej wystawy i wydarzenia przygotowywane we współpracy z innymi instytucjami kultury w mieście. W roku 1970 właśnie w Muzeum Architektury odbyła się wystawa prezentująca prace przygotowane na legendarne dziś Sympozjum Plastyczne Wrocław ’70, zorganizowane z okazji 25. rocznicy powrotu Ziem Zachodnich i Północnych do Macierzy. Do wydarzeń, które kształtowały opinię o Wrocławiu jako mieście otwartym na awangardowe eksperymenty artystyczne, należały też wielkie Wystawy Architektury Intencjonalnej TERRA I i TERRA II, zorganizowane w Muzeum Architektury przez znanego wrocławskiego architekta Stefana Müllera. We współpracy z wrocławską Akademią Sztuk Pięknych muzeum regularnie prezentowało kolejne odsłony Triennale Rysunku, a ostatnio wielką wystawę prac Alessandro Mendiniego, przygotowaną w związku z nadaniem mu tytułu doctora honoris causa tej uczelni.</p>\n\n<p>Muzeum Architektury weźmie także czynny udział w wydarzeniach roku 2016, kiedy Wrocław będzie piastował tytuł Europejskiej Stolicy Kultury. Zostaną wówczas zaprezentowane wystawy poświęcone historii najważniejszej europejskiej nagrody architektonicznej – Mies van der Rohe Award i obiekty nagrodzone w roku 2015, a także wystawy opowiadające o twórczości Jadwigi Grabowskiej-Hawrylak, międzywojennej architekturze Lwowa i – stanowiąca rodzaj podsumowania naszych dotychczasowych badań –wystawa poświęcona architekturze Wrocławia na przestrzeni XX wieku.</p>\n\n<p>Jolanta Gromadzka, Jerzy Ilkosz, Ewa Jasieńko</p>\n\n<p>Patronat honorowy nad jubileuszem 50-lecia Muzeum Architektury we Wrocławiu objęli:</p>\n\n<p>Minister Kultury i Dziedzictwa Narodowego prof. Małgorzata Omilanowska</p>\n\n<p>Prezydent Miasta Wrocławia Rafał Dutkiewicz</p>\n', 1552, NULL, NULL, NULL, 0, 'muzeum-architektury-we-wroclawiu-jest-jedyna-instytucja-muzealna-w-polsce-poswiecona-w-calosci-historii-architektury-oraz-architekturze-wspolczesnej-powstalo-w-1965-roku-poczatkowo-jako-oddzial-muzeum-miasta-wroclawia-i-dzialalo-wowczas-pod-nazwa-muzeum', 'Muzeum Architektury we Wrocławiu jest jedyną instytucją muzealną w Polsce poświęconą w całości historii architektury oraz architekturze współczesnej. Powstało w 1965 roku, początkowo jako oddział Muzeum Miasta Wrocławia, i działało wówczas pod nazwą Muzeum Architektury i Odbudowy. W 1971 roku usamodzielniło się i zostało przemianowane na Muzeum Architektury we Wrocławiu. Jako jedna z pierwszych instytucji tego typu na świecie zostało członkiem założycielem Międzynarodowej Konfederacji Muzeów Architektury (ICAM), która dzisiaj skupia już ponad sto instytucji działających na niemal wszystkich kontynentach, i w której pracach Muzeum Architektury we Wrocławiu nadal bierze aktywny udział.\r\n\r\nMuzeum mieści się w zabytkowym zespole dawnego klasztoru Bernardynów, wzniesionym w drugiej połowie XV i na początku XVI wieku. Do 1522 roku budynek zajmowali zakonnicy, a po ich wypędzeniu z miasta władze Wrocławia urządziły w nim miejski szpital. Kompleks klasztorny uległ poważnym zniszczeniom podczas II wojny światowej i przez blisko dwie dekady pozostawał w częściowej ruinie. Z początkiem lat 60. XX wieku przystąpiono do jego odbudowy, która trwała do roku 1974, kiedy to muzeum pozyskało na swoje potrzeby trójnawową bazylikę dawnego kościoła. Autorem projektu odbudowy klasztoru i kościoła oraz ich adaptacji do potrzeb muzealnych był architekt Edmund Małachowicz.\r\n\r\n![](http://localhost/ma.wroc.pl/workspace/images/posts/3-main.png)\r\n\r\nZałożycielem muzeum był główny konserwator zabytków Wrocławia i późniejszy profesor Politechniki Wrocławskiej, Olgierd Czerner, który kierował placówką od jej założenia do 2000 roku. Początkowo celem muzeum było przede wszystkim pozyskiwanie i inwentaryzowanie ocalałych resztek detali architektonicznych, pochodzących z budynków zrujnowanych podczas wojny. Najcenniejsze z nich zostały zgromadzone na stałej, powiększanej z biegiem czasu ekspozycji. W późniejszym okresie muzeum rozszerzyło swoją działalność na teren całej Polski, służąc przede wszystkim polskim architektom.\r\n\r\nZnajdujący się na trawniku przed wejściem głównym do Muzeum Architektury model pomnika Rozstrzelanych Zakładników z Nowego Sącza został wykonany w latach 1966-1968 przez Władysława Hasiora. Do realizacji pomnika nigdy nie doszło, a rzeźba została zakupiona w 1971 roku przez Muzeum Architektury we Wrocławiu i ustawiona w miejscu, w którym stoi do dziś. W latach 70-tych, w dniu Wszystkich Świętych, pracownicy muzeum zapalali płomienie na pomniku za pomocą specjalnie przygotowanego do tego paliwa. Później jednak tradycja zanikła, ostatni raz odpalenie płomieni miało miejsce w Noc Muzeów w roku 2014.\r\n\r\nCharakterystyczne logo Muzeum Architektury, pierwszy logotyp instytucji kultury we Wrocławiu, zaprojektował w 1966 roku artysta grafik Tadeusz Ciałowicz. \r\n\r\nPodstawowa działalność muzealna, jaką jest gromadzenie eksponatów, ich opracowywanie i udostępnianie, prowadzona jest za pośrednictwem kilku działów. Kolekcja Działu Architektury Średniowiecznej obejmuje bogaty zbiór kamieniarki architektonicznej, w tym niektóre z najstarszych zabytków rzeźbiarskich we Wrocławiu i w całej Polsce, jak słynny Tympanon Jaksy pochodzacy z opactwa benedyktynów na wrocławskim Ołbinie. W Dziale Architektury Nowożytnej znajdują się pochodzące głównie z Wrocławia i terenu Śląska zabytki renesansowe, manierystyczne i barokowe oraz klasycystyczne, w tym zbiory grafiki, kamieniarki, witraży, elementów stropów drewnianych, ceramiki architektonicznej, okucia czy kraty. Działy Architektury XIX i XX wieku oraz Dział Architektury Współczesnej opiekują się spuścizną ponad osiemdziesięciu czołowych polskich architektów, takich jak na przykład: Romuald Gutt, Jerzy Hryniewiecki, Wacław Krzyżanowski, Jan Koszczyc-Witkiewicz, Bohdan Lachert i Józef Szanajca, Tadeusz Michejda, Stefan Narębski, Maciej Nowicki, uważany za największego polskiego architekta XX wieku, Bohdan Pniewski, Helena i Szymon Syrkusowie, Jerzy Sołtan (uczeń Le Corbusiera), Bolesław Szmidt, Adolf Szyszko-Bohusz czy Kazimierz Wejchert. W zbiorach tych działów znajdują się ponadto prace wielu słynnych architektów światowych, jak choćby Le Corbusier, Alvar Aalto, Kisho Kurokawa czy Richard England, a także jedna z największych w Polsce kolekcji witraży i ciekawy zbiór rzemiosła artystycznego. Kolekcja jest regularnie wykorzystywana przez badaczy z kraju i z zagranicy. Stanowi także podstawę wielu wystaw i publikacji przygotowywanych przez muzeum.\r\n\r\n Podobnie jak w innych placówkach muzealnych tego typu, wychodząc z założenia, że architektura jest ściśle związana z innymi dziedzinami sztuki, w Dziale Sztuki Współczesnej wrocławskiego muzeum zgromadzono obszerną kolekcję projektów sztuki użytkowej oraz malarstwa i grafiki. Reprezentuje ona przede wszystkim nurt abstrakcji geometrycznej, obejmując między innymi dzieła jego czołowych przedstawicieli, na przykład Henryka Stażewskiego czy Marii Jaremy.\r\n\r\nOd czasu swego powstania muzeum zaprezentowało ponad 600 wystaw czasowych, które były pokazywane zarówno w jego siedzibie, jak i w innych miejscach w Polsce i za granicą, między innymi w Berlinie Zachodnim, Dreźnie, Moskwie, Hanowerze, Lyonie, Coventry i Londynie. W 1981 roku wystawa Awangarda polska 1918–1939 została zaprezentowana w Centre Georges Pompidou w Paryżu. Szeregowi wystaw poświęconych architektom, których prace znajdują się w zbiorach muzeum, towarzyszyły katalogi, często stanowiące pierwsze publikowane monografie tych twórców.\r\n\r\nW 2000 roku, po przejściu na emeryturę profesora Olgierda Czernera, stanowisko dyrektora objął Jerzy Ilkosz. Z racji swoich zainteresowań skupił się on, obok prezentacji polskiej architektury współczesnej, na badaniu i prezentowaniu architektury wrocławskiego modernizmu. Transformacja polityczna stworzyła sprzyjający klimat dla pracy naukowej związanej z tematem dziedzictwa architektury niemieckiej we Wrocławiu, wcześniej objętego zapisem cenzury.\r\n\r\nMuzeum przejęło w tym czasie olbrzymie zbiory dawnego Archiwum Budowlanego Miasta Wrocławia, pozyskując ponad 150 000 projektów budowli wrocławskich, powstających od początku XIX wieku do 1945 roku. Utworzono wtedy osobny oddział dla tych zbiorów oraz dodatkowo Dział Architektury Wrocławia XIX i XX wieku.  Pozyskane dzieła pokazywano szerokiej publiczności na wielu wystawach, prezentując po raz pierwszy prace tak znakomitych architektów, jak Hans Poelzig, Erich Mendelsohn, Max Berg, Ernst May, Hans Scharoun, Adolf Rading, Paul Schmitthenner, Heinrich Lauterbach i wielu innych. Dzieła z tej kolekcji znalazły się również na wielkich wystawach przygotowywanych przez ówczesnego dyrektora Deutsches Architekturmuseum we Frankfurcie nad Menem – Vittorio Magnago Lampugnaniego, a także na wystawach w Paryżu i Barcelonie. Nasza wystawa, poświęcona projektom wieżowców dla Wrocławia, była pokazywana w Brunszwiku oraz Monachium, a monograficzna wystawa Hansa Poelziga – w Düsseldorfie, Dreźnie i Görlitz. W 2005 roku, w związku z przygotowaniem aplikacji o wpis na listę światowego dziedzictwa UNESCO wybitnego wrocławskiego dzieła – Hali Stulecia, Muzeum Architektury przygotowało monograficzną wystawę poświęconą temu niezwykłemu pomnikowi architektury, której towarzyszył katalog opracowany również w języku angielskim i niemieckim. Obszerne katalogi towarzyszyły też większości pozostałych ekspozycji, zorganizowanych w ostatnim piętnastoleciu.\r\n\r\nObecna sytuacja Muzeum Architektury jest w dużym stopniu zdeterminowana przez historię i tradycję instytucji, a podejmowane działania muszą się rozgrywać na kilku poziomach. Z jednej strony jesteśmy odpowiedzialni za ochronę i udostępnianie publiczności naszej siedziby – gotyckiego klasztoru, który sam w sobie stanowi historyczną wartość. Zdecydowaliśmy się także zachować wystawę zabytkowych rzeźb i detali kamiennych, która powstała w latach sześćdziesiątych XX wieku. Poza prezentacją ważnych zabytków średniowiecznej sztuki i kultury, stanowi ona także świadectwo roli, jaką interpretacja średniowiecznej historii odegrała w konstruowaniu tożsamości miasta, w którym po drugiej wojnie światowej dokonała się całkowita wymiana ludności.\r\n\r\nInnym aspektem naszej misji jest uzupełnianie i poszerzanie kolekcji, co czasem dokonuje się przez zakup prac, ale częściej dzięki współpracy z pracowniami architektonicznymi lub przejmowanie spuścizny ważnych architektów starszej generacji.\r\n\r\nSpecyficzny charakter zbiorów Archiwum Budowlanego, które stanowi ważną kolekcję historyczną, a jednocześnie nadal jest intensywnie wykorzystywane w celach praktycznych, stał się powodem podjęcia decyzji o zdigitalizowaniu zgromadzonych w nim materiałów. W roku 2010, dzięki wykorzystaniu funduszy Unii Europejskiej, zakupiono nowoczesny, wielkoformatowy skaner CRUSE oraz opracowano specjalistyczną bazę danych, umożliwiającą gromadzenie zdigitalizowanych materiałów i prezentowanie ich w Internecie. Dotychczas udostępniono ponad 41 000 archiwalnych planów.\r\n\r\nKontynuujemy także tradycję regularnego organizowania wystaw czasowych, poświęconych historii architektury oraz jej współczesnym tendencjom. W ostatnich latach w Polsce, podobnie jak w większości innych krajów, powstaje coraz więcej centrów architektury, które koncentrują się na dyskusji o problemach architektury współczesnej. Współpracujemy z nimi, ale naszą rolą jest przede wszystkim upowszechnianie wiedzy o dawnej i nowszej historii architektury. Nadal skupiamy się na badaniu i prezentacji tradycji budowlanych Wrocławia, zarówno przygotowując wystawy i publikacje, jak też współpracując z władzami miejskimi przy ochronie i rewitalizacji architektonicznego dziedzictwa miasta. Na przykład obszerna książka poświęcona słynnej wystawie Werkbundu z 1929 roku Wohnung und Werkraum Ausstellung (WuWA – Mieszkanie i miejsce pracy), która została opublikowana przez Muzeum Architektury, w pewnym stopniu przyczyniła się do podjęcia decyzji o renowacji tego unikatowego kompleksu.\r\n\r\nMuzeum realizuje programy i wydarzenia adresowane do profesjonalnych architektów, historyków i szerokiej publiczności. Trzeba tu wspomnieć o cyklu Galeria Jednego Projektu, w którego ramach raz w miesiącu odbywa się prezentacja i dyskusja nad wybranym projektem architektonicznym będącym w fazie realizacji. Do najmłodszej generacji architektów adresowany jest cykl o nazwie Archi-box. Alternatywna przestrzeń poszukiwań, w którym architekci są zapraszani do konstruowania instalacji wyjaśniających ich metody i filozofię pracy.\r\n\r\nMuzealny Dział Edukacji organizuje warsztaty, wykłady i inne wydarzenia dla dzieci, dorosłych i seniorów. Niektóre z nich są związane z trwającymi wystawami czasowymi, inne zaś poświęcone bardziej ogólnym problemom architektury, wzornictwa czy innych dziedzin twórczości związanych z architekturą.\r\n\r\nMuzeum Architektury dysponuje największą we Wrocławiu przestrzenią wystawienniczą i często gości w niej wystawy i wydarzenia przygotowywane we współpracy z innymi instytucjami kultury w mieście. W roku 1970 właśnie w Muzeum Architektury odbyła się wystawa prezentująca prace przygotowane na legendarne dziś Sympozjum Plastyczne Wrocław ’70, zorganizowane z okazji 25. rocznicy powrotu Ziem Zachodnich i Północnych do Macierzy. Do wydarzeń, które kształtowały opinię o Wrocławiu jako mieście otwartym na awangardowe eksperymenty artystyczne, należały też wielkie Wystawy Architektury Intencjonalnej TERRA I i TERRA II, zorganizowane w Muzeum Architektury przez znanego wrocławskiego architekta Stefana Müllera. We współpracy z wrocławską Akademią Sztuk Pięknych muzeum regularnie prezentowało kolejne odsłony Triennale Rysunku, a ostatnio wielką wystawę prac Alessandro Mendiniego, przygotowaną w związku z nadaniem mu tytułu doctora honoris causa tej uczelni.\r\n\r\nMuzeum Architektury weźmie także czynny udział w wydarzeniach roku 2016, kiedy Wrocław będzie piastował tytuł Europejskiej Stolicy Kultury. Zostaną wówczas zaprezentowane wystawy poświęcone historii najważniejszej europejskiej nagrody architektonicznej – Mies van der Rohe Award i obiekty nagrodzone w roku 2015, a także wystawy opowiadające o twórczości Jadwigi Grabowskiej-Hawrylak, międzywojennej architekturze Lwowa i – stanowiąca rodzaj podsumowania naszych dotychczasowych badań –wystawa poświęcona architekturze Wrocławia na przestrzeni XX wieku.\r\n\r\nJolanta Gromadzka, Jerzy Ilkosz, Ewa Jasieńko\r\n\r\nPatronat honorowy nad jubileuszem 50-lecia Muzeum Architektury we Wrocławiu objęli:\r\n\r\nMinister Kultury i Dziedzictwa Narodowego prof. Małgorzata Omilanowska\r\n\r\nPrezydent Miasta Wrocławia Rafał Dutkiewicz', '<p>Muzeum Architektury we Wrocławiu jest jedyną instytucją muzealną w Polsce poświęconą w całości historii architektury oraz architekturze współczesnej. Powstało w 1965 roku, początkowo jako oddział Muzeum Miasta Wrocławia, i działało wówczas pod nazwą Muzeum Architektury i Odbudowy. W 1971 roku usamodzielniło się i zostało przemianowane na Muzeum Architektury we Wrocławiu. Jako jedna z pierwszych instytucji tego typu na świecie zostało członkiem założycielem Międzynarodowej Konfederacji Muzeów Architektury (ICAM), która dzisiaj skupia już ponad sto instytucji działających na niemal wszystkich kontynentach, i w której pracach Muzeum Architektury we Wrocławiu nadal bierze aktywny udział.</p>\n\n<p>Muzeum mieści się w zabytkowym zespole dawnego klasztoru Bernardynów, wzniesionym w drugiej połowie XV i na początku XVI wieku. Do 1522 roku budynek zajmowali zakonnicy, a po ich wypędzeniu z miasta władze Wrocławia urządziły w nim miejski szpital. Kompleks klasztorny uległ poważnym zniszczeniom podczas II wojny światowej i przez blisko dwie dekady pozostawał w częściowej ruinie. Z początkiem lat 60. XX wieku przystąpiono do jego odbudowy, która trwała do roku 1974, kiedy to muzeum pozyskało na swoje potrzeby trójnawową bazylikę dawnego kościoła. Autorem projektu odbudowy klasztoru i kościoła oraz ich adaptacji do potrzeb muzealnych był architekt Edmund Małachowicz.</p>\n\n<p><img src=\"http://localhost/ma.wroc.pl/workspace/images/posts/3-main.png\" alt=\"\" /></p>\n\n<p>Założycielem muzeum był główny konserwator zabytków Wrocławia i późniejszy profesor Politechniki Wrocławskiej, Olgierd Czerner, który kierował placówką od jej założenia do 2000 roku. Początkowo celem muzeum było przede wszystkim pozyskiwanie i inwentaryzowanie ocalałych resztek detali architektonicznych, pochodzących z budynków zrujnowanych podczas wojny. Najcenniejsze z nich zostały zgromadzone na stałej, powiększanej z biegiem czasu ekspozycji. W późniejszym okresie muzeum rozszerzyło swoją działalność na teren całej Polski, służąc przede wszystkim polskim architektom.</p>\n\n<p>Znajdujący się na trawniku przed wejściem głównym do Muzeum Architektury model pomnika Rozstrzelanych Zakładników z Nowego Sącza został wykonany w latach 1966-1968 przez Władysława Hasiora. Do realizacji pomnika nigdy nie doszło, a rzeźba została zakupiona w 1971 roku przez Muzeum Architektury we Wrocławiu i ustawiona w miejscu, w którym stoi do dziś. W latach 70-tych, w dniu Wszystkich Świętych, pracownicy muzeum zapalali płomienie na pomniku za pomocą specjalnie przygotowanego do tego paliwa. Później jednak tradycja zanikła, ostatni raz odpalenie płomieni miało miejsce w Noc Muzeów w roku 2014.</p>\n\n<p>Charakterystyczne logo Muzeum Architektury, pierwszy logotyp instytucji kultury we Wrocławiu, zaprojektował w 1966 roku artysta grafik Tadeusz Ciałowicz.</p>\n\n<p>Podstawowa działalność muzealna, jaką jest gromadzenie eksponatów, ich opracowywanie i udostępnianie, prowadzona jest za pośrednictwem kilku działów. Kolekcja Działu Architektury Średniowiecznej obejmuje bogaty zbiór kamieniarki architektonicznej, w tym niektóre z najstarszych zabytków rzeźbiarskich we Wrocławiu i w całej Polsce, jak słynny Tympanon Jaksy pochodzacy z opactwa benedyktynów na wrocławskim Ołbinie. W Dziale Architektury Nowożytnej znajdują się pochodzące głównie z Wrocławia i terenu Śląska zabytki renesansowe, manierystyczne i barokowe oraz klasycystyczne, w tym zbiory grafiki, kamieniarki, witraży, elementów stropów drewnianych, ceramiki architektonicznej, okucia czy kraty. Działy Architektury XIX i XX wieku oraz Dział Architektury Współczesnej opiekują się spuścizną ponad osiemdziesięciu czołowych polskich architektów, takich jak na przykład: Romuald Gutt, Jerzy Hryniewiecki, Wacław Krzyżanowski, Jan Koszczyc-Witkiewicz, Bohdan Lachert i Józef Szanajca, Tadeusz Michejda, Stefan Narębski, Maciej Nowicki, uważany za największego polskiego architekta XX wieku, Bohdan Pniewski, Helena i Szymon Syrkusowie, Jerzy Sołtan (uczeń Le Corbusiera), Bolesław Szmidt, Adolf Szyszko-Bohusz czy Kazimierz Wejchert. W zbiorach tych działów znajdują się ponadto prace wielu słynnych architektów światowych, jak choćby Le Corbusier, Alvar Aalto, Kisho Kurokawa czy Richard England, a także jedna z największych w Polsce kolekcji witraży i ciekawy zbiór rzemiosła artystycznego. Kolekcja jest regularnie wykorzystywana przez badaczy z kraju i z zagranicy. Stanowi także podstawę wielu wystaw i publikacji przygotowywanych przez muzeum.</p>\n\n<p>Podobnie jak w innych placówkach muzealnych tego typu, wychodząc z założenia, że architektura jest ściśle związana z innymi dziedzinami sztuki, w Dziale Sztuki Współczesnej wrocławskiego muzeum zgromadzono obszerną kolekcję projektów sztuki użytkowej oraz malarstwa i grafiki. Reprezentuje ona przede wszystkim nurt abstrakcji geometrycznej, obejmując między innymi dzieła jego czołowych przedstawicieli, na przykład Henryka Stażewskiego czy Marii Jaremy.</p>\n\n<p>Od czasu swego powstania muzeum zaprezentowało ponad 600 wystaw czasowych, które były pokazywane zarówno w jego siedzibie, jak i w innych miejscach w Polsce i za granicą, między innymi w Berlinie Zachodnim, Dreźnie, Moskwie, Hanowerze, Lyonie, Coventry i Londynie. W 1981 roku wystawa Awangarda polska 1918–1939 została zaprezentowana w Centre Georges Pompidou w Paryżu. Szeregowi wystaw poświęconych architektom, których prace znajdują się w zbiorach muzeum, towarzyszyły katalogi, często stanowiące pierwsze publikowane monografie tych twórców.</p>\n\n<p>W 2000 roku, po przejściu na emeryturę profesora Olgierda Czernera, stanowisko dyrektora objął Jerzy Ilkosz. Z racji swoich zainteresowań skupił się on, obok prezentacji polskiej architektury współczesnej, na badaniu i prezentowaniu architektury wrocławskiego modernizmu. Transformacja polityczna stworzyła sprzyjający klimat dla pracy naukowej związanej z tematem dziedzictwa architektury niemieckiej we Wrocławiu, wcześniej objętego zapisem cenzury.</p>\n\n<p>Muzeum przejęło w tym czasie olbrzymie zbiory dawnego Archiwum Budowlanego Miasta Wrocławia, pozyskując ponad 150 000 projektów budowli wrocławskich, powstających od początku XIX wieku do 1945 roku. Utworzono wtedy osobny oddział dla tych zbiorów oraz dodatkowo Dział Architektury Wrocławia XIX i XX wieku.  Pozyskane dzieła pokazywano szerokiej publiczności na wielu wystawach, prezentując po raz pierwszy prace tak znakomitych architektów, jak Hans Poelzig, Erich Mendelsohn, Max Berg, Ernst May, Hans Scharoun, Adolf Rading, Paul Schmitthenner, Heinrich Lauterbach i wielu innych. Dzieła z tej kolekcji znalazły się również na wielkich wystawach przygotowywanych przez ówczesnego dyrektora Deutsches Architekturmuseum we Frankfurcie nad Menem – Vittorio Magnago Lampugnaniego, a także na wystawach w Paryżu i Barcelonie. Nasza wystawa, poświęcona projektom wieżowców dla Wrocławia, była pokazywana w Brunszwiku oraz Monachium, a monograficzna wystawa Hansa Poelziga – w Düsseldorfie, Dreźnie i Görlitz. W 2005 roku, w związku z przygotowaniem aplikacji o wpis na listę światowego dziedzictwa UNESCO wybitnego wrocławskiego dzieła – Hali Stulecia, Muzeum Architektury przygotowało monograficzną wystawę poświęconą temu niezwykłemu pomnikowi architektury, której towarzyszył katalog opracowany również w języku angielskim i niemieckim. Obszerne katalogi towarzyszyły też większości pozostałych ekspozycji, zorganizowanych w ostatnim piętnastoleciu.</p>\n\n<p>Obecna sytuacja Muzeum Architektury jest w dużym stopniu zdeterminowana przez historię i tradycję instytucji, a podejmowane działania muszą się rozgrywać na kilku poziomach. Z jednej strony jesteśmy odpowiedzialni za ochronę i udostępnianie publiczności naszej siedziby – gotyckiego klasztoru, który sam w sobie stanowi historyczną wartość. Zdecydowaliśmy się także zachować wystawę zabytkowych rzeźb i detali kamiennych, która powstała w latach sześćdziesiątych XX wieku. Poza prezentacją ważnych zabytków średniowiecznej sztuki i kultury, stanowi ona także świadectwo roli, jaką interpretacja średniowiecznej historii odegrała w konstruowaniu tożsamości miasta, w którym po drugiej wojnie światowej dokonała się całkowita wymiana ludności.</p>\n\n<p>Innym aspektem naszej misji jest uzupełnianie i poszerzanie kolekcji, co czasem dokonuje się przez zakup prac, ale częściej dzięki współpracy z pracowniami architektonicznymi lub przejmowanie spuścizny ważnych architektów starszej generacji.</p>\n\n<p>Specyficzny charakter zbiorów Archiwum Budowlanego, które stanowi ważną kolekcję historyczną, a jednocześnie nadal jest intensywnie wykorzystywane w celach praktycznych, stał się powodem podjęcia decyzji o zdigitalizowaniu zgromadzonych w nim materiałów. W roku 2010, dzięki wykorzystaniu funduszy Unii Europejskiej, zakupiono nowoczesny, wielkoformatowy skaner CRUSE oraz opracowano specjalistyczną bazę danych, umożliwiającą gromadzenie zdigitalizowanych materiałów i prezentowanie ich w Internecie. Dotychczas udostępniono ponad 41 000 archiwalnych planów.</p>\n\n<p>Kontynuujemy także tradycję regularnego organizowania wystaw czasowych, poświęconych historii architektury oraz jej współczesnym tendencjom. W ostatnich latach w Polsce, podobnie jak w większości innych krajów, powstaje coraz więcej centrów architektury, które koncentrują się na dyskusji o problemach architektury współczesnej. Współpracujemy z nimi, ale naszą rolą jest przede wszystkim upowszechnianie wiedzy o dawnej i nowszej historii architektury. Nadal skupiamy się na badaniu i prezentacji tradycji budowlanych Wrocławia, zarówno przygotowując wystawy i publikacje, jak też współpracując z władzami miejskimi przy ochronie i rewitalizacji architektonicznego dziedzictwa miasta. Na przykład obszerna książka poświęcona słynnej wystawie Werkbundu z 1929 roku Wohnung und Werkraum Ausstellung (WuWA – Mieszkanie i miejsce pracy), która została opublikowana przez Muzeum Architektury, w pewnym stopniu przyczyniła się do podjęcia decyzji o renowacji tego unikatowego kompleksu.</p>\n\n<p>Muzeum realizuje programy i wydarzenia adresowane do profesjonalnych architektów, historyków i szerokiej publiczności. Trzeba tu wspomnieć o cyklu Galeria Jednego Projektu, w którego ramach raz w miesiącu odbywa się prezentacja i dyskusja nad wybranym projektem architektonicznym będącym w fazie realizacji. Do najmłodszej generacji architektów adresowany jest cykl o nazwie Archi-box. Alternatywna przestrzeń poszukiwań, w którym architekci są zapraszani do konstruowania instalacji wyjaśniających ich metody i filozofię pracy.</p>\n\n<p>Muzealny Dział Edukacji organizuje warsztaty, wykłady i inne wydarzenia dla dzieci, dorosłych i seniorów. Niektóre z nich są związane z trwającymi wystawami czasowymi, inne zaś poświęcone bardziej ogólnym problemom architektury, wzornictwa czy innych dziedzin twórczości związanych z architekturą.</p>\n\n<p>Muzeum Architektury dysponuje największą we Wrocławiu przestrzenią wystawienniczą i często gości w niej wystawy i wydarzenia przygotowywane we współpracy z innymi instytucjami kultury w mieście. W roku 1970 właśnie w Muzeum Architektury odbyła się wystawa prezentująca prace przygotowane na legendarne dziś Sympozjum Plastyczne Wrocław ’70, zorganizowane z okazji 25. rocznicy powrotu Ziem Zachodnich i Północnych do Macierzy. Do wydarzeń, które kształtowały opinię o Wrocławiu jako mieście otwartym na awangardowe eksperymenty artystyczne, należały też wielkie Wystawy Architektury Intencjonalnej TERRA I i TERRA II, zorganizowane w Muzeum Architektury przez znanego wrocławskiego architekta Stefana Müllera. We współpracy z wrocławską Akademią Sztuk Pięknych muzeum regularnie prezentowało kolejne odsłony Triennale Rysunku, a ostatnio wielką wystawę prac Alessandro Mendiniego, przygotowaną w związku z nadaniem mu tytułu doctora honoris causa tej uczelni.</p>\n\n<p>Muzeum Architektury weźmie także czynny udział w wydarzeniach roku 2016, kiedy Wrocław będzie piastował tytuł Europejskiej Stolicy Kultury. Zostaną wówczas zaprezentowane wystawy poświęcone historii najważniejszej europejskiej nagrody architektonicznej – Mies van der Rohe Award i obiekty nagrodzone w roku 2015, a także wystawy opowiadające o twórczości Jadwigi Grabowskiej-Hawrylak, międzywojennej architekturze Lwowa i – stanowiąca rodzaj podsumowania naszych dotychczasowych badań –wystawa poświęcona architekturze Wrocławia na przestrzeni XX wieku.</p>\n\n<p>Jolanta Gromadzka, Jerzy Ilkosz, Ewa Jasieńko</p>\n\n<p>Patronat honorowy nad jubileuszem 50-lecia Muzeum Architektury we Wrocławiu objęli:</p>\n\n<p>Minister Kultury i Dziedzictwa Narodowego prof. Małgorzata Omilanowska</p>\n\n<p>Prezydent Miasta Wrocławia Rafał Dutkiewicz</p>\n', 1552);
INSERT INTO`tbl_entries_data_3` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (20, 4, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit-sed-do-eiusmod-tempor-incididunt-ut-labore-et-dolore-magna-aliqua-ut-enim-ad-minim-veniam-quis-nostrud-exercitation-ullamco-laboris-nisi-ut-aliquip-ex-ea-commodo-consequat-duis-aute-irure-dolor-in-r', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n\r\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>\n', 198, NULL, NULL, NULL, 0, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit-sed-do-eiusmod-tempor-incididunt-ut-labore-et-dolore-magna-aliqua-ut-enim-ad-minim-veniam-quis-nostrud-exercitation-ullamco-laboris-nisi-ut-aliquip-ex-ea-commodo-consequat-duis-aute-irure-dolor-in-r', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n\r\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n\n<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>\n', 198);
INSERT INTO`tbl_entries_data_3` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (49, 3, 'o-wtstawie-architektoniczne-rzemioslo-artystyczne-od-xii-do-xx-wieku-to-jedyna-ekspozycja-w-polsce-ktora-gromadzi-wyroby-wielu-dziedzin-rzemiosla-artystycznego-pod-katem-ich-powiazania-z-architektura-obejrzec-tu-mozna-wytwory-szklarstwa-i-witrazownictw', '# O wtstawie\r\n\r\n*Architektoniczne rzemiosło artystyczne od XII do XX wieku* to jedyna ekspozycja w Polsce, która gromadzi wyroby wielu dziedzin rzemiosła  artystycznego pod kątem ich powiązania z architekturą. [Obejrzeć tu można wytwory szklarstwa](http://#) i witrażownictwa, kaflarstwa i sztukatorstwa, rzemiosł kowalskich i ślusarskich, odlewnictwa, wyroby stolarskie i kamieniarskie, a także drewniane stropy i malarstwo plafonowe. Chronologiczny układ eksponatów pozwala prześledzić różnorodność form i przemiany stylowe zachodzące przez wieki, od wczesnego średniowiecza aż do 1 połowy XX w. Obiekty pochodzą nie tylko z terenu Śląska, ale także z innych regionów Polski i Europy. \r\n\r\n## Nagroda\r\n\r\nWystawa od  17 lat cieszy się niesłabnącym powodzeniem wśród zwiedzającyh. W 1998 roku została wyróżniona **SYBILLĄ** – ministerialną nagrodą na Wydarzenie Muzealne Roku. Dzięki uzyskanej w 2015 roku dotacji możemy  odnowić ekspozycję, częściowo przearanżować ją i wzbogacić o nowe eksponaty, m.in. piec w stylu art deco i dwa średniowieczne witraże.\r\n\r\n## Wernisaż\r\n\r\nOtwarcie wystawy w nowej odsłonie odbyło się 5 listopada 2015 roku.\r\n\r\n## Patroni\r\n\r\nModernizacja wystawy jest współfinansowana ze środków Ministerstwa Kultury i Dziedzictwa Narodowego.', '<h1>O wtstawie</h1>\n\n<p><em>Architektoniczne rzemiosło artystyczne od XII do XX wieku</em> to jedyna ekspozycja w Polsce, która gromadzi wyroby wielu dziedzin rzemiosła  artystycznego pod kątem ich powiązania z architekturą. <a href=\"http://#\">Obejrzeć tu można wytwory szklarstwa</a> i witrażownictwa, kaflarstwa i sztukatorstwa, rzemiosł kowalskich i ślusarskich, odlewnictwa, wyroby stolarskie i kamieniarskie, a także drewniane stropy i malarstwo plafonowe. Chronologiczny układ eksponatów pozwala prześledzić różnorodność form i przemiany stylowe zachodzące przez wieki, od wczesnego średniowiecza aż do 1 połowy XX w. Obiekty pochodzą nie tylko z terenu Śląska, ale także z innych regionów Polski i Europy.</p>\n\n<h2>Nagroda</h2>\n\n<p>Wystawa od  17 lat cieszy się niesłabnącym powodzeniem wśród zwiedzającyh. W 1998 roku została wyróżniona <strong>SYBILLĄ</strong> – ministerialną nagrodą na Wydarzenie Muzealne Roku. Dzięki uzyskanej w 2015 roku dotacji możemy  odnowić ekspozycję, częściowo przearanżować ją i wzbogacić o nowe eksponaty, m.in. piec w stylu art deco i dwa średniowieczne witraże.</p>\n\n<h2>Wernisaż</h2>\n\n<p>Otwarcie wystawy w nowej odsłonie odbyło się 5 listopada 2015 roku.</p>\n\n<h2>Patroni</h2>\n\n<p>Modernizacja wystawy jest współfinansowana ze środków Ministerstwa Kultury i Dziedzictwa Narodowego.</p>\n', 159, NULL, NULL, NULL, 0, 'o-wtstawie-architektoniczne-rzemioslo-artystyczne-od-xii-do-xx-wieku-to-jedyna-ekspozycja-w-polsce-ktora-gromadzi-wyroby-wielu-dziedzin-rzemiosla-artystycznego-pod-katem-ich-powiazania-z-architektura-obejrzec-tu-mozna-wytwory-szklarstwa-i-witrazownictw', '# O wtstawie\r\n\r\n*Architektoniczne rzemiosło artystyczne od XII do XX wieku* to jedyna ekspozycja w Polsce, która gromadzi wyroby wielu dziedzin rzemiosła  artystycznego pod kątem ich powiązania z architekturą. [Obejrzeć tu można wytwory szklarstwa](http://#) i witrażownictwa, kaflarstwa i sztukatorstwa, rzemiosł kowalskich i ślusarskich, odlewnictwa, wyroby stolarskie i kamieniarskie, a także drewniane stropy i malarstwo plafonowe. Chronologiczny układ eksponatów pozwala prześledzić różnorodność form i przemiany stylowe zachodzące przez wieki, od wczesnego średniowiecza aż do 1 połowy XX w. Obiekty pochodzą nie tylko z terenu Śląska, ale także z innych regionów Polski i Europy. \r\n\r\n## Nagroda\r\n\r\nWystawa od  17 lat cieszy się niesłabnącym powodzeniem wśród zwiedzającyh. W 1998 roku została wyróżniona **SYBILLĄ** – ministerialną nagrodą na Wydarzenie Muzealne Roku. Dzięki uzyskanej w 2015 roku dotacji możemy  odnowić ekspozycję, częściowo przearanżować ją i wzbogacić o nowe eksponaty, m.in. piec w stylu art deco i dwa średniowieczne witraże.\r\n\r\n## Wernisaż\r\n\r\nOtwarcie wystawy w nowej odsłonie odbyło się 5 listopada 2015 roku.\r\n\r\n## Patroni\r\n\r\nModernizacja wystawy jest współfinansowana ze środków Ministerstwa Kultury i Dziedzictwa Narodowego.', '<h1>O wtstawie</h1>\n\n<p><em>Architektoniczne rzemiosło artystyczne od XII do XX wieku</em> to jedyna ekspozycja w Polsce, która gromadzi wyroby wielu dziedzin rzemiosła  artystycznego pod kątem ich powiązania z architekturą. <a href=\"http://#\">Obejrzeć tu można wytwory szklarstwa</a> i witrażownictwa, kaflarstwa i sztukatorstwa, rzemiosł kowalskich i ślusarskich, odlewnictwa, wyroby stolarskie i kamieniarskie, a także drewniane stropy i malarstwo plafonowe. Chronologiczny układ eksponatów pozwala prześledzić różnorodność form i przemiany stylowe zachodzące przez wieki, od wczesnego średniowiecza aż do 1 połowy XX w. Obiekty pochodzą nie tylko z terenu Śląska, ale także z innych regionów Polski i Europy.</p>\n\n<h2>Nagroda</h2>\n\n<p>Wystawa od  17 lat cieszy się niesłabnącym powodzeniem wśród zwiedzającyh. W 1998 roku została wyróżniona <strong>SYBILLĄ</strong> – ministerialną nagrodą na Wydarzenie Muzealne Roku. Dzięki uzyskanej w 2015 roku dotacji możemy  odnowić ekspozycję, częściowo przearanżować ją i wzbogacić o nowe eksponaty, m.in. piec w stylu art deco i dwa średniowieczne witraże.</p>\n\n<h2>Wernisaż</h2>\n\n<p>Otwarcie wystawy w nowej odsłonie odbyło się 5 listopada 2015 roku.</p>\n\n<h2>Patroni</h2>\n\n<p>Modernizacja wystawy jest współfinansowana ze środków Ministerstwa Kultury i Dziedzictwa Narodowego.</p>\n', 159);
INSERT INTO`tbl_entries_data_3` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (48, 19, 'ikony-wspolczesnej-architektury-dziela-najlepszych-architektow-i-biur-projektowych-z-calej-europy-realizacje-ktore-trwale-zmienily-oblicza-dzisiejszych-miast-ponad-3-tysiace-takich-budynkow-zaprezentuje-wystawa-made-in-europe-inaugurujaca-program-europe', 'Ikony współczesnej architektury, dzieła najlepszych architektów i biur projektowych z całej Europy, realizacje, które trwale zmieniły oblicza dzisiejszych miast.  Ponad 3 tysiące takich budynków zaprezentuje wystawa Made in Europe inaugurująca program Europejskiej Stolicy Kultury Wrocław 2016, którą 16 stycznia 2016 roku otworzy Muzeum Architektury we Wrocławiu.\r\n\r\nMade in Europe to wyjątkowa opowieść o ostatnich 25 latach europejskiej architektury. Wystawa podsumowuje historię nagrody Mies van der Rohe Award, najważniejszego wyróżnienia Unii Europejskiej w dziedzinie architektury współczesnej, przyznawanej od 1988 roku przez Fundację Mies van der Rohe w Barcelonie. W tym konkursie nie ma ograniczeń w zakresie skali lub funkcji obiektów. Od wielkich założeń architektonicznych do kameralnych realizacji – wszystkie dotychczasowe edycje uwzględniały domy prywatne, budynki użyteczności publicznej, muzea i instytucje kulturalne, obiekty sportowe, założenia służące edukacji i ochronie zdrowia, a także utrzymane w wielkiej skali projekty infrastruktury i systemów transportowych. Ich wspólnym mianownikiem jest to, że wszystkie przyczyniają się do kształtowania miast oraz są dowodem istotnego wkładu europejskich specjalistów w rozwój najnowszych rozwiązań architektonicznych, technologii i ekologii.\r\n\r\nWystawa w imponujący sposób zestawia ze sobą blisko 150 modeli budynków wyróżnionych nagrodą główną, nagrodą specjalną dla młodych architektów i realizacji wpisanych na tak zwaną „krótką listę” kwalifikującą do finału, oraz wizualizacje około 3000 projektów zgłoszonych do nagrody od 1988 roku. Wśród nich są tak znane obiekty, jak słynna stacja kolejowa Waterloo w Londynie zaprojektowana przez biuro Nicolas Grimshaw & Partners i nagrodzona głównym laurem w 1994 roku, charakterystyczna obła bryła londyńskiego wieżowca 30 St Mary Axe zaprojektowana przez Normana Fostera, finalistka edycji w 2005 roku, hiszpańskie Muzeum Sztuki Współczesnej MUSAC – projekt zespołu Mansilla + Tunon Arquitectos wyróżnione główną nagrodą w 2007 roku, nowatorski budynek Norweskiej Opery Narodowej i Baletu w Oslo, zaprojektowany przez biuro Snohetta i nagrodzony w 2009 roku, czy też hala koncertowa Harpa w Reykjaviku – nagrodzony w 2013 roku projekt Hennig Larsen Architects. W zestawieniu modeli znajdują się też dwie polskie realizacje zakwalifikowane do ścisłego finału nagrody w 2013 roku – żelbetowa konstrukcja przystanku tramwajowo-kolejowego przy Stadionie Miejskim we Wrocławiu, zaprojektowana przez Zbigniewa Maćkowa (Pracownia Projektowa Maćków), a także gmach Centrum Informacji Naukowej i Biblioteki Akademickiej w Katowicach autorstwa koszalińskiej pracowni HS99. \r\n\r\nWszystkie prace nominowane do konkursu w ciągu minionych 25 lat są prezentowane w postaci dokumentacji projektowej zorganizowanej w obszerną bazę danych – szkiców, zdjęć, planów, map i informacji, eksponowanych na 160 metrach materiału rozpiętego na metalowej konstrukcji. Komentarzem do wystawy są także filmy zrealizowane przez Fundację Mies van der Rohe, które stanowią rodzaj multimedialnego przewodnika po ekspozycji: pokazują proces jej tworzenia, selekcji materiałów w archiwum fundacji oraz koncepcję odtworzenia osi czasu, na której umiejscowiono wszystkie projekty. Prezentację uzupełniają wywiady   \r\nz laureatami nagrody głównej i specjalnej, wypowiedzi organizatorów oraz zestawienie statystyczne przedstawiające geograficzne rozmieszczenie wszystkich zgłaszanych projektów.\r\n\r\nMade in Europe to jedno z głównych wydarzeń Weekendu Otwarcia Europejskiej Stolicy Kultury Wrocław 2016 (15 – 17 stycznia 2016 roku). Dotychczas wystawa prezentowana była jedynie podczas ostatniego Biennale w Wenecji w Palazzo Michiel oraz w Szanghaju w ramach programu Shanghai Urban Space Art Season 2015 (SUSAS). Częścią wrocławskiej odsłony Made in Europe jest prezentacja projektu „European Identity”, stanowiącego próbę odpowiedzi na pytanie o tożsamość europejskiej architektury. Włączając się w towarzyszącą projektowi debatę, zapraszamy również na spotkania i dyskusje z projektantami wyróżnionych w konkursie obiektów zrealizowanych w Polsce.\r\n\r\n# Mies van der Rohe Award 2015\r\n\r\nWystawę Made in Europe, obejmującą laureatów nagrody od 1988 do 2013 roku, uzupełnia prezentacja ubiegłorocznych zwycięzców Mies van der Rohe Award 2015. Ekspozycja przedstawia wybór najważniejszych realizacji europejskiej architektury ostatnich dwóch lat. To szczególna edycja, ponieważ na jej „krótkiej liście” wyróżniono aż trzy projekty zrealizowane w Polsce – kompleks nowego Muzeum Śląskiego w Katowicach zaprojektowany w austriackiej pracowni Riegler Riewe Architekten, budynek Muzeum Historii Żydów Polskich Polin w Warszawie zrealizowany według projektu fińskiego architekta Rainera Mahlamäkiego oraz Filharmonię Szczecińską, dzieło duetu architektów z barcelońskiego biura Veiga/Barozzi – Alberto Veiga z Hiszpanii i Fabrizio Barozzi z Włoch, która jako pierwszy w historii polski budynek, otrzymała nagrodę główną konkursu.\r\n\r\nWystawom prezentowanym w Muzeum Architektury we Wrocławiu od 16 stycznia do 27 marca 2016 roku towarzyszyć będzie bogaty program spotkań z architektami oraz debat poświęconych kondycji współczesnej europejskiej architektury.\r\n\r\n### Made in Europe. 25 lat nagrody Unii Europejskiej w dziedzinie architektury współczesnej – Mies van der Rohe Award\r\nwernisaż 16 stycznia 2016 r. o godzinie 12.00 I wystawa czynna od 16 stycznia do 13 marca 2016 r.\r\n\r\n### Nagroda Unii Europejskiej w dziedzinie architektury współczesnej – Mies van der Rohe Award 2015\r\nwernisaż 15 lutego 2016 r. I wystawa czynna od 15 lutego do 27 marca 2016 r.', '<p>Ikony współczesnej architektury, dzieła najlepszych architektów i biur projektowych z całej Europy, realizacje, które trwale zmieniły oblicza dzisiejszych miast.  Ponad 3 tysiące takich budynków zaprezentuje wystawa Made in Europe inaugurująca program Europejskiej Stolicy Kultury Wrocław 2016, którą 16 stycznia 2016 roku otworzy Muzeum Architektury we Wrocławiu.</p>\n\n<p>Made in Europe to wyjątkowa opowieść o ostatnich 25 latach europejskiej architektury. Wystawa podsumowuje historię nagrody Mies van der Rohe Award, najważniejszego wyróżnienia Unii Europejskiej w dziedzinie architektury współczesnej, przyznawanej od 1988 roku przez Fundację Mies van der Rohe w Barcelonie. W tym konkursie nie ma ograniczeń w zakresie skali lub funkcji obiektów. Od wielkich założeń architektonicznych do kameralnych realizacji – wszystkie dotychczasowe edycje uwzględniały domy prywatne, budynki użyteczności publicznej, muzea i instytucje kulturalne, obiekty sportowe, założenia służące edukacji i ochronie zdrowia, a także utrzymane w wielkiej skali projekty infrastruktury i systemów transportowych. Ich wspólnym mianownikiem jest to, że wszystkie przyczyniają się do kształtowania miast oraz są dowodem istotnego wkładu europejskich specjalistów w rozwój najnowszych rozwiązań architektonicznych, technologii i ekologii.</p>\n\n<p>Wystawa w imponujący sposób zestawia ze sobą blisko 150 modeli budynków wyróżnionych nagrodą główną, nagrodą specjalną dla młodych architektów i realizacji wpisanych na tak zwaną „krótką listę” kwalifikującą do finału, oraz wizualizacje około 3000 projektów zgłoszonych do nagrody od 1988 roku. Wśród nich są tak znane obiekty, jak słynna stacja kolejowa Waterloo w Londynie zaprojektowana przez biuro Nicolas Grimshaw &amp; Partners i nagrodzona głównym laurem w 1994 roku, charakterystyczna obła bryła londyńskiego wieżowca 30 St Mary Axe zaprojektowana przez Normana Fostera, finalistka edycji w 2005 roku, hiszpańskie Muzeum Sztuki Współczesnej MUSAC – projekt zespołu Mansilla + Tunon Arquitectos wyróżnione główną nagrodą w 2007 roku, nowatorski budynek Norweskiej Opery Narodowej i Baletu w Oslo, zaprojektowany przez biuro Snohetta i nagrodzony w 2009 roku, czy też hala koncertowa Harpa w Reykjaviku – nagrodzony w 2013 roku projekt Hennig Larsen Architects. W zestawieniu modeli znajdują się też dwie polskie realizacje zakwalifikowane do ścisłego finału nagrody w 2013 roku – żelbetowa konstrukcja przystanku tramwajowo-kolejowego przy Stadionie Miejskim we Wrocławiu, zaprojektowana przez Zbigniewa Maćkowa (Pracownia Projektowa Maćków), a także gmach Centrum Informacji Naukowej i Biblioteki Akademickiej w Katowicach autorstwa koszalińskiej pracowni HS99.</p>\n\n<p>Wszystkie prace nominowane do konkursu w ciągu minionych 25 lat są prezentowane w postaci dokumentacji projektowej zorganizowanej w obszerną bazę danych – szkiców, zdjęć, planów, map i informacji, eksponowanych na 160 metrach materiału rozpiętego na metalowej konstrukcji. Komentarzem do wystawy są także filmy zrealizowane przez Fundację Mies van der Rohe, które stanowią rodzaj multimedialnego przewodnika po ekspozycji: pokazują proces jej tworzenia, selekcji materiałów w archiwum fundacji oraz koncepcję odtworzenia osi czasu, na której umiejscowiono wszystkie projekty. Prezentację uzupełniają wywiady<br />\nz laureatami nagrody głównej i specjalnej, wypowiedzi organizatorów oraz zestawienie statystyczne przedstawiające geograficzne rozmieszczenie wszystkich zgłaszanych projektów.</p>\n\n<p>Made in Europe to jedno z głównych wydarzeń Weekendu Otwarcia Europejskiej Stolicy Kultury Wrocław 2016 (15 – 17 stycznia 2016 roku). Dotychczas wystawa prezentowana była jedynie podczas ostatniego Biennale w Wenecji w Palazzo Michiel oraz w Szanghaju w ramach programu Shanghai Urban Space Art Season 2015 (SUSAS). Częścią wrocławskiej odsłony Made in Europe jest prezentacja projektu „European Identity”, stanowiącego próbę odpowiedzi na pytanie o tożsamość europejskiej architektury. Włączając się w towarzyszącą projektowi debatę, zapraszamy również na spotkania i dyskusje z projektantami wyróżnionych w konkursie obiektów zrealizowanych w Polsce.</p>\n\n<h1>Mies van der Rohe Award 2015</h1>\n\n<p>Wystawę Made in Europe, obejmującą laureatów nagrody od 1988 do 2013 roku, uzupełnia prezentacja ubiegłorocznych zwycięzców Mies van der Rohe Award 2015. Ekspozycja przedstawia wybór najważniejszych realizacji europejskiej architektury ostatnich dwóch lat. To szczególna edycja, ponieważ na jej „krótkiej liście” wyróżniono aż trzy projekty zrealizowane w Polsce – kompleks nowego Muzeum Śląskiego w Katowicach zaprojektowany w austriackiej pracowni Riegler Riewe Architekten, budynek Muzeum Historii Żydów Polskich Polin w Warszawie zrealizowany według projektu fińskiego architekta Rainera Mahlamäkiego oraz Filharmonię Szczecińską, dzieło duetu architektów z barcelońskiego biura Veiga/Barozzi – Alberto Veiga z Hiszpanii i Fabrizio Barozzi z Włoch, która jako pierwszy w historii polski budynek, otrzymała nagrodę główną konkursu.</p>\n\n<p>Wystawom prezentowanym w Muzeum Architektury we Wrocławiu od 16 stycznia do 27 marca 2016 roku towarzyszyć będzie bogaty program spotkań z architektami oraz debat poświęconych kondycji współczesnej europejskiej architektury.</p>\n\n<h3>Made in Europe. 25 lat nagrody Unii Europejskiej w dziedzinie architektury współczesnej – Mies van der Rohe Award</h3>\n\n<p>wernisaż 16 stycznia 2016 r. o godzinie 12.00 I wystawa czynna od 16 stycznia do 13 marca 2016 r.</p>\n\n<h3>Nagroda Unii Europejskiej w dziedzinie architektury współczesnej – Mies van der Rohe Award 2015</h3>\n\n<p>wernisaż 15 lutego 2016 r. I wystawa czynna od 15 lutego do 27 marca 2016 r.</p>\n', 691, NULL, NULL, NULL, 0, 'ikony-wspolczesnej-architektury-dziela-najlepszych-architektow-i-biur-projektowych-z-calej-europy-realizacje-ktore-trwale-zmienily-oblicza-dzisiejszych-miast-ponad-3-tysiace-takich-budynkow-zaprezentuje-wystawa-made-in-europe-inaugurujaca-program-europe', 'Ikony współczesnej architektury, dzieła najlepszych architektów i biur projektowych z całej Europy, realizacje, które trwale zmieniły oblicza dzisiejszych miast.  Ponad 3 tysiące takich budynków zaprezentuje wystawa Made in Europe inaugurująca program Europejskiej Stolicy Kultury Wrocław 2016, którą 16 stycznia 2016 roku otworzy Muzeum Architektury we Wrocławiu.\r\n\r\nMade in Europe to wyjątkowa opowieść o ostatnich 25 latach europejskiej architektury. Wystawa podsumowuje historię nagrody Mies van der Rohe Award, najważniejszego wyróżnienia Unii Europejskiej w dziedzinie architektury współczesnej, przyznawanej od 1988 roku przez Fundację Mies van der Rohe w Barcelonie. W tym konkursie nie ma ograniczeń w zakresie skali lub funkcji obiektów. Od wielkich założeń architektonicznych do kameralnych realizacji – wszystkie dotychczasowe edycje uwzględniały domy prywatne, budynki użyteczności publicznej, muzea i instytucje kulturalne, obiekty sportowe, założenia służące edukacji i ochronie zdrowia, a także utrzymane w wielkiej skali projekty infrastruktury i systemów transportowych. Ich wspólnym mianownikiem jest to, że wszystkie przyczyniają się do kształtowania miast oraz są dowodem istotnego wkładu europejskich specjalistów w rozwój najnowszych rozwiązań architektonicznych, technologii i ekologii.\r\n\r\nWystawa w imponujący sposób zestawia ze sobą blisko 150 modeli budynków wyróżnionych nagrodą główną, nagrodą specjalną dla młodych architektów i realizacji wpisanych na tak zwaną „krótką listę” kwalifikującą do finału, oraz wizualizacje około 3000 projektów zgłoszonych do nagrody od 1988 roku. Wśród nich są tak znane obiekty, jak słynna stacja kolejowa Waterloo w Londynie zaprojektowana przez biuro Nicolas Grimshaw & Partners i nagrodzona głównym laurem w 1994 roku, charakterystyczna obła bryła londyńskiego wieżowca 30 St Mary Axe zaprojektowana przez Normana Fostera, finalistka edycji w 2005 roku, hiszpańskie Muzeum Sztuki Współczesnej MUSAC – projekt zespołu Mansilla + Tunon Arquitectos wyróżnione główną nagrodą w 2007 roku, nowatorski budynek Norweskiej Opery Narodowej i Baletu w Oslo, zaprojektowany przez biuro Snohetta i nagrodzony w 2009 roku, czy też hala koncertowa Harpa w Reykjaviku – nagrodzony w 2013 roku projekt Hennig Larsen Architects. W zestawieniu modeli znajdują się też dwie polskie realizacje zakwalifikowane do ścisłego finału nagrody w 2013 roku – żelbetowa konstrukcja przystanku tramwajowo-kolejowego przy Stadionie Miejskim we Wrocławiu, zaprojektowana przez Zbigniewa Maćkowa (Pracownia Projektowa Maćków), a także gmach Centrum Informacji Naukowej i Biblioteki Akademickiej w Katowicach autorstwa koszalińskiej pracowni HS99. \r\n\r\nWszystkie prace nominowane do konkursu w ciągu minionych 25 lat są prezentowane w postaci dokumentacji projektowej zorganizowanej w obszerną bazę danych – szkiców, zdjęć, planów, map i informacji, eksponowanych na 160 metrach materiału rozpiętego na metalowej konstrukcji. Komentarzem do wystawy są także filmy zrealizowane przez Fundację Mies van der Rohe, które stanowią rodzaj multimedialnego przewodnika po ekspozycji: pokazują proces jej tworzenia, selekcji materiałów w archiwum fundacji oraz koncepcję odtworzenia osi czasu, na której umiejscowiono wszystkie projekty. Prezentację uzupełniają wywiady   \r\nz laureatami nagrody głównej i specjalnej, wypowiedzi organizatorów oraz zestawienie statystyczne przedstawiające geograficzne rozmieszczenie wszystkich zgłaszanych projektów.\r\n\r\nMade in Europe to jedno z głównych wydarzeń Weekendu Otwarcia Europejskiej Stolicy Kultury Wrocław 2016 (15 – 17 stycznia 2016 roku). Dotychczas wystawa prezentowana była jedynie podczas ostatniego Biennale w Wenecji w Palazzo Michiel oraz w Szanghaju w ramach programu Shanghai Urban Space Art Season 2015 (SUSAS). Częścią wrocławskiej odsłony Made in Europe jest prezentacja projektu „European Identity”, stanowiącego próbę odpowiedzi na pytanie o tożsamość europejskiej architektury. Włączając się w towarzyszącą projektowi debatę, zapraszamy również na spotkania i dyskusje z projektantami wyróżnionych w konkursie obiektów zrealizowanych w Polsce.\r\n\r\n# Mies van der Rohe Award 2015\r\n\r\nWystawę Made in Europe, obejmującą laureatów nagrody od 1988 do 2013 roku, uzupełnia prezentacja ubiegłorocznych zwycięzców Mies van der Rohe Award 2015. Ekspozycja przedstawia wybór najważniejszych realizacji europejskiej architektury ostatnich dwóch lat. To szczególna edycja, ponieważ na jej „krótkiej liście” wyróżniono aż trzy projekty zrealizowane w Polsce – kompleks nowego Muzeum Śląskiego w Katowicach zaprojektowany w austriackiej pracowni Riegler Riewe Architekten, budynek Muzeum Historii Żydów Polskich Polin w Warszawie zrealizowany według projektu fińskiego architekta Rainera Mahlamäkiego oraz Filharmonię Szczecińską, dzieło duetu architektów z barcelońskiego biura Veiga/Barozzi – Alberto Veiga z Hiszpanii i Fabrizio Barozzi z Włoch, która jako pierwszy w historii polski budynek, otrzymała nagrodę główną konkursu.\r\n\r\nWystawom prezentowanym w Muzeum Architektury we Wrocławiu od 16 stycznia do 27 marca 2016 roku towarzyszyć będzie bogaty program spotkań z architektami oraz debat poświęconych kondycji współczesnej europejskiej architektury.\r\n\r\n### Made in Europe. 25 lat nagrody Unii Europejskiej w dziedzinie architektury współczesnej – Mies van der Rohe Award\r\nwernisaż 16 stycznia 2016 r. o godzinie 12.00 I wystawa czynna od 16 stycznia do 13 marca 2016 r.\r\n\r\n### Nagroda Unii Europejskiej w dziedzinie architektury współczesnej – Mies van der Rohe Award 2015\r\nwernisaż 15 lutego 2016 r. I wystawa czynna od 15 lutego do 27 marca 2016 r.', '<p>Ikony współczesnej architektury, dzieła najlepszych architektów i biur projektowych z całej Europy, realizacje, które trwale zmieniły oblicza dzisiejszych miast.  Ponad 3 tysiące takich budynków zaprezentuje wystawa Made in Europe inaugurująca program Europejskiej Stolicy Kultury Wrocław 2016, którą 16 stycznia 2016 roku otworzy Muzeum Architektury we Wrocławiu.</p>\n\n<p>Made in Europe to wyjątkowa opowieść o ostatnich 25 latach europejskiej architektury. Wystawa podsumowuje historię nagrody Mies van der Rohe Award, najważniejszego wyróżnienia Unii Europejskiej w dziedzinie architektury współczesnej, przyznawanej od 1988 roku przez Fundację Mies van der Rohe w Barcelonie. W tym konkursie nie ma ograniczeń w zakresie skali lub funkcji obiektów. Od wielkich założeń architektonicznych do kameralnych realizacji – wszystkie dotychczasowe edycje uwzględniały domy prywatne, budynki użyteczności publicznej, muzea i instytucje kulturalne, obiekty sportowe, założenia służące edukacji i ochronie zdrowia, a także utrzymane w wielkiej skali projekty infrastruktury i systemów transportowych. Ich wspólnym mianownikiem jest to, że wszystkie przyczyniają się do kształtowania miast oraz są dowodem istotnego wkładu europejskich specjalistów w rozwój najnowszych rozwiązań architektonicznych, technologii i ekologii.</p>\n\n<p>Wystawa w imponujący sposób zestawia ze sobą blisko 150 modeli budynków wyróżnionych nagrodą główną, nagrodą specjalną dla młodych architektów i realizacji wpisanych na tak zwaną „krótką listę” kwalifikującą do finału, oraz wizualizacje około 3000 projektów zgłoszonych do nagrody od 1988 roku. Wśród nich są tak znane obiekty, jak słynna stacja kolejowa Waterloo w Londynie zaprojektowana przez biuro Nicolas Grimshaw &amp; Partners i nagrodzona głównym laurem w 1994 roku, charakterystyczna obła bryła londyńskiego wieżowca 30 St Mary Axe zaprojektowana przez Normana Fostera, finalistka edycji w 2005 roku, hiszpańskie Muzeum Sztuki Współczesnej MUSAC – projekt zespołu Mansilla + Tunon Arquitectos wyróżnione główną nagrodą w 2007 roku, nowatorski budynek Norweskiej Opery Narodowej i Baletu w Oslo, zaprojektowany przez biuro Snohetta i nagrodzony w 2009 roku, czy też hala koncertowa Harpa w Reykjaviku – nagrodzony w 2013 roku projekt Hennig Larsen Architects. W zestawieniu modeli znajdują się też dwie polskie realizacje zakwalifikowane do ścisłego finału nagrody w 2013 roku – żelbetowa konstrukcja przystanku tramwajowo-kolejowego przy Stadionie Miejskim we Wrocławiu, zaprojektowana przez Zbigniewa Maćkowa (Pracownia Projektowa Maćków), a także gmach Centrum Informacji Naukowej i Biblioteki Akademickiej w Katowicach autorstwa koszalińskiej pracowni HS99.</p>\n\n<p>Wszystkie prace nominowane do konkursu w ciągu minionych 25 lat są prezentowane w postaci dokumentacji projektowej zorganizowanej w obszerną bazę danych – szkiców, zdjęć, planów, map i informacji, eksponowanych na 160 metrach materiału rozpiętego na metalowej konstrukcji. Komentarzem do wystawy są także filmy zrealizowane przez Fundację Mies van der Rohe, które stanowią rodzaj multimedialnego przewodnika po ekspozycji: pokazują proces jej tworzenia, selekcji materiałów w archiwum fundacji oraz koncepcję odtworzenia osi czasu, na której umiejscowiono wszystkie projekty. Prezentację uzupełniają wywiady<br />\nz laureatami nagrody głównej i specjalnej, wypowiedzi organizatorów oraz zestawienie statystyczne przedstawiające geograficzne rozmieszczenie wszystkich zgłaszanych projektów.</p>\n\n<p>Made in Europe to jedno z głównych wydarzeń Weekendu Otwarcia Europejskiej Stolicy Kultury Wrocław 2016 (15 – 17 stycznia 2016 roku). Dotychczas wystawa prezentowana była jedynie podczas ostatniego Biennale w Wenecji w Palazzo Michiel oraz w Szanghaju w ramach programu Shanghai Urban Space Art Season 2015 (SUSAS). Częścią wrocławskiej odsłony Made in Europe jest prezentacja projektu „European Identity”, stanowiącego próbę odpowiedzi na pytanie o tożsamość europejskiej architektury. Włączając się w towarzyszącą projektowi debatę, zapraszamy również na spotkania i dyskusje z projektantami wyróżnionych w konkursie obiektów zrealizowanych w Polsce.</p>\n\n<h1>Mies van der Rohe Award 2015</h1>\n\n<p>Wystawę Made in Europe, obejmującą laureatów nagrody od 1988 do 2013 roku, uzupełnia prezentacja ubiegłorocznych zwycięzców Mies van der Rohe Award 2015. Ekspozycja przedstawia wybór najważniejszych realizacji europejskiej architektury ostatnich dwóch lat. To szczególna edycja, ponieważ na jej „krótkiej liście” wyróżniono aż trzy projekty zrealizowane w Polsce – kompleks nowego Muzeum Śląskiego w Katowicach zaprojektowany w austriackiej pracowni Riegler Riewe Architekten, budynek Muzeum Historii Żydów Polskich Polin w Warszawie zrealizowany według projektu fińskiego architekta Rainera Mahlamäkiego oraz Filharmonię Szczecińską, dzieło duetu architektów z barcelońskiego biura Veiga/Barozzi – Alberto Veiga z Hiszpanii i Fabrizio Barozzi z Włoch, która jako pierwszy w historii polski budynek, otrzymała nagrodę główną konkursu.</p>\n\n<p>Wystawom prezentowanym w Muzeum Architektury we Wrocławiu od 16 stycznia do 27 marca 2016 roku towarzyszyć będzie bogaty program spotkań z architektami oraz debat poświęconych kondycji współczesnej europejskiej architektury.</p>\n\n<h3>Made in Europe. 25 lat nagrody Unii Europejskiej w dziedzinie architektury współczesnej – Mies van der Rohe Award</h3>\n\n<p>wernisaż 16 stycznia 2016 r. o godzinie 12.00 I wystawa czynna od 16 stycznia do 13 marca 2016 r.</p>\n\n<h3>Nagroda Unii Europejskiej w dziedzinie architektury współczesnej – Mies van der Rohe Award 2015</h3>\n\n<p>wernisaż 15 lutego 2016 r. I wystawa czynna od 15 lutego do 27 marca 2016 r.</p>\n', 691);

-- *** STRUCTURE:`tbl_entries_data_4` ***
DROP TABLE IF EXISTS`tbl_entries_data_4`;
CREATE TABLE`tbl_entries_data_4` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_4` ***
INSERT INTO`tbl_entries_data_4` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (48, 1, 'two-sticks-main-1452273244.png', 44991, 'image/png', 'a:3:{s:8:\"creation\";s:25:\"2016-01-08T18:14:04+01:00\";s:5:\"width\";i:1920;s:6:\"height\";i:628;}');
INSERT INTO`tbl_entries_data_4` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (31, 2, '3-main-1452278437.png', 32709, 'image/png', 'a:3:{s:8:\"creation\";s:25:\"2016-01-08T19:40:37+01:00\";s:5:\"width\";i:963;s:6:\"height\";i:579;}');
INSERT INTO`tbl_entries_data_4` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (47, 3, '2-main-1452339795.png', 598922, 'image/png', 'a:3:{s:8:\"creation\";s:25:\"2016-01-09T12:43:15+01:00\";s:5:\"width\";i:963;s:6:\"height\";i:600;}');
INSERT INTO`tbl_entries_data_4` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (18, 4, 'test-main-1452115566.png', 3198, 'image/png', 'a:3:{s:8:\"creation\";s:25:\"2016-01-06T22:26:06+01:00\";s:5:\"width\";i:964;s:6:\"height\";i:540;}');
INSERT INTO`tbl_entries_data_4` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (46, 19, 'mie-main-1452341802.png', 42703, 'image/png', 'a:3:{s:8:\"creation\";s:25:\"2016-01-09T13:16:42+01:00\";s:5:\"width\";i:1920;s:6:\"height\";i:500;}');

-- *** STRUCTURE:`tbl_entries_data_5` ***
DROP TABLE IF EXISTS`tbl_entries_data_5`;
CREATE TABLE`tbl_entries_data_5` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_5` ***
INSERT INTO`tbl_entries_data_5` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (48, 1, 'two-sticks-okladka-1452092994.png', 19458, 'image/png', 'a:3:{s:8:\"creation\";s:25:\"2016-01-06T16:09:53+01:00\";s:5:\"width\";i:320;s:6:\"height\";i:180;}');
INSERT INTO`tbl_entries_data_5` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (31, 2, '3-okladka-1452094641.png', 21352, 'image/png', 'a:3:{s:8:\"creation\";s:25:\"2016-01-06T16:37:20+01:00\";s:5:\"width\";i:320;s:6:\"height\";i:438;}');
INSERT INTO`tbl_entries_data_5` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (47, 3, '2-okladka-1452097615.png', 96909, 'image/png', 'a:3:{s:8:\"creation\";s:25:\"2016-01-06T17:26:55+01:00\";s:5:\"width\";i:320;s:6:\"height\";i:180;}');
INSERT INTO`tbl_entries_data_5` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (18, 4, 'test-okladka-1452115566.png', 1310, 'image/png', 'a:3:{s:8:\"creation\";s:25:\"2016-01-06T22:26:06+01:00\";s:5:\"width\";i:320;s:6:\"height\";i:180;}');
INSERT INTO`tbl_entries_data_5` (`id`, `entry_id`, `file`, `size`, `mimetype`, `meta`) VALUES (46, 19, 'mie-okladka-1452341802.png', 32976, 'image/png', 'a:3:{s:8:\"creation\";s:25:\"2016-01-09T13:16:42+01:00\";s:5:\"width\";i:320;s:6:\"height\";i:126;}');

-- *** STRUCTURE:`tbl_entries_data_7` ***
DROP TABLE IF EXISTS`tbl_entries_data_7`;
CREATE TABLE`tbl_entries_data_7` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_7` ***
INSERT INTO`tbl_entries_data_7` (`id`, `entry_id`, `handle`, `value`) VALUES (50, 1, 'aktualne-wystawy', 'Aktualne wystawy');
INSERT INTO`tbl_entries_data_7` (`id`, `entry_id`, `handle`, `value`) VALUES (33, 2, 'aktualne-wystawy', 'Aktualne wystawy');
INSERT INTO`tbl_entries_data_7` (`id`, `entry_id`, `handle`, `value`) VALUES (49, 3, 'wystawy-stale', 'Wystawy stałe');
INSERT INTO`tbl_entries_data_7` (`id`, `entry_id`, `handle`, `value`) VALUES (20, 4, 'aktualne-wystawy', 'Aktualne wystawy');
INSERT INTO`tbl_entries_data_7` (`id`, `entry_id`, `handle`, `value`) VALUES (48, 19, 'aktualne-wystawy', 'Aktualne wystawy');

-- *** STRUCTURE:`tbl_entries_data_8` ***
DROP TABLE IF EXISTS`tbl_entries_data_8`;
CREATE TABLE`tbl_entries_data_8` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_8` ***
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `start`, `end`) VALUES (49, 1, '2015-12-03 00:00:00', '2016-01-31 00:00:00');
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `start`, `end`) VALUES (32, 2, '2015-11-17 00:00:00', '2015-12-31 00:00:00');
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `start`, `end`) VALUES (48, 3, '2015-03-02 00:00:00', '2015-11-15 00:00:00');
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `start`, `end`) VALUES (19, 4, '2016-01-06 00:00:00', '2016-01-06 00:00:00');
INSERT INTO`tbl_entries_data_8` (`id`, `entry_id`, `start`, `end`) VALUES (47, 19, '2016-01-16 00:00:00', '2017-03-13 00:00:00');

-- *** STRUCTURE:`tbl_entries_data_9` ***
DROP TABLE IF EXISTS`tbl_entries_data_9`;
CREATE TABLE`tbl_entries_data_9` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `value_formatted` text COLLATE utf8_unicode_ci,
  `word_count` int(11) unsigned DEFAULT NULL,
  `handle-en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-en` text COLLATE utf8_unicode_ci,
  `value_formatted-en` text COLLATE utf8_unicode_ci,
  `word_count-en` int(11) unsigned DEFAULT NULL,
  `handle-pl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value-pl` text COLLATE utf8_unicode_ci,
  `value_formatted-pl` text COLLATE utf8_unicode_ci,
  `word_count-pl` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle-en` (`handle-en`),
  KEY `handle-pl` (`handle-pl`),
  KEY `handle` (`handle`),
  FULLTEXT KEY `value-en` (`value-en`),
  FULLTEXT KEY `value_formatted-en` (`value_formatted-en`),
  FULLTEXT KEY `value-pl` (`value-pl`),
  FULLTEXT KEY `value_formatted-pl` (`value_formatted-pl`),
  FULLTEXT KEY `value` (`value`),
  FULLTEXT KEY `value_formatted` (`value_formatted`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA:`tbl_entries_data_9` ***
INSERT INTO`tbl_entries_data_9` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (27, 2, 'w-2015-roku-przypada-jubileusz-50-lecia-dzialalnosci-muzeum-architektury-we-wroclawiu', 'W 2015 roku przypada jubileusz 50-lecia działalności Muzeum Architektury we Wrocławiu.', '<p>W 2015 roku przypada jubileusz 50-lecia działalności Muzeum Architektury we Wrocławiu.</p>\n', 10, NULL, NULL, NULL, 0, 'w-2015-roku-przypada-jubileusz-50-lecia-dzialalnosci-muzeum-architektury-we-wroclawiu', 'W 2015 roku przypada jubileusz 50-lecia działalności Muzeum Architektury we Wrocławiu.', '<p>W 2015 roku przypada jubileusz 50-lecia działalności Muzeum Architektury we Wrocławiu.</p>\n', 10);
INSERT INTO`tbl_entries_data_9` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (44, 1, 'w-muzeum-architektury-zostanie-zaprezentowana-wystawa-two-sticks-w-ramach-think-tank-lab-triennale-miedzynarodowego-festiwalu-rysunku-wspolczesnego-wernisaz-3-grudnia-o-godzinie-18-00', 'W Muzeum Architektury zostanie zaprezentowana wystawa Two Sticks  w ramach Think Tank lab Triennale. Międzynarodowego Festiwalu Rysunku Współczesnego . Wernisaż 3 grudnia o godzinie 18.00.', '<p>W Muzeum Architektury zostanie zaprezentowana wystawa Two Sticks  w ramach Think Tank lab Triennale. Międzynarodowego Festiwalu Rysunku Współczesnego . Wernisaż 3 grudnia o godzinie 18.00.</p>\n', 22, NULL, NULL, NULL, 0, 'w-muzeum-architektury-zostanie-zaprezentowana-wystawa-two-sticks-w-ramach-think-tank-lab-triennale-miedzynarodowego-festiwalu-rysunku-wspolczesnego-wernisaz-3-grudnia-o-godzinie-18-00', 'W Muzeum Architektury zostanie zaprezentowana wystawa Two Sticks  w ramach Think Tank lab Triennale. Międzynarodowego Festiwalu Rysunku Współczesnego . Wernisaż 3 grudnia o godzinie 18.00.', '<p>W Muzeum Architektury zostanie zaprezentowana wystawa Two Sticks  w ramach Think Tank lab Triennale. Międzynarodowego Festiwalu Rysunku Współczesnego . Wernisaż 3 grudnia o godzinie 18.00.</p>\n', 22);
INSERT INTO`tbl_entries_data_9` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (43, 3, 'zapraszamy-na-nowo-otwarta-stala-wystawe-architektoniczne-rzemioslo-artystyczne-od-xii-do-xx-wieku', 'Zapraszamy na nowo otwartą stałą wystawę \"Architektoniczne rzemiosło artystyczne od XII do XX wieku\".', '<p>Zapraszamy na nowo otwartą stałą wystawę &#8220;Architektoniczne rzemiosło artystyczne od XII do XX wieku&#8221;.</p>\n', 14, NULL, NULL, NULL, 0, 'zapraszamy-na-nowo-otwarta-stala-wystawe-architektoniczne-rzemioslo-artystyczne-od-xii-do-xx-wieku', 'Zapraszamy na nowo otwartą stałą wystawę \"Architektoniczne rzemiosło artystyczne od XII do XX wieku\".', '<p>Zapraszamy na nowo otwartą stałą wystawę &#8220;Architektoniczne rzemiosło artystyczne od XII do XX wieku&#8221;.</p>\n', 14);
INSERT INTO`tbl_entries_data_9` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (14, 4, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit-sed-do-eiusmod-tempor-incididunt-ut-labore-et-dolore-magna-aliqua-ut-enim-ad-minim-veniam-quis-nostrud-exercitation-ullamco-laboris-nisi-ut-aliquip-ex-ea-commodo-consequat-duis-aute-irure-dolor-in-r', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n', 69, NULL, NULL, NULL, 0, 'lorem-ipsum-dolor-sit-amet-consectetur-adipiscing-elit-sed-do-eiusmod-tempor-incididunt-ut-labore-et-dolore-magna-aliqua-ut-enim-ad-minim-veniam-quis-nostrud-exercitation-ullamco-laboris-nisi-ut-aliquip-ex-ea-commodo-consequat-duis-aute-irure-dolor-in-r', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\n', 69);
INSERT INTO`tbl_entries_data_9` (`id`, `entry_id`, `handle`, `value`, `value_formatted`, `word_count`, `handle-en`, `value-en`, `value_formatted-en`, `word_count-en`, `handle-pl`, `value-pl`, `value_formatted-pl`, `word_count-pl`) VALUES (42, 19, 'ikony-wspolczesnej-architektury-dziela-najlepszych-architektow-i-biur-projektowych-z-calej-europy-realizacje-ktore-trwale-zmienily-oblicza-dzisiejszych-miast-ponad-3-tysiace-takich-budynkow-zaprezentuje-wystawa-made-in-europe-inaugurujaca-program-europe', 'Ikony współczesnej architektury, dzieła najlepszych architektów i biur projektowych z całej Europy, realizacje, które trwale zmieniły oblicza dzisiejszych miast.  Ponad 3 tysiące takich budynków zaprezentuje wystawa Made in Europe inaugurująca program Europejskiej Stolicy Kultury Wrocław 2016, którą 16 stycznia 2016 roku otworzy Muzeum Architektury we Wrocławiu.', '<p>Ikony współczesnej architektury, dzieła najlepszych architektów i biur projektowych z całej Europy, realizacje, które trwale zmieniły oblicza dzisiejszych miast.  Ponad 3 tysiące takich budynków zaprezentuje wystawa Made in Europe inaugurująca program Europejskiej Stolicy Kultury Wrocław 2016, którą 16 stycznia 2016 roku otworzy Muzeum Architektury we Wrocławiu.</p>\n', 42, NULL, NULL, NULL, 0, 'ikony-wspolczesnej-architektury-dziela-najlepszych-architektow-i-biur-projektowych-z-calej-europy-realizacje-ktore-trwale-zmienily-oblicza-dzisiejszych-miast-ponad-3-tysiace-takich-budynkow-zaprezentuje-wystawa-made-in-europe-inaugurujaca-program-europe', 'Ikony współczesnej architektury, dzieła najlepszych architektów i biur projektowych z całej Europy, realizacje, które trwale zmieniły oblicza dzisiejszych miast.  Ponad 3 tysiące takich budynków zaprezentuje wystawa Made in Europe inaugurująca program Europejskiej Stolicy Kultury Wrocław 2016, którą 16 stycznia 2016 roku otworzy Muzeum Architektury we Wrocławiu.', '<p>Ikony współczesnej architektury, dzieła najlepszych architektów i biur projektowych z całej Europy, realizacje, które trwale zmieniły oblicza dzisiejszych miast.  Ponad 3 tysiące takich budynków zaprezentuje wystawa Made in Europe inaugurująca program Europejskiej Stolicy Kultury Wrocław 2016, którą 16 stycznia 2016 roku otworzy Muzeum Architektury we Wrocławiu.</p>\n', 42);

-- *** DATA:`tbl_entries` ***
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (1, 1, 1, '2016-01-06 16:09:54', '2016-01-06 15:09:54', '2016-01-09 13:18:37', '2016-01-09 12:18:37');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (2, 1, 1, '2016-01-06 16:19:13', '2016-01-06 15:19:13', '2016-01-08 22:06:06', '2016-01-08 21:06:06');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (3, 1, 1, '2016-01-06 17:26:55', '2016-01-06 16:26:55', '2016-01-09 13:18:07', '2016-01-09 12:18:07');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (4, 1, 1, '2016-01-06 22:26:06', '2016-01-06 21:26:06', '2016-01-08 15:44:00', '2016-01-08 14:44:00');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (7, 2, 1, '2016-01-06 23:32:54', '2016-01-06 22:32:54', '2016-01-06 23:32:54', '2016-01-06 22:32:54');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (6, 2, 1, '2016-01-06 23:31:28', '2016-01-06 22:31:28', '2016-01-06 23:31:28', '2016-01-06 22:31:28');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (8, 3, 1, '2016-01-06 23:38:08', '2016-01-06 22:38:08', '2016-01-09 02:01:37', '2016-01-09 01:01:37');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (9, 4, 1, '2016-01-07 16:35:00', '2016-01-07 15:35:00', '2016-01-07 19:04:25', '2016-01-07 18:04:25');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (13, 6, 1, '2016-01-07 18:03:03', '2016-01-07 17:03:03', '2016-01-08 23:43:43', '2016-01-08 22:43:43');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (11, 4, 1, '2016-01-07 16:41:41', '2016-01-07 15:41:41', '2016-01-07 16:41:41', '2016-01-07 15:41:41');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (14, 7, 1, '2016-01-08 15:27:40', '2016-01-08 14:27:40', '2016-01-08 15:27:40', '2016-01-08 14:27:40');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (15, 7, 1, '2016-01-08 16:25:07', '2016-01-08 15:25:07', '2016-01-08 16:25:07', '2016-01-08 15:25:07');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (16, 7, 1, '2016-01-08 19:29:09', '2016-01-08 18:29:09', '2016-01-08 19:29:09', '2016-01-08 18:29:09');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (17, 2, 1, '2016-01-09 01:55:10', '2016-01-09 00:55:10', '2016-01-09 01:55:46', '2016-01-09 00:55:46');
INSERT INTO`tbl_entries` (`id`, `section_id`, `author_id`, `creation_date`, `creation_date_gmt`, `modification_date`, `modification_date_gmt`) VALUES (19, 1, 1, '2016-01-09 13:16:42', '2016-01-09 12:16:42', '2016-01-09 13:17:42', '2016-01-09 12:17:42');

-- *** DATA:`tbl_extensions` ***
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (1, 'debugdevkit', 'enabled', '1.3.3');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (2, 'export_ensemble', 'enabled', '2.1.2');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (3, 'jit_image_manipulation', 'enabled', 1.42);
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (4, 'maintenance_mode', 'enabled', '1.8.3');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (5, 'markdown', 'enabled', 1.21);
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (6, 'profiledevkit', 'enabled', '1.5.2');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (7, 'selectbox_link_field', 'enabled', 1.33);
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (8, 'xssfilter', 'enabled', '1.4.1');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (9, 'languages', 'enabled', 1.2);
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (10, 'frontend_localisation', 'enabled', '2.6.3');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (11, 'flang_detection_gtlds', 'enabled', 1.1);
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (12, 'textboxfield', 'enabled', '2.3.3');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (13, 'multilingual_field', 'enabled', '3.5.3');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (14, 'page_lhandles', 'enabled', 2.9);
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (15, 'association_field', 'enabled', '1.0.1');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (16, 'editor_for_symphony', 'enabled', '0.3.2');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (17, 'html5_doctype', 'enabled', '1.3.4');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (18, 'image_preview', 'enabled', '2.3.2');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (19, 'link_preview', 'enabled', '1.2.3');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (20, 'order_entries', 'enabled', '2.3.3');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (21, 'save_and_return', 'enabled', '1.8.1');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (22, 'association_output', 'enabled', '1.2.0');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (23, 'association_ui_editor', 'enabled', '1.1.0');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (24, 'association_ui_selector', 'enabled', '1.2.1');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (25, 'limit_section_entries', 'enabled', '1.1.1');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (26, 'ajax_checkbox', 'enabled', '1.3.1');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (28, 'datetime', 'enabled', '3.5.2');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (29, 'image_upload', 'enabled', '1.6.2');
INSERT INTO`tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (30, 'multiuploadfield', 'enabled', '1.6.0');

-- *** DATA:`tbl_extensions_delegates` ***
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (1, 1, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (2, 1, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (3, 2, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (4, 3, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (5, 3, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (6, 4, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (7, 4, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (8, 4, '/system/preferences/', 'CustomActions', '__toggleMaintenanceMode');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (9, 4, '/backend/', 'AppendPageAlert', '__appendAlert');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (10, 4, '/blueprints/pages/', 'AppendPageContent', '__appendType');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (11, 4, '/frontend/', 'FrontendPrePageResolve', '__checkForMaintenanceMode');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (12, 4, '/frontend/', 'FrontendParamsResolve', '__addParam');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (13, 6, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (14, 6, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (15, 8, '/blueprints/events/', 'AppendEventFilterDocumentation', 'appendEventFilterDocumentation');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (16, 8, '/blueprints/events/new/', 'AppendEventFilter', 'appendEventFilter');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (17, 8, '/blueprints/events/edit/', 'AppendEventFilter', 'appendEventFilter');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (18, 8, '/frontend/', 'EventPreSaveFilter', 'eventPreSaveFilter');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (19, 8, '/frontend/', 'FrontendParamsResolve', 'frontendParamsResolve');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (20, 9, '/frontend/', 'ManageEXSLFunctions', 'dManageEXSLFunctions');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (21, 10, '/frontend/', 'FrontendInitialised', 'dFrontendInitialised');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (22, 10, '/frontend/', 'FrontendParamsPostResolve', 'dFrontendParamsPostResolve');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (23, 10, '/backend/', 'AdminPagePreBuild', 'dAdminPagePreBuild');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (24, 10, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'dAddCustomPreferenceFieldsets');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (25, 10, '/system/preferences/', 'Save', 'dSave');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (26, 11, '/extensions/frontend_localisation/', 'FLSavePreferences', 'dFLSavePreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (27, 13, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'dAddCustomPreferenceFieldsets');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (28, 13, '/extensions/frontend_localisation/', 'FLSavePreferences', 'dFLSavePreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (29, 14, '/blueprints/pages/', 'AppendPageContent', 'dAppendPageContent');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (30, 14, '/frontend/', 'FrontendPrePageResolve', 'dFrontendPrePageResolve');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (31, 14, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'dAddCustomPreferenceFieldsets');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (32, 14, '/system/preferences/', 'CustomActions', 'dCustomActions');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (33, 14, '/extensions/frontend_localisation/', 'FLSavePreferences', 'dFLSavePreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (34, 14, '/backend/', 'AppendPageAlert', 'dAppendPageAlert');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (35, 14, '/blueprints/datasources/', 'DatasourcePreCreate', 'dDatasourceNavigation');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (36, 14, '/blueprints/pages/', 'PagePreCreate', 'dPagePre');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (37, 14, '/blueprints/pages/', 'PagePreEdit', 'dPagePre');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (38, 15, '/backend/', 'InitaliseAdminPageHead', 'appendAssets');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (76, 16, '/backend/', 'InitaliseAdminPageHead', 'initaliseAdminPageHead');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (40, 17, '/frontend/', 'FrontendOutputPostGenerate', 'parse_html');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (41, 17, '/frontend/', 'FrontendPageResolved', 'setRenderTrigger');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (42, 17, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (43, 18, '/backend/', 'InitaliseAdminPageHead', 'appendJS');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (44, 19, '/backend/', 'InitaliseAdminPageHead', 'appendResources');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (45, 20, '/backend/', 'InitialiseAdminPageHead', 'prepareIndex');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (46, 20, '/backend/', 'AdminPagePreGenerate', 'adjustTable');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (47, 20, '/backend/', 'AdminPagePostGenerate', 'resetPagination');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (48, 20, '/frontend/', 'DataSourcePreExecute', 'saveFilterContext');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (49, 21, '/backend/', 'InitaliseAdminPageHead', 'appendJS');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (50, 21, '/backend/', 'AdminPagePreGenerate', 'appendElement');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (51, 21, '/publish/edit/', 'EntryPostEdit', 'entryPostEdit');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (52, 21, '/publish/new/', 'EntryPostCreate', 'entryPostEdit');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (53, 22, '/frontend/', 'DataSourcePreExecute', 'setOutputParameters');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (54, 22, '/frontend/', 'DataSourcePostExecute', 'appendAssociatedEntries');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (55, 22, '/backend/', 'AdminPagePreGenerate', 'buildEditor');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (56, 22, '/blueprints/datasources/', 'DatasourcePreCreate', 'saveDataSource');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (57, 22, '/blueprints/datasources/', 'DatasourcePreEdit', 'saveDataSource');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (58, 23, '/backend/', 'InitaliseAdminPageHead', 'appendAssets');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (59, 24, '/backend/', 'InitaliseAdminPageHead', 'appendAssets');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (60, 25, '/backend/', 'InitaliseAdminPageHead', 'dInitaliseAdminPageHead');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (61, 25, '/backend/', 'AppendPageAlert', 'dAppendPageAlert');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (62, 25, '/backend/', 'AdminPagePreGenerate', 'dAdminPagePreGenerate');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (63, 25, '/blueprints/sections/', 'AddSectionElements', 'dAddSectionElements');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (64, 25, '/blueprints/sections/', 'SectionPreCreate', 'dSaveSectionSettings');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (65, 25, '/blueprints/sections/', 'SectionPreEdit', 'dSaveSectionSettings');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (66, 26, '/backend/', 'InitaliseAdminPageHead', 'appendToHead');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (75, 28, '/system/preferences/', 'Save', '__savePreferences');
INSERT INTO`tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (74, 28, '/system/preferences/', 'AddCustomPreferenceFieldsets', '__addPreferences');

-- *** DATA:`tbl_fields` ***
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (1, 'Tytuł', 'title', 'multilingual_textbox', 1, 'no', 0, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (2, 'Podtytuł', 'subtitle', 'multilingual_textbox', 1, 'no', 1, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (3, 'Artykuł', 'article', 'multilingual_textbox', 1, 'no', 4, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (4, 'Główny obraz', 'main-image', 'image_upload', 1, 'no', 2, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (5, 'Okładka', 'cover-image', 'image_upload', 1, 'no', 5, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (8, 'Kalendarz', 'kalendar', 'datetime', 1, 'yes', 9, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (7, 'Kateroria', 'category', 'select', 1, 'yes', 6, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (9, 'Lead', 'lead', 'multilingual_textbox', 1, 'no', 10, 'sidebar', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (10, 'Podgląd głównego obrazu', 'main-image-preview', 'image_preview_settings', 1, 'no', 11, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (13, 'Order', 'order', 'order_entries', 1, 'no', 12, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (14, 'Badge', 'badge', 'select', 1, 'no', 7, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (15, 'Nazwa', 'nazwa', 'multilingual_textbox', 2, 'yes', 0, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (16, 'Adres', 'adres', 'multilingual_textbox', 2, 'no', 1, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (17, 'Linki', 'linki', 'association', 3, 'yes', 0, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (18, 'Prawa kolumna', 'prawa-kolumna', 'multilingual_textbox', 3, 'yes', 1, 'sidebar', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (19, 'Link do artykułu', 'link', 'association', 4, 'yes', 2, 'sidebar', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (20, 'Obraz', 'image', 'image_upload', 4, 'yes', 3, 'sidebar', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (21, 'Tytuł', 'title', 'multilingual_textbox', 4, 'no', 0, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (22, 'Opis', 'text-box', 'multilingual_textbox', 4, 'no', 1, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (23, 'Slajdy', 'slides', 'association', 6, 'yes', 0, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (24, 'Publikuj', 'publish', 'checkbox', 6, 'no', 1, 'sidebar', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (25, 'Data', 'date', 'multilingual_textbox', 1, 'no', 8, 'sidebar', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (26, 'Słowo', 'word', 'multilingual_textbox', 7, 'yes', 0, 'main', 'yes');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (27, 'Obrazki w tekście', 'inline-images', 'multiupload', 1, 'no', 3, 'main', 'no');
INSERT INTO`tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (28, 'Test', 'test', 'select', 1, 'no', 13, 'sidebar', 'yes');

-- *** DATA:`tbl_pages` ***
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`, `plh_t-en`, `plh_h-en`, `plh_t-pl`, `plh_h-pl`) VALUES (1, NULL, 'Home', 'home', NULL, NULL, 'fl_languages,plh_page,news,main_menu,highlight,dictionary', NULL, 1, 'Home', 'home', 'Home', 'home');
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`, `plh_t-en`, `plh_h-en`, `plh_t-pl`, `plh_h-pl`) VALUES (2, NULL, 'Wystawy', 'exibitions', NULL, NULL, 'dictionary,exhibition,exhibitions,fl_languages,main_menu,plh_page', NULL, 2, 'Exhibitions', 'exhibitions', 'Wystawy', 'wystawy');
INSERT INTO`tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`, `plh_t-en`, `plh_h-en`, `plh_t-pl`, `plh_h-pl`) VALUES (3, NULL, 'Artykuł', 'article', NULL, 'title', 'dictionary,exhibition,fl_languages,main_menu,plh_page', NULL, 3, 'Article', 'article', 'Artykuł', 'artykul');

-- *** DATA:`tbl_pages_types` ***
INSERT INTO`tbl_pages_types` (`id`, `page_id`, `type`) VALUES (3, 1, 'index');

-- *** DATA:`tbl_sections` ***
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `max_entries`, `filter`, `navigation_group`) VALUES (1, 'Wystawy', 'wystawy', 1, 'no', 0, 'no', 'Artykuły');
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `max_entries`, `filter`, `navigation_group`) VALUES (2, 'Linki menu', 'linki-menu', 2, 'no', 0, 'no', 'Artykuły');
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `max_entries`, `filter`, `navigation_group`) VALUES (3, 'Menu', 'menu', 3, 'no', 1, 'no', 'Artykuły');
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `max_entries`, `filter`, `navigation_group`) VALUES (4, 'Highlight element', 'highlight-element', 4, 'no', 0, 'no', 'Artykuły');
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `max_entries`, `filter`, `navigation_group`) VALUES (6, 'Highlight', 'highlight', 5, 'no', 1, 'no', 'Artykuły');
INSERT INTO`tbl_sections` (`id`, `name`, `handle`, `sortorder`, `hidden`, `max_entries`, `filter`, `navigation_group`) VALUES (7, 'Słownik', 'dictionary', 6, 'no', 0, 'no', 'Artykuły');

-- *** DATA:`tbl_sections_association` ***
INSERT INTO`tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`, `interface`, `editor`) VALUES (1, 2, 15, 3, 17, 'yes', 'aui-selector-sortable', 'aui-editor-new');
INSERT INTO`tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`, `interface`, `editor`) VALUES (13, 1, 1, 4, 19, 'yes', 'aui-selector', NULL);
INSERT INTO`tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`, `interface`, `editor`) VALUES (14, 4, 21, 6, 23, 'yes', 'aui-selector-sortable', 'aui-editor-new');
